package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.entity.ReservationOrder;
import com.shafir.store.security.SecurityUser;
import com.shafir.store.service.ReservationOrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/reservation-order")
@RequiredArgsConstructor
public class ReservationOrderController {

    private final ReservationOrderService reservationOrderService;

    @PostMapping("/create")
    public Result<Map<String, Object>> create(@RequestBody Map<String, Object> params) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        Long userId = securityUser.getUserId();
        Integer userType = "member".equals(securityUser.getRole()) ? 2 : 1;

        List<Long> productIds = ((List<?>) params.get("productIds")).stream()
                .map(id -> Long.valueOf(id.toString())).toList();
        List<Integer> quantities = ((List<?>) params.get("quantities")).stream()
                .map(q -> Integer.valueOf(q.toString())).toList();
        String pickupTime = (String) params.get("pickupTime");
        String remark = (String) params.get("remark");

        log.info("创建预约订单: userId={}, userType={}, productIds={}", userId, userType, productIds);

        Map<String, Object> result = reservationOrderService.createOrder(
                productIds, quantities, pickupTime, remark, userId, userType);
        return Result.success(result);
    }

    @GetMapping("/list")
    public Result<List<ReservationOrder>> list(@RequestParam(required = false) Integer status) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        Long userId = securityUser.getUserId();
        Integer userType = "member".equals(securityUser.getRole()) ? 2 : 1;

        log.info("查询预约订单列表: userId={}, userType={}, status={}", userId, userType, status);

        List<ReservationOrder> orders = reservationOrderService.listByUserId(userId, userType, status);
        return Result.success(orders);
    }

    @GetMapping("/{id}")
    public Result<ReservationOrder> getById(@PathVariable Long id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        log.info("查询预约订单详情: id={}", id);

        ReservationOrder order = reservationOrderService.getDetail(id);
        return Result.success(order);
    }

    @PutMapping("/{id}/complete")
    public Result<Map<String, Object>> complete(@PathVariable Long id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        log.info("完成预约订单取货: id={}", id);

        Map<String, Object> result = reservationOrderService.completeOrder(id);
        return Result.success(result);
    }

    @PutMapping("/{id}/cancel")
    public Result<Boolean> cancel(@PathVariable Long id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        log.info("取消预约订单: id={}", id);

        boolean success = reservationOrderService.cancelOrder(id);
        return Result.success(success);
    }

    @GetMapping("/admin/list")
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'STORE_ADMIN')")
    public Result<IPage<ReservationOrder>> adminList(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Integer status,
            @RequestParam(required = false) String orderNo,
            @RequestParam(required = false) String phone) {

        log.info("管理端查询预约订单列表: pageNum={}, pageSize={}, status={}, orderNo={}, phone={}",
                pageNum, pageSize, status, orderNo, phone);

        IPage<ReservationOrder> page = reservationOrderService.listByStoreId(pageNum, pageSize, status, orderNo, phone);
        return Result.success(page);
    }

    @PutMapping("/admin/{id}/confirm-payment")
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'STORE_ADMIN')")
    public Result<Map<String, Object>> confirmPayment(
            @PathVariable Long id,
            @RequestParam(defaultValue = "1") Integer payType) {

        log.info("确认预约订单支付: id={}, payType={}", id, payType);

        Map<String, Object> result = reservationOrderService.confirmPayment(id, payType);
        return Result.success(result);
    }

    @PutMapping("/admin/{id}/cancel")
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'STORE_ADMIN')")
    public Result<Boolean> adminCancel(@PathVariable Long id) {

        log.info("管理端取消预约订单: id={}", id);

        boolean success = reservationOrderService.cancelOrder(id);
        return Result.success(success);
    }

    @GetMapping("/admin/{id}")
    @PreAuthorize("hasAnyRole('SUPER_ADMIN', 'STORE_ADMIN')")
    public Result<ReservationOrder> adminGetById(@PathVariable Long id) {

        log.info("管理端查询预约订单详情: id={}", id);

        ReservationOrder order = reservationOrderService.getDetail(id);
        return Result.success(order);
    }
}