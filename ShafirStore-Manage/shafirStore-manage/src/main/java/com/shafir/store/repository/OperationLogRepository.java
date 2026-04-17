package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.OperationLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OperationLogRepository extends BaseMapper<OperationLog> {
}
