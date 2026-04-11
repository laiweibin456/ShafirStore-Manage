package com.shafir.store.service;

import com.shafir.store.entity.ReservationOrder;
import com.shafir.store.entity.ReservationOrderItem;

import java.util.List;
import java.util.Map;

public interface ReservationOrderService {

    Map<String, Object> createOrder(List<Long> productIds, List<Integer> quantities,
                                     String pickupTime, String remark, Long userId, Integer userType);

    List<ReservationOrder> listByUserId(Long userId, Integer userType, Integer status);

    ReservationOrder getDetail(Long orderId);

    Map<String, Object> completeOrder(Long orderId);

    boolean cancelOrder(Long orderId);
}