package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.*;
import com.shafir.store.repository.*;
import com.shafir.store.service.InventoryService;
import com.shafir.store.service.MiniUserService;
import com.shafir.store.service.ProductService;
import com.shafir.store.service.ReservationOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@RequiredArgsConstructor
public class ReservationOrderServiceImpl implements ReservationOrderService {

    private final ReservationOrderRepository reservationOrderRepository;
    private final ReservationOrderItemRepository reservationOrderItemRepository;
    private final ProductService productService;
    private final MiniUserService miniUserService;
    private final RegularUserRepository regularUserRepository;
    private final MemberRepository memberRepository;
    private final MemberLevelRepository memberLevelRepository;
    private final InventoryService inventoryService;

    @Override
    @Transactional
    public Map<String, Object> createOrder(List<Long> productIds, List<Integer> quantities,
                                          String pickupTime, String remark, Long userId, Integer userType) {
        if (productIds == null || productIds.isEmpty()) {
            throw new BusinessException("商品不能为空");
        }

        Long storeId = StoreContext.getCurrentStoreId();
        if (storeId == null) {
            throw new BusinessException("请先选择店铺");
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

            BigDecimal subtotal = product.getPrice().multiply(BigDecimal.valueOf(quantity));
            totalAmount = totalAmount.add(subtotal);

            ReservationOrderItem item = new ReservationOrderItem();
            item.setStoreId(storeId);
            item.setProductId(productId);
            item.setProductName(product.getName());
            item.setPrice(product.getPrice());
            item.setQuantity(quantity);
            item.setSubtotal(subtotal);
            item.setCreateTime(LocalDateTime.now());

            items.add(item);
        }

        BigDecimal discount = BigDecimal.ONE;
        if (userType == 2) {
            Member member = memberRepository.selectById(userId);
            if (member != null && member.getLevel() != null) {
                MemberLevel level = memberLevelRepository.selectById(member.getLevel());
                if (level != null) {
                    discount = level.getDiscount();
                    discountAmount = totalAmount.multiply(BigDecimal.ONE.subtract(discount));
                    payAmount = totalAmount.multiply(discount);
                }
            }
        } else {
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
        order.setCreateTime(LocalDateTime.now());
        order.setUpdateTime(LocalDateTime.now());

        reservationOrderRepository.insert(order);

        for (ReservationOrderItem item : items) {
            item.setOrderId(order.getId());
            reservationOrderItemRepository.insert(item);
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

        if (order.getUserType() == 1) {
            RegularUser user = regularUserRepository.selectById(order.getUserId());
            if (user != null) {
                BigDecimal newTotalConsume = user.getTotalConsume().add(order.getPayAmount());

                LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
                levelWrapper.le(MemberLevel::getMinAmount, newTotalConsume);
                levelWrapper.orderByDesc(MemberLevel::getLevel);
                levelWrapper.last("LIMIT 1");
                MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

                if (nextLevel != null && nextLevel.getLevel() > 1) {
                    Member member = miniUserService.upgradeToMember(user);
                    upgraded = true;
                    newLevel = member.getLevel();
                    newLevelName = getLevelName(member.getLevel());
                } else {
                    user.setTotalConsume(newTotalConsume);
                    regularUserRepository.updateById(user);
                }
            }
        } else {
            Member member = memberRepository.selectById(order.getUserId());
            if (member != null) {
                BigDecimal newTotalConsume = member.getTotalConsume().add(order.getPayAmount());
                int newPoints = member.getPoints() + order.getPayAmount().intValue();

                LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
                levelWrapper.gt(MemberLevel::getLevel, member.getLevel());
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

        if (order.getUserType() == 1) {
            RegularUser user = regularUserRepository.selectById(order.getUserId());
            if (user != null) {
                BigDecimal newTotalConsume = user.getTotalConsume().add(order.getPayAmount());

                LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
                levelWrapper.le(MemberLevel::getMinAmount, newTotalConsume);
                levelWrapper.orderByDesc(MemberLevel::getLevel);
                levelWrapper.last("LIMIT 1");
                MemberLevel nextLevel = memberLevelRepository.selectOne(levelWrapper);

                if (nextLevel != null && nextLevel.getLevel() > 1) {
                    Member member = miniUserService.upgradeToMember(user);
                    upgraded = true;
                    newLevel = member.getLevel();
                    newLevelName = getLevelName(member.getLevel());
                } else {
                    user.setTotalConsume(newTotalConsume);
                    regularUserRepository.updateById(user);
                }
            }
        } else {
            Member member = memberRepository.selectById(order.getUserId());
            if (member != null) {
                BigDecimal newTotalConsume = member.getTotalConsume().add(order.getPayAmount());
                int newPoints = member.getPoints() + order.getPayAmount().intValue();

                LambdaQueryWrapper<MemberLevel> levelWrapper = new LambdaQueryWrapper<>();
                levelWrapper.gt(MemberLevel::getLevel, member.getLevel());
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
            case 1 -> "待取货";
            case 2 -> "已完成";
            case 3 -> "已取消";
            default -> "未知";
        };
        order.setStatusName(statusName);

        if (order.getUserType() == 1) {
            RegularUser user = regularUserRepository.selectById(order.getUserId());
            if (user != null) {
                order.setUserPhone(maskPhone(user.getPhone()));
                order.setUserNickname(user.getNickname());
                order.setMemberLevelName("普通用户");
            }
        } else {
            Member member = memberRepository.selectById(order.getUserId());
            if (member != null) {
                order.setUserPhone(maskPhone(member.getPhone()));
                order.setUserNickname(member.getName());
                if (member.getLevel() != null) {
                    MemberLevel level = memberLevelRepository.selectById(member.getLevel());
                    order.setMemberLevelName(level != null ? level.getName() : "普通用户");
                }
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
        if (level == null) return "普通用户";
        MemberLevel memberLevel = memberLevelRepository.selectById(level);
        return memberLevel != null ? memberLevel.getName() : "普通用户";
    }

    private String generateOrderNo() {
        String prefix = "RS";
        String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        Random random = new Random();
        int randomNum = 100000 + random.nextInt(900000);
        return prefix + date + randomNum;
    }
}