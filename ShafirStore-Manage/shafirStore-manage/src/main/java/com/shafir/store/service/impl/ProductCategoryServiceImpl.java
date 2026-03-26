package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.shafir.store.entity.ProductCategory;
import com.shafir.store.repository.ProductCategoryRepository;
import com.shafir.store.service.ProductCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductCategoryServiceImpl implements ProductCategoryService {

    private final ProductCategoryRepository categoryRepository;

    @Override
    public List<ProductCategory> getAllCategories() {
        LambdaQueryWrapper<ProductCategory> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByAsc(ProductCategory::getSortOrder);
        return categoryRepository.selectList(wrapper);
    }

    @Override
    public ProductCategory getById(Long id) {
        return categoryRepository.selectById(id);
    }
}