package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.*;
import com.shafir.store.repository.*;
import com.shafir.store.service.InventoryService;
import com.shafir.store.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final ProductRepository productRepository;
    private final InventoryService inventoryService;
    private final UserRepository userRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Order createOrder(List<Long> productIds, List<Integer> quantities, Long memberId,
                            Integer payType, Long operatorId, String remark) {
        if (productIds == null || productIds.isEmpty()) {
            throw new BusinessException("请选择商品");
        }

        if (quantities == null || quantities.size() != productIds.size()) {
            throw new BusinessException("商品数量参数错误");
        }

        Order order = new Order();
        order.setOrderNo(generateOrderNo());
        order.setMemberId(memberId);
        order.setPayType(payType);
        order.setOperatorId(operatorId);
        order.setRemark(remark);
        order.setStatus(1);
        order.setOrderType(1);
        order.setCreateTime(LocalDateTime.now());

        BigDecimal totalAmount = BigDecimal.ZERO;
        List<OrderItem> orderItems = new ArrayList<>();

        for (int i = 0; i < productIds.size(); i++) {
            Long productId = productIds.get(i);
            Integer quantity = quantities.get(i);

            Product product = productRepository.selectById(productId);
            if (product == null) {
                throw new BusinessException("商品不存在，ID：" + productId);
            }

            if (product.getStatus() != 1) {
                throw new BusinessException("商品【" + product.getName() + "】已下架");
            }

            Inventory inventory = inventoryService.getByProductId(productId);
            if (inventory == null || inventory.getQuantity() < quantity) {
                throw new BusinessException("商品【" + product.getName() + "】库存不足，当前库存：" +
                        (inventory != null ? inventory.getQuantity() : 0));
            }

            BigDecimal subtotal = product.getPrice().multiply(BigDecimal.valueOf(quantity));

            OrderItem item = new OrderItem();
            item.setProductId(productId);
            item.setProductName(product.getName());
            item.setPrice(product.getPrice());
            item.setQuantity(quantity);
            item.setSubtotal(subtotal);
            item.setUnit(product.getUnit());
            item.setCreateTime(LocalDateTime.now());
            orderItems.add(item);

            totalAmount = totalAmount.add(subtotal);
        }

        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(BigDecimal.ZERO);
        order.setPayAmount(totalAmount);
        order.setPointsDiscount(BigDecimal.ZERO);

        orderRepository.insert(order);

        for (OrderItem item : orderItems) {
            item.setOrderId(order.getId());
            orderItemRepository.insert(item);

            inventoryService.stockOut(
                    item.getProductId(),
                    item.getQuantity(),
                    operatorId,
                    order.getId(),
                    "销售出库，订单号：" + order.getOrderNo()
            );
        }

        return getOrderDetail(order.getId());
    }

    @Override
    public IPage<Order> selectPage(Integer pageNum, Integer pageSize, String orderNo, Integer status) {
        Page<Order> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();

        if (orderNo != null && !orderNo.isEmpty()) {
            wrapper.eq(Order::getOrderNo, orderNo);
        }
        if (status != null) {
            wrapper.eq(Order::getStatus, status);
        }

        wrapper.orderByDesc(Order::getCreateTime);
        IPage<Order> resultPage = orderRepository.selectPage(page, wrapper);

        List<Order> records = resultPage.getRecords();
        if (records != null && !records.isEmpty()) {
            for (Order order : records) {
                enrichOrderInfo(order);
            }
        }

        return resultPage;
    }

    @Override
    public Order getById(Long id) {
        Order order = orderRepository.selectById(id);
        if (order != null) {
            enrichOrderInfo(order);
        }
        return order;
    }

    @Override
    public Order getOrderDetail(Long id) {
        Order order = orderRepository.selectById(id);
        if (order == null) {
            return null;
        }

        enrichOrderInfo(order);

        LambdaQueryWrapper<OrderItem> itemWrapper = new LambdaQueryWrapper<>();
        itemWrapper.eq(OrderItem::getOrderId, id);
        List<OrderItem> items = orderItemRepository.selectList(itemWrapper);
        order.setItems(items);

        return order;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean cancelOrder(Long id, Long operatorId) {
        Order order = orderRepository.selectById(id);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        if (order.getStatus() != 1) {
            throw new BusinessException("订单状态不允许取消");
        }

        LambdaQueryWrapper<OrderItem> itemWrapper = new LambdaQueryWrapper<>();
        itemWrapper.eq(OrderItem::getOrderId, id);
        List<OrderItem> items = orderItemRepository.selectList(itemWrapper);

        for (OrderItem item : items) {
            inventoryService.stockIn(
                    item.getProductId(),
                    item.getQuantity(),
                    operatorId,
                    "订单取消退回，订单号：" + order.getOrderNo()
            );
        }

        order.setStatus(3);
        order.setUpdateTime(LocalDateTime.now());
        orderRepository.updateById(order);

        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean refundOrder(Long id, String reason, Long operatorId) {
        Order order = orderRepository.selectById(id);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        if (order.getStatus() != 1 && order.getStatus() != 2) {
            throw new BusinessException("订单状态不允许退款");
        }

        LambdaQueryWrapper<OrderItem> itemWrapper = new LambdaQueryWrapper<>();
        itemWrapper.eq(OrderItem::getOrderId, id);
        List<OrderItem> items = orderItemRepository.selectList(itemWrapper);

        for (OrderItem item : items) {
            inventoryService.stockIn(
                    item.getProductId(),
                    item.getQuantity(),
                    operatorId,
                    "订单退款退回，订单号：" + order.getOrderNo() + "，原因：" + reason
            );
        }

        order.setStatus(4);
        order.setRemark((order.getRemark() != null ? order.getRemark() : "") + " | 退款原因：" + reason);
        order.setUpdateTime(LocalDateTime.now());
        orderRepository.updateById(order);

        return true;
    }

    @Override
    public int getTodayOrderCount() {
        LocalDateTime startOfDay = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        LocalDateTime endOfDay = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);

        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.between(Order::getCreateTime, startOfDay, endOfDay);
        wrapper.eq(Order::getStatus, 1);

        return orderRepository.selectCount(wrapper).intValue();
    }

    @Override
    public BigDecimal getTodaySalesAmount() {
        LocalDateTime startOfDay = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        LocalDateTime endOfDay = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);

        LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
        wrapper.between(Order::getCreateTime, startOfDay, endOfDay);
        wrapper.eq(Order::getStatus, 1);

        List<Order> orders = orderRepository.selectList(wrapper);
        BigDecimal total = BigDecimal.ZERO;
        for (Order order : orders) {
            if (order.getPayAmount() != null) {
                total = total.add(order.getPayAmount());
            }
        }
        return total;
    }

    private void enrichOrderInfo(Order order) {
        if (order.getOperatorId() != null) {
            User operator = userRepository.selectById(order.getOperatorId());
            if (operator != null) {
                order.setOperatorName(operator.getRealName());
            }
        }
    }

    private String generateOrderNo() {
        String date = java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.BASIC_ISO_DATE);
        String random = String.format("%04d", (int) (Math.random() * 10000));
        return "ORD" + date + random;
    }
}