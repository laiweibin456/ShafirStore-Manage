package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.entity.Inventory;
import com.shafir.store.entity.InventoryRecord;
import com.shafir.store.entity.Product;
import com.shafir.store.entity.ProductCategory;
import com.shafir.store.repository.InventoryRecordRepository;
import com.shafir.store.repository.InventoryRepository;
import com.shafir.store.repository.ProductCategoryRepository;
import com.shafir.store.repository.ProductRepository;
import com.shafir.store.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductCategoryRepository categoryRepository;
    private final InventoryRepository inventoryRepository;
    private final InventoryRecordRepository inventoryRecordRepository;

    @Override
    public IPage<Product> selectPage(Integer pageNum, Integer pageSize, String name, Long categoryId, Integer status) {
        Page<Product> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Product> wrapper = new LambdaQueryWrapper<>();

        if (name != null && !name.isEmpty()) {
            wrapper.like(Product::getName, name);
        }
        if (categoryId != null) {
            wrapper.eq(Product::getCategoryId, categoryId);
        }
        if (status != null) {
            wrapper.eq(Product::getStatus, status);
        }

        wrapper.orderByAsc(Product::getId);
        IPage<Product> resultPage = productRepository.selectPage(page, wrapper);

        List<Product> products = resultPage.getRecords();
        if (!products.isEmpty()) {
            List<Long> productIds = products.stream().map(Product::getId).collect(Collectors.toList());
            LambdaQueryWrapper<Inventory> invWrapper = new LambdaQueryWrapper<>();
            invWrapper.in(Inventory::getProductId, productIds);
            List<Inventory> inventories = inventoryRepository.selectList(invWrapper);
            Map<Long, Integer> stockMap = inventories.stream()
                    .collect(Collectors.toMap(Inventory::getProductId, Inventory::getQuantity, (a, b) -> a));

            for (Product product : products) {
                if (product.getCategoryId() != null) {
                    ProductCategory category = categoryRepository.selectById(product.getCategoryId());
                    if (category != null) {
                        product.setCategoryName(category.getName());
                    }
                }
                product.setStockQuantity(stockMap.getOrDefault(product.getId(), 0));
            }
        }

        return resultPage;
    }

    @Override
    public Product getById(Long id) {
        Product product = productRepository.selectById(id);
        if (product != null) {
            if (product.getCategoryId() != null) {
                ProductCategory category = categoryRepository.selectById(product.getCategoryId());
                if (category != null) {
                    product.setCategoryName(category.getName());
                }
            }
            Inventory inventory = inventoryRepository.selectOne(
                    new LambdaQueryWrapper<Inventory>().eq(Inventory::getProductId, id)
            );
            if (inventory != null) {
                product.setStockQuantity(inventory.getQuantity());
            } else {
                product.setStockQuantity(0);
            }
        }
        return product;
    }

    @Override
    @Transactional
    public boolean addProduct(Product product) {
        if (product.getStatus() == null) {
            product.setStatus(1);
        }
        if (product.getUnit() == null || product.getUnit().isEmpty()) {
            product.setUnit("个");
        }
        if (product.getStoreId() == null) {
            product.setStoreId(StoreContext.getCurrentStoreId());
        }
        int result = productRepository.insert(product);
        if (result > 0) {
            Inventory inventory = new Inventory();
            inventory.setStoreId(product.getStoreId());
            inventory.setProductId(product.getId());
            inventory.setQuantity(0);
            inventory.setAlertThreshold(10);
            inventoryRepository.insert(inventory);
        }
        return result > 0;
    }

    @Override
    @Transactional
    public boolean updateProduct(Product product) {
        return productRepository.updateById(product) > 0;
    }

    @Override
    @Transactional
    public boolean deleteProduct(Long id) {
        inventoryRepository.delete(
                new LambdaQueryWrapper<Inventory>().eq(Inventory::getProductId, id)
        );
        inventoryRecordRepository.delete(
                new LambdaQueryWrapper<InventoryRecord>().eq(InventoryRecord::getProductId, id)
        );
        return productRepository.deleteById(id) > 0;
    }

    @Override
    @Transactional
    public boolean updateStatus(Long id, Integer status) {
        Product product = new Product();
        product.setId(id);
        product.setStatus(status);
        return productRepository.updateById(product) > 0;
    }
}