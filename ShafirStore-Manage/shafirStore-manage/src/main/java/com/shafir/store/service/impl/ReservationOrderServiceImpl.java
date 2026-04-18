package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.*;
import com.shafir.store.repository.*;
import com.shafir.store.service.InventoryService;
import com.shafir.store.service.ProductService;
import com.shafir.store.service.ReservationOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ReservationOrderServiceImpl implements ReservationOrderService {

    private final ReservationOrderRepository reservationOrderRepository;
    private final ReservationOrderItemRepository reservationOrderItemRepository;
    private final ProductService productService;
    private final ProductRepository productRepository;
    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final MemberPointsRecordRepository memberPointsRecordRepository;
    private final MemberStoreRelRepository memberStoreRelRepository;
    private final InventoryService inventoryService;

    @Override
    @Transactional
    public Map<String, Object> createOrder(List<Long> productIds, List<Integer> quantities,
                                          String pickupTime, String remark, Long userId, Integer userType, 
                                          Integer pointsDeduct, List<Map<String, Object>> itemDetails) {
        if (productIds == null || productIds.isEmpty()) {
            throw new BusinessException("商品不能为空");
        }

        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId == null) {
            throw new BusinessException("请先选择店铺");
        }

        if (pointsDeduct != null && pointsDeduct > 0) {
            MemberStoreRel rel = memberStoreRelRepository.findByMemberIdAndStoreId(userId, storeId);
            int currentPoints = rel != null ? (rel.getPoints() != null ? rel.getPoints() : 0) : 0;
            if (currentPoints < pointsDeduct) {
                throw new BusinessException("积分不足，需要 " + pointsDeduct + " 积分，当前 " + currentPoints + " 积分");
            }
        }

        BigDecimal totalAmount = BigDecimal.ZERO;
        BigDecimal discountAmount = BigDecimal.ZERO;
        BigDecimal payAmount = BigDecimal.ZERO;
        List<ReservationOrderItem> items = new ArrayList<>();

        for (int i = 0; i < productIds.size(); i++) {
            Long productId = productIds.get(i);
            Integer quantity = quantities.get(i);

            Product product = productService.getById(productId);
            if (product == null) {
                throw new BusinessException("商品不存在: " + productId);
            }

            Inventory inventory = inventoryService.getByProductId(productId);
            if (inventory == null || inventory.getQuantity() < quantity) {
                throw new BusinessException("商品「" + product.getName() + "」库存不足，当前库存：" + (inventory != null ? inventory.getQuantity() : 0));
            }

            inventoryService.stockOut(productId, quantity, userId, null, "预约订单预占库存");

            Map<String, Object> itemDetail = itemDetails != null && i < itemDetails.size() ? itemDetails.get(i) : null;
            BigDecimal itemPrice = product.getPrice();
            BigDecimal originalPrice = null;
            Boolean isPointsExchange = false;
            Integer requiredPoints = null;

            if (itemDetail != null) {
                if (itemDetail.get("price") != null) {
                    itemPrice = new BigDecimal(itemDetail.get("price").toString());
                }
                if (itemDetail.get("originalPrice") != null) {
                    originalPrice = new BigDecimal(itemDetail.get("originalPrice").toString());
                }
                if (itemDetail.get("isPointsExchange") != null) {
                    isPointsExchange = Boolean.valueOf(itemDetail.get("isPointsExchange").toString());
                }
                if (itemDetail.get("requiredPoints") != null) {
                    requiredPoints = Integer.valueOf(itemDetail.get("requiredPoints").toString());
                }
            }

            BigDecimal subtotal = itemPrice.multiply(BigDecimal.valueOf(quantity));
            totalAmount = totalAmount.add(subtotal);

            ReservationOrderItem item = new ReservationOrderItem();
            item.setStoreId(storeId);
            item.setProductId(productId);
            item.setProductName(product.getName());
            item.setPrice(itemPrice);
            item.setOriginalPrice(originalPrice);
            item.setQuantity(quantity);
            item.setSubtotal(subtotal);
            item.setIsPointsExchange(isPointsExchange);
            item.setRequiredPoints(requiredPoints);
            item.setCreateTime(LocalDateTime.now());

            items.add(item);
        }

        BigDecimal discount = BigDecimal.ONE;
        Member member = memberRepository.selectById(userId);
        if (member != null && member.getLevel() != null) {
            LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
            levelWrapper.eq(MemberLevel::getLevel, member.getLevel());
            levelWrapper.orderByAsc(MemberLevel::getId);
            levelWrapper.last("LIMIT 1");
            MemberLevel level = memberLevelRepository.selectOne(levelWrapper);
            if (level != null && level.getDiscount() != null) {
                discount = level.getDiscount();
                discountAmount = totalAmount.multiply(BigDecimal.ONE.subtract(discount));
                payAmount = totalAmount.multiply(discount);
            }
        }
        if (payAmount.compareTo(BigDecimal.ZERO) == 0) {
            payAmount = totalAmount;
        }

        String orderNo = generateOrderNo();

        ReservationOrder order = new ReservationOrder();
        order.setStoreId(storeId);
        order.setOrderNo(orderNo);
        order.setUserId(userId);
        order.setUserType(userType);
        order.setTotalAmount(totalAmount);
        order.setDiscountAmount(discountAmount);
        order.setPayAmount(payAmount);
        order.setStatus(1);
        order.setPickupTime(pickupTime != null && !pickupTime.isEmpty()
                ? LocalDateTime.parse(pickupTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
                : null);
        order.setRemark(remark);
        order.setPointsDeduct(pointsDeduct);
        order.setCreateTime(LocalDateTime.now());
        order.setUpdateTime(LocalDateTime.now());

        reservationOrderRepository.insert(order);

        for (ReservationOrderItem item : items) {
            item.setOrderId(order.getId());
            reservationOrderItemRepository.insert(item);
        }

        if (pointsDeduct != null && pointsDeduct > 0) {
            if (member == null) {
                throw new BusinessException("会员不存在");
            }

            int currentPoints = member.getPoints() != null ? member.getPoints() : 0;
            if (currentPoints < pointsDeduct) {
                throw new BusinessException("积分不足，需要 " + pointsDeduct + " 积分，当前 " + currentPoints + " 积分");
            }

            int newPoints = currentPoints - pointsDeduct;
            member.setPoints(newPoints);
            member.setUpdateTime(LocalDateTime.now());
            memberRepository.updateById(member);

            MemberPointsRecord deductRecord = new MemberPointsRecord();
            deductRecord.setMemberId(userId);
            deductRecord.setStoreId(storeId);
            deductRecord.setType(2);
            deductRecord.setPoints(pointsDeduct);
            deductRecord.setBalance(newPoints);
            deductRecord.setRemark("积分兑换商品");
            deductRecord.setCreateTime(LocalDateTime.now());
            memberPointsRecordRepository.insert(deductRecord);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("id", order.getId());
        result.put("orderNo", order.getOrderNo());
        result.put("status", order.getStatus());
        result.put("statusName", "待取货");
        result.put("totalAmount", totalAmount);
        result.put("payAmount", payAmount);
        result.put("pickupTime", order.getPickupTime());

        return result;
    }

    @Override
    public List<ReservationOrder> listByUserId(Long userId, Integer userType, Integer status) {
        LambdaQueryWrapper<ReservationOrder> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ReservationOrder::getUserId, userId);
        wrapper.eq(ReservationOrder::getUserType, userType);
        if (status != null) {
            wrapper.eq(ReservationOrder::getStatus, status);
        }
        wrapper.orderByDesc(ReservationOrder::getCreateTime);

        List<ReservationOrder> orders = reservationOrderRepository.selectList(wrapper);

        for (ReservationOrder order : orders) {
            enrichOrderInfo(order);
            List<ReservationOrderItem> items = getOrderItems(order.getId());
            for (ReservationOrderItem item : items) {
                Product product = productRepository.selectById(item.getProductId());
                if (product != null) {
                    item.setImageUrl(product.getImageUrl());
                }
            }
            order.setItems(items);
        }

        return orders;
    }

    @Override
    public ReservationOrder getDetail(Long orderId) {
        ReservationOrder order = reservationOrderRepository.selectById(orderId);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        enrichOrderInfo(order);

        LambdaQueryWrapper<ReservationOrderItem> itemWrapper = new LambdaQueryWrapper<>();
        itemWrapper.eq(ReservationOrderItem::getOrderId, orderId);
        List<ReservationOrderItem> items = reservationOrderItemRepository.selectList(itemWrapper);
        
        for (ReservationOrderItem item : items) {
            Product product = productRepository.selectById(item.getProductId());
            if (product != null) {
                item.setImageUrl(product.getImageUrl());
            }
        }
        
        order.setItems(items);

        return order;
    }

    @Override
    @Transactional
    public Map<String, Object> completeOrder(Long orderId) {
        ReservationOrder order = reservationOrderRepository.selectById(orderId);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        if (order.getStatus() != 1) {
            throw new BusinessException("订单状态不允许完成");
        }

        order.setStatus(2);
        order.setUpdateTime(LocalDateTime.now());
        reservationOrderRepository.updateById(order);

        boolean upgraded = false;
        Integer newLevel = null;
        String newLevelName = null;

        Member member = memberRepository.selectById(order.getUserId());
        if (member != null) {
            Long storeId = order.getStoreId();
            MemberStoreRel rel = null;
            if (storeId != null) {
                rel = memberStoreRelRepository.findByMemberIdAndStoreId(member.getId(), storeId);
                if (rel == null) {
                    rel = new MemberStoreRel();
                    rel.setMemberId(member.getId());
                    rel.setStoreId(storeId);
                    rel.setTotalConsume(BigDecimal.ZERO);
                    rel.setLevel(1);
                    rel.setStatus(1);
                    rel.setCreateTime(LocalDateTime.now());
                    memberStoreRelRepository.insert(rel);
                }
            }

            BigDecimal currentConsume = rel != null ? (rel.getTotalConsume() != null ? rel.getTotalConsume() : BigDecimal.ZERO) :
                                        (member.getTotalConsume() != null ? member.getTotalConsume() : BigDecimal.ZERO);
            int currentPoints = member.getPoints() != null ? member.getPoints() : 0;

            BigDecimal newTotalConsume = currentConsume.add(order.getPayAmount());
            int earnedPoints = order.getPayAmount().divide(BigDecimal.TEN, 0, RoundingMode.DOWN).intValue();
            int newPoints = currentPoints + earnedPoints;

            LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
            levelWrapper.gt(MemberLevel::getLevel, member.getLevel() != null ? member.getLevel() : 0);
            levelWrapper.le(MemberLevel::getMinAmount, newTotalConsume);
            levelWrapper.orderByAsc(MemberLevel::getLevel);
            levelWrapper.last("LIMIT 1");
            MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

            if (nextLevel != null) {
                member.setLevel(nextLevel.getLevel());
                upgraded = true;
                newLevel = nextLevel.getLevel();
                newLevelName = nextLevel.getName();
            }

            member.setTotalConsume(newTotalConsume);
            member.setPoints(newPoints);
            member.setUpdateTime(LocalDateTime.now());
            memberRepository.updateById(member);

            if (rel != null) {
                rel.setTotalConsume(newTotalConsume);
                if (nextLevel != null) {
                    rel.setLevel(nextLevel.getLevel());
                }
                rel.setUpdateTime(LocalDateTime.now());
                memberStoreRelRepository.updateById(rel);
            }

            if (earnedPoints > 0) {
                MemberPointsRecord pointsRecord = new MemberPointsRecord();
                pointsRecord.setMemberId(member.getId());
                pointsRecord.setStoreId(storeId);
                pointsRecord.setType(1);
                pointsRecord.setPoints(earnedPoints);
                pointsRecord.setBalance(newPoints);
                pointsRecord.setRemark("预约订单完成获得积分");
                pointsRecord.setCreateTime(LocalDateTime.now());
                memberPointsRecordRepository.insert(pointsRecord);
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("upgraded", upgraded);
        result.put("newLevel", newLevel);
        result.put("newLevelName", newLevelName);
        result.put("order", getDetail(orderId));

        return result;
    }

    @Override
    @Transactional
    public boolean cancelOrder(Long orderId) {
        ReservationOrder order = reservationOrderRepository.selectById(orderId);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        if (order.getStatus() != 1) {
            throw new BusinessException("订单状态不允许取消");
        }

        List<ReservationOrderItem> items = getOrderItems(orderId);
        for (ReservationOrderItem item : items) {
            inventoryService.stockIn(item.getProductId(), item.getQuantity(), order.getUserId(), "取消预约订单，恢复库存");
        }

        if (order.getPointsDeduct() != null && order.getPointsDeduct() > 0) {
            Member member = memberRepository.selectById(order.getUserId());
            if (member != null) {
                int currentPoints = member.getPoints() != null ? member.getPoints() : 0;
                int newPoints = currentPoints + order.getPointsDeduct();
                member.setPoints(newPoints);
                member.setUpdateTime(LocalDateTime.now());
                memberRepository.updateById(member);

                MemberPointsRecord refundRecord = new MemberPointsRecord();
                refundRecord.setMemberId(member.getId());
                refundRecord.setStoreId(order.getStoreId());
                refundRecord.setType(1);
                refundRecord.setPoints(order.getPointsDeduct());
                refundRecord.setBalance(newPoints);
                refundRecord.setRemark("取消预约订单，返还积分");
                refundRecord.setCreateTime(LocalDateTime.now());
                memberPointsRecordRepository.insert(refundRecord);
            }
        }

        order.setStatus(3);
        order.setUpdateTime(LocalDateTime.now());
        return reservationOrderRepository.updateById(order) > 0;
    }

    private List<ReservationOrderItem> getOrderItems(Long orderId) {
        LambdaQueryWrapper<ReservationOrderItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(ReservationOrderItem::getOrderId, orderId);
        return reservationOrderItemRepository.selectList(wrapper);
    }

    @Override
    public IPage<ReservationOrder> listByStoreId(Integer pageNum, Integer pageSize, Integer status, String orderNo, String phone) {
        Page<ReservationOrder> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<ReservationOrder> wrapper = new LambdaQueryWrapper<>();

        if (status != null) {
            wrapper.eq(ReservationOrder::getStatus, status);
        }
        if (orderNo != null && !orderNo.isEmpty()) {
            wrapper.like(ReservationOrder::getOrderNo, orderNo);
        }
        wrapper.orderByDesc(ReservationOrder::getCreateTime);

        IPage<ReservationOrder> resultPage = reservationOrderRepository.selectPage(page, wrapper);

        List<ReservationOrder> orders = resultPage.getRecords();
        for (ReservationOrder order : orders) {
            enrichOrderInfo(order);
            if (phone != null && !phone.isEmpty()) {
                if (order.getUserPhone() == null || !order.getUserPhone().contains(phone)) {
                    orders.remove(order);
                }
            }
            List<ReservationOrderItem> items = getOrderItems(order.getId());
            order.setItems(items);
        }

        return resultPage;
    }

    @Override
    @Transactional
    public Map<String, Object> confirmPayment(Long orderId, Integer payType) {
        ReservationOrder order = reservationOrderRepository.selectById(orderId);
        if (order == null) {
            throw new BusinessException("订单不存在");
        }

        if (order.getStatus() != 1) {
            throw new BusinessException("订单状态不允许确认支付");
        }

        order.setStatus(2);
        order.setUpdateTime(LocalDateTime.now());
        reservationOrderRepository.updateById(order);

        boolean upgraded = false;
        Integer newLevel = null;
        String newLevelName = null;

        Member member = memberRepository.selectById(order.getUserId());
        if (member != null) {
            BigDecimal newTotalConsume = member.getTotalConsume().add(order.getPayAmount());
            int newPoints = member.getPoints() + order.getPayAmount().intValue();

            LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
            levelWrapper.gt(MemberLevel::getLevel, member.getLevel() != null ? member.getLevel() : 0);
            levelWrapper.le(MemberLevel::getMinAmount, newTotalConsume);
            levelWrapper.orderByAsc(MemberLevel::getLevel);
            levelWrapper.last("LIMIT 1");
            MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

            if (nextLevel != null) {
                member.setLevel(nextLevel.getLevel());
                upgraded = true;
                newLevel = nextLevel.getLevel();
                newLevelName = nextLevel.getName();
            }

            member.setTotalConsume(newTotalConsume);
            member.setPoints(newPoints);
            member.setUpdateTime(LocalDateTime.now());
            memberRepository.updateById(member);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("upgraded", upgraded);
        result.put("newLevel", newLevel);
        result.put("newLevelName", newLevelName);
        result.put("order", getDetail(orderId));

        return result;
    }

    private void enrichOrderInfo(ReservationOrder order) {
        String statusName = switch (order.getStatus()) {
            case 1 -> "待付款";
            case 2 -> "已完成";
            case 3 -> "已取消";
            default -> "未知";
        };
        order.setStatusName(statusName);

        Member member = memberRepository.selectById(order.getUserId());
        if (member != null) {
            order.setUserPhone(maskPhone(member.getPhone()));
            order.setUserNickname(member.getName());
            if (member.getLevel() != null) {
                LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
                levelWrapper.eq(MemberLevel::getLevel, member.getLevel());
                levelWrapper.orderByAsc(MemberLevel::getId);
                levelWrapper.last("LIMIT 1");
                MemberLevel level = memberLevelRepository.selectOne(levelWrapper);
                order.setMemberLevelName(level != null ? level.getName() : "普通会员");
            } else {
                order.setMemberLevelName("普通会员");
            }
        }
    }

    private String maskPhone(String phone) {
        if (phone == null || phone.length() < 11) {
            return phone;
        }
        return phone.substring(0, 3) + "****" + phone.substring(7);
    }

    private String getLevelName(Integer level) {
        if (level == null) return "普通会员";
        LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
        levelWrapper.eq(MemberLevel::getLevel, level);
        levelWrapper.orderByAsc(MemberLevel::getId);
        levelWrapper.last("LIMIT 1");
        MemberLevel memberLevel = memberLevelRepository.selectOne(levelWrapper);
        return memberLevel != null ? memberLevel.getName() : "普通会员";
    }

    private String generateOrderNo() {
        String prefix = "RS";
        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        Random random = new Random();
        int randomNum = 100000 + random.nextInt(900000);
        return prefix + date + randomNum;
    }
}