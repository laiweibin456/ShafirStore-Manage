package com.shafir.store.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.shafir.store.entity.ReservationOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ReservationOrderRepository extends BaseMapper<ReservationOrder> {

    @Select("SELECT COALESCE(MAX(id), 0) FROM reservation_order")
    Long getMaxId();

    List<ReservationOrder> selectByUserId(Long userId);

    List<ReservationOrder> selectByUserIdAndStatus(Long userId, Integer status);
}