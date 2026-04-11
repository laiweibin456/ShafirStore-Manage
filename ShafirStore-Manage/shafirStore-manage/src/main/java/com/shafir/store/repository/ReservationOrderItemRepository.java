package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.ReservationOrderItem;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationOrderItemRepository extends BaseMapper<ReservationOrderItem> {
}