package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.entity.Order;
import com.shafir.store.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import com.shafir.store.security.SecurityUser;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
@PreAuthorize("isAuthenticated()")
public class OrderController {

    private final OrderService orderService;

    @PostMapping
    public Result<Order> createOrder(@RequestBody Map<String, Object> params) {
        List<Long> productIds = ((List<?>) params.get("productIds")).stream()
                .map(id -> Long.valueOf(id.toString()))
                .toList();

        List<Integer> quantities = ((List<?>) params.get("quantities")).stream()
                .map(q -> Integer.valueOf(q.toString()))
                .toList();

        Long memberId = params.get("memberId") != null ? Long.valueOf(params.get("memberId").toString()) : null;
        Integer payType = Integer.valueOf(params.get("payType").toString());
        String remark = (String) params.get("remark");
        Integer pointsEarned = params.get("pointsEarned") != null ?
                Integer.valueOf(params.get("pointsEarned").toString()) : null;
        Integer pointsDeduct = params.get("pointsDeduct") != null ?
                Integer.valueOf(params.get("pointsDeduct").toString()) : null;
        List<Map<String, Object>> itemDetails = (List<Map<String, Object>>) params.get("itemDetails");

        Long operatorId = getCurrentUserId();

        log.info("创建订单: productIds={}, quantities={}, memberId={}, payType={}, pointsEarned={}, pointsDeduct={}",
                productIds, quantities, memberId, payType, pointsEarned, pointsDeduct);

        Order order = orderService.createOrder(productIds, quantities, memberId, payType, operatorId, remark,
                pointsEarned, pointsDeduct, itemDetails);
        return Result.success(order);
    }

    @GetMapping
    public Result<IPage<Order>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String orderNo,
            @RequestParam(required = false) Integer status) {
        log.info("分页查询订单: pageNum={}, pageSize={}, orderNo={}, status={}",
                pageNum, pageSize, orderNo, status);
        IPage<Order> page = orderService.selectPage(pageNum, pageSize, orderNo, status);
        return Result.success(page);
    }

    @GetMapping("/{id}")
    public Result<Order> getById(@PathVariable Long id) {
        log.info("查询订单详情: id={}", id);
        Order order = orderService.getOrderDetail(id);
        return Result.success(order);
    }

    @PutMapping("/{id}/cancel")
    public Result<Boolean> cancelOrder(@PathVariable Long id) {
        Long operatorId = getCurrentUserId();
        log.info("取消订单: id={}, operatorId={}", id, operatorId);
        boolean result = orderService.cancelOrder(id, operatorId);
        return Result.success(result);
    }

    @PutMapping("/{id}/refund")
    public Result<Boolean> refundOrder(@PathVariable Long id, @RequestBody Map<String, String> params) {
        Long operatorId = getCurrentUserId();
        String reason = params.get("reason");
        log.info("退款订单: id={}, reason={}, operatorId={}", id, reason, operatorId);
        boolean result = orderService.refundOrder(id, reason, operatorId);
        return Result.success(result);
    }

    @GetMapping("/today/count")
    public Result<Integer> getTodayOrderCount() {
        int count = orderService.getTodayOrderCount();
        return Result.success(count);
    }

    @GetMapping("/today/sales")
    public Result<BigDecimal> getTodaySalesAmount() {
        BigDecimal amount = orderService.getTodaySalesAmount();
        return Result.success(amount);
    }

    private Long getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()
                && authentication.getPrincipal() instanceof SecurityUser) {
            SecurityUser securityUser = (SecurityUser) authentication.getPrincipal();
            return securityUser.getUserId();
        }
        return null;
    }
}