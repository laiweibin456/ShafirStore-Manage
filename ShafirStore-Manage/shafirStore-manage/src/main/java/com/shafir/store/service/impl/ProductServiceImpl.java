package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.entity.Product;
import com.shafir.store.entity.ProductCategory;
import com.shafir.store.repository.ProductCategoryRepository;
import com.shafir.store.repository.ProductRepository;
import com.shafir.store.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final ProductCategoryRepository categoryRepository;

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

        for (Product product : resultPage.getRecords()) {
            if (product.getCategoryId() != null) {
                ProductCategory category = categoryRepository.selectById(product.getCategoryId());
                if (category != null) {
                    product.setCategoryName(category.getName());
                }
            }
        }

        return resultPage;
    }

    @Override
    public Product getById(Long id) {
        Product product = productRepository.selectById(id);
        if (product != null && product.getCategoryId() != null) {
            ProductCategory category = categoryRepository.selectById(product.getCategoryId());
            if (category != null) {
                product.setCategoryName(category.getName());
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
        return productRepository.insert(product) > 0;
    }

    @Override
    @Transactional
    public boolean updateProduct(Product product) {
        return productRepository.updateById(product) > 0;
    }

    @Override
    @Transactional
    public boolean deleteProduct(Long id) {
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