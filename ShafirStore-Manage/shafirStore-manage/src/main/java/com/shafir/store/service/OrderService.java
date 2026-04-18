package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {

    Order createOrder(List<Long> productIds, List<Integer> quantities, Long memberId,
                     Integer payType, Long operatorId, String remark, Integer pointsEarned, 
                     Integer pointsDeduct, List<Map<String, Object>> itemDetails);

    IPage<Order> selectPage(Integer pageNum, Integer pageSize, String orderNo, Integer status);

    Order getById(Long id);

    Order getOrderDetail(Long id);

    boolean cancelOrder(Long id, Long operatorId);

    boolean refundOrder(Long id, String reason, Long operatorId);

    int getTodayOrderCount();

    java.math.BigDecimal getTodaySalesAmount();
}