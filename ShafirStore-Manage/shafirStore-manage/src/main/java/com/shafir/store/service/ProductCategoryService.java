package com.shafir.store.service;

import com.shafir.store.entity.ProductCategory;

import java.util.List;

public interface ProductCategoryService {

    List<ProductCategory> getAllCategories();

    ProductCategory getById(Long id);
}