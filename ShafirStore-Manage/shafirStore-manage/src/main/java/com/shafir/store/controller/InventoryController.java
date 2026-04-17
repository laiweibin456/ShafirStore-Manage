package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.entity.Inventory;
import com.shafir.store.entity.InventoryRecord;
import com.shafir.store.service.InventoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/inventory")
@RequiredArgsConstructor
@PreAuthorize("isAuthenticated()")
public class InventoryController {

    private final InventoryService inventoryService;

    @GetMapping
    public Result<IPage<Inventory>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) Long categoryId) {
        log.info("分页查询库存: pageNum={}, pageSize={}, productName={}, categoryId={}",
                pageNum, pageSize, productName, categoryId);
        IPage<Inventory> page = inventoryService.selectPage(pageNum, pageSize, productName, categoryId);
        return Result.success(page);
    }

    @GetMapping("/product/{productId}")
    public Result<Inventory> getByProductId(@PathVariable Long productId) {
        log.info("查询商品库存: productId={}", productId);
        Inventory inventory = inventoryService.getByProductId(productId);
        return Result.success(inventory);
    }

    @PostMapping("/in")
    public Result<Boolean> stockIn(@RequestBody Map<String, Object> params) {
        Long productId = Long.valueOf(params.get("productId").toString());
        Integer quantity = Integer.valueOf(params.get("quantity").toString());
        Long operatorId = params.get("operatorId") != null ? Long.valueOf(params.get("operatorId").toString()) : null;
        String remark = (String) params.get("remark");

        log.info("入库操作: productId={}, quantity={}, remark={}", productId, quantity, remark);
        boolean result = inventoryService.stockIn(productId, quantity, operatorId, remark);
        return Result.success(result);
    }

    @PostMapping("/out")
    public Result<Boolean> stockOut(@RequestBody Map<String, Object> params) {
        Long productId = Long.valueOf(params.get("productId").toString());
        Integer quantity = Integer.valueOf(params.get("quantity").toString());
        Long operatorId = params.get("operatorId") != null ? Long.valueOf(params.get("operatorId").toString()) : null;
        Long orderId = params.get("orderId") != null ? Long.valueOf(params.get("orderId").toString()) : null;
        String remark = (String) params.get("remark");

        log.info("出库操作: productId={}, quantity={}, remark={}", productId, quantity, remark);
        boolean result = inventoryService.stockOut(productId, quantity, operatorId, orderId, remark);
        return Result.success(result);
    }

    @PostMapping("/adjust")
    public Result<Boolean> adjustStock(@RequestBody Map<String, Object> params) {
        Long productId = Long.valueOf(params.get("productId").toString());
        Integer quantity = Integer.valueOf(params.get("quantity").toString());
        Integer beforeQuantity = Integer.valueOf(params.get("beforeQuantity").toString());
        Long operatorId = params.get("operatorId") != null ? Long.valueOf(params.get("operatorId").toString()) : null;
        String remark = (String) params.get("remark");

        log.info("库存调整: productId={}, quantity={}, remark={}", productId, quantity, remark);
        boolean result = inventoryService.adjustStock(productId, quantity, beforeQuantity, operatorId, remark);
        return Result.success(result);
    }

    @GetMapping("/records")
    public Result<IPage<InventoryRecord>> getRecords(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Long productId,
            @RequestParam(required = false) Integer type) {
        log.info("查询库存记录: pageNum={}, pageSize={}, productId={}, type={}",
                pageNum, pageSize, productId, type);
        IPage<InventoryRecord> page = inventoryService.getRecords(pageNum, pageSize, productId, type);
        return Result.success(page);
    }

    @GetMapping("/alerts")
    public Result<List<Inventory>> getLowStockAlerts() {
        log.info("查询低库存预警");
        List<Inventory> alerts = inventoryService.getLowStockAlerts();
        return Result.success(alerts);
    }

    @PutMapping("/alerts/{productId}")
    public Result<Boolean> updateAlertThreshold(
            @PathVariable Long productId,
            @RequestParam Integer threshold) {
        log.info("更新预警阈值: productId={}, threshold={}", productId, threshold);
        boolean result = inventoryService.updateAlertThreshold(productId, threshold);
        return Result.success(result);
    }

    @GetMapping("/statistics")
    public Result<List<Inventory>> getStatistics() {
        log.info("查询库存统计");
        List<Inventory> statistics = inventoryService.getStatistics();
        return Result.success(statistics);
    }
}
