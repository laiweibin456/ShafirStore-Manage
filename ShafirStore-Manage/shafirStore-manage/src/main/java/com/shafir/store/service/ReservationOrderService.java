package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.ReservationOrder;
import com.shafir.store.entity.ReservationOrderItem;

import java.util.List;
import java.util.Map;

public interface ReservationOrderService {

    Map<String, Object> createOrder(List<Long> productIds, List<Integer> quantities,
                                     String pickupTime, String remark, Long userId, Integer userType, 
                                     Integer pointsDeduct, List<Map<String, Object>> itemDetails);

    List<ReservationOrder> listByUserId(Long userId, Integer userType, Integer status);

    ReservationOrder getDetail(Long orderId);

    Map<String, Object> completeOrder(Long orderId);

    boolean cancelOrder(Long orderId);

    IPage<ReservationOrder> listByStoreId(Integer pageNum, Integer pageSize, Integer status, String orderNo, String phone);

    Map<String, Object> confirmPayment(Long orderId, Integer payType);
}