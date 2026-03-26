package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.Product;

public interface ProductService {

    IPage<Product> selectPage(Integer pageNum, Integer pageSize, String name, Long categoryId, Integer status);

    Product getById(Long id);

    boolean addProduct(Product product);

    boolean updateProduct(Product product);

    boolean deleteProduct(Long id);

    boolean updateStatus(Long id, Integer status);
}