package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.Inventory;
import com.shafir.store.entity.InventoryRecord;
import com.shafir.store.entity.Product;
import com.shafir.store.entity.ProductCategory;
import com.shafir.store.repository.InventoryRecordRepository;
import com.shafir.store.repository.InventoryRepository;
import com.shafir.store.repository.ProductCategoryRepository;
import com.shafir.store.repository.ProductRepository;
import com.shafir.store.service.InventoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class InventoryServiceImpl implements InventoryService {

    private final InventoryRepository inventoryRepository;
    private final InventoryRecordRepository inventoryRecordRepository;
    private final ProductRepository productRepository;
    private final ProductCategoryRepository categoryRepository;

    @Override
    public IPage<Inventory> selectPage(Integer pageNum, Integer pageSize, String productName, Long categoryId) {
        Page<Inventory> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Inventory> wrapper = new LambdaQueryWrapper<>();

        wrapper.orderByDesc(Inventory::getUpdateTime);
        IPage<Inventory> resultPage = inventoryRepository.selectPage(page, wrapper);

        List<Inventory> records = resultPage.getRecords();
        if (records != null && !records.isEmpty()) {
            List<Long> productIds = records.stream().map(Inventory::getProductId).collect(Collectors.toList());
            List<Product> products = productRepository.selectBatchIds(productIds);

            Map<Long, Product> productMap = products.stream()
                    .collect(Collectors.toMap(Product::getId, p -> p));

            Map<Long, String> categoryNames = products.stream()
                    .filter(p -> p.getCategoryId() != null)
                    .map(p -> {
                        ProductCategory category = categoryRepository.selectById(p.getCategoryId());
                        return category != null ? Map.entry(p.getId(), category.getName()) : null;
                    })
                    .filter(e -> e != null)
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

            for (Inventory inv : records) {
                Product product = productMap.get(inv.getProductId());
                if (product != null) {
                    inv.setProductName(product.getName());
                    inv.setUnit(product.getUnit());
                    inv.setPrice(product.getPrice());
                    if (product.getCategoryId() != null) {
                        inv.setCategoryName(categoryNames.get(product.getId()));
                    }
                    inv.setIsLowStock(inv.getQuantity() < inv.getAlertThreshold());
                    if (product.getPrice() != null && inv.getQuantity() != null) {
                        inv.setStockValue(product.getPrice().multiply(BigDecimal.valueOf(inv.getQuantity())));
                    }
                }
            }
        }

        return resultPage;
    }

    @Override
    public Inventory getByProductId(Long productId) {
        Inventory inventory = inventoryRepository.selectOne(
                new LambdaQueryWrapper<Inventory>().eq(Inventory::getProductId, productId)
        );
        if (inventory != null) {
            Product product = productRepository.selectById(productId);
            if (product != null) {
                inventory.setProductName(product.getName());
                inventory.setUnit(product.getUnit());
                inventory.setPrice(product.getPrice());
                inventory.setIsLowStock(inventory.getQuantity() < inventory.getAlertThreshold());
            }
        }
        return inventory;
    }

    @Override
    @Transactional
    public boolean stockIn(Long productId, Integer quantity, Long operatorId, String remark) {
        Inventory inventory = getOrCreateInventory(productId);

        int beforeQuantity = inventory.getQuantity();
        int afterQuantity = beforeQuantity + quantity;

        inventory.setQuantity(afterQuantity);
        inventory.setLastInTime(LocalDateTime.now());
        inventoryRepository.updateById(inventory);

        saveRecord(productId, 1, quantity, beforeQuantity, afterQuantity, null, operatorId, remark);

        return true;
    }

    @Override
    @Transactional
    public boolean stockOut(Long productId, Integer quantity, Long operatorId, Long orderId, String remark) {
        Inventory inventory = getOrCreateInventory(productId);

        int beforeQuantity = inventory.getQuantity();
        int afterQuantity = beforeQuantity - quantity;

        if (afterQuantity < 0) {
            throw new BusinessException("库存不足，当前库存：" + beforeQuantity + "，需要出库：" + quantity);
        }

        inventory.setQuantity(afterQuantity);
        inventory.setLastOutTime(LocalDateTime.now());
        inventoryRepository.updateById(inventory);

        saveRecord(productId, 2, quantity, beforeQuantity, afterQuantity, orderId, operatorId, remark);

        return true;
    }

    @Override
    @Transactional
    public boolean adjustStock(Long productId, Integer quantity, Integer beforeQuantity, Long operatorId, String remark) {
        Inventory inventory = getOrCreateInventory(productId);

        int actualBeforeQuantity = inventory.getQuantity();
        int afterQuantity = quantity;

        inventory.setQuantity(afterQuantity);
        inventoryRepository.updateById(inventory);

        saveRecord(productId, 3, afterQuantity - actualBeforeQuantity, actualBeforeQuantity, afterQuantity, null, operatorId, remark);

        return true;
    }

    @Override
    public IPage<InventoryRecord> getRecords(Integer pageNum, Integer pageSize, Long productId, Integer type) {
        Page<InventoryRecord> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<InventoryRecord> wrapper = new LambdaQueryWrapper<>();

        if (productId != null) {
            wrapper.eq(InventoryRecord::getProductId, productId);
        }
        if (type != null) {
            wrapper.eq(InventoryRecord::getType, type);
        }

        wrapper.orderByDesc(InventoryRecord::getCreateTime);
        IPage<InventoryRecord> resultPage = inventoryRecordRepository.selectPage(page, wrapper);

        List<InventoryRecord> records = resultPage.getRecords();
        if (records != null && !records.isEmpty()) {
            List<Long> productIds = records.stream().map(InventoryRecord::getProductId).collect(Collectors.toList());
            List<Product> products = productRepository.selectBatchIds(productIds);
            Map<Long, String> productMap = products.stream()
                    .collect(Collectors.toMap(Product::getId, Product::getName));

            for (InventoryRecord record : records) {
                record.setProductName(productMap.get(record.getProductId()));
            }
        }

        return resultPage;
    }

    @Override
    public List<Inventory> getLowStockAlerts() {
        LambdaQueryWrapper<Inventory> wrapper = new LambdaQueryWrapper<>();
        List<Inventory> allInventories = inventoryRepository.selectList(wrapper);

        List<Inventory> lowStockList = new ArrayList<>();
        for (Inventory inv : allInventories) {
            if (inv.getQuantity() < inv.getAlertThreshold()) {
                Product product = productRepository.selectById(inv.getProductId());
                if (product != null) {
                    inv.setProductName(product.getName());
                    inv.setUnit(product.getUnit());
                    inv.setPrice(product.getPrice());
                    inv.setIsLowStock(true);
                }
                lowStockList.add(inv);
            }
        }
        return lowStockList;
    }

    @Override
    @Transactional
    public boolean updateAlertThreshold(Long productId, Integer threshold) {
        Inventory inventory = getOrCreateInventory(productId);
        inventory.setAlertThreshold(threshold);
        return inventoryRepository.updateById(inventory) > 0;
    }

    @Override
    public List<Inventory> getStatistics() {
        List<Inventory> allInventories = inventoryRepository.selectList(null);
        List<Inventory> result = new ArrayList<>();

        for (Inventory inv : allInventories) {
            Product product = productRepository.selectById(inv.getProductId());
            if (product != null) {
                inv.setProductName(product.getName());
                inv.setUnit(product.getUnit());
                inv.setPrice(product.getPrice());
                inv.setIsLowStock(inv.getQuantity() < inv.getAlertThreshold());
                if (product.getPrice() != null && inv.getQuantity() != null) {
                    inv.setStockValue(product.getPrice().multiply(BigDecimal.valueOf(inv.getQuantity())));
                }
            }
            result.add(inv);
        }
        return result;
    }

    private Inventory getOrCreateInventory(Long productId) {
        Inventory inventory = inventoryRepository.selectOne(
                new LambdaQueryWrapper<Inventory>().eq(Inventory::getProductId, productId)
        );

        if (inventory == null) {
            inventory = new Inventory();
            inventory.setProductId(productId);
            inventory.setQuantity(0);
            inventory.setAlertThreshold(10);
            inventoryRepository.insert(inventory);
        }

        return inventory;
    }

    private void saveRecord(Long productId, Integer type, Integer quantity, int beforeQuantity, int afterQuantity,
                           Long orderId, Long operatorId, String remark) {
        InventoryRecord record = new InventoryRecord();
        record.setProductId(productId);
        record.setType(type);
        record.setQuantity(quantity);
        record.setBeforeQuantity(beforeQuantity);
        record.setAfterQuantity(afterQuantity);
        record.setOrderId(orderId);
        record.setOperatorId(operatorId);
        record.setRemark(remark);
        inventoryRecordRepository.insert(record);
    }
}
