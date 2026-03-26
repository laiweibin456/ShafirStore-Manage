package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.Product;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductRepository extends BaseMapper<Product> {
}