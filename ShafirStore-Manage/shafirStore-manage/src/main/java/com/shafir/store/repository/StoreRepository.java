package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.Store;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreRepository extends BaseMapper<Store> {
}
