package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.InventoryRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryRecordRepository extends BaseMapper<InventoryRecord> {
}
