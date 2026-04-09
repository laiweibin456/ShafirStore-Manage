package com.shafir.store.controller;

import com.shafir.store.common.result.Result;
import com.shafir.store.service.StatisticsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/statistics")
@RequiredArgsConstructor
public class StatisticsController {

    private final StatisticsService statisticsService;

    @GetMapping("/sales/daily")
    public Result<Map<String, Object>> getDailySales(
            @RequestParam(required = false, defaultValue = "7") Integer days) {
        log.info("获取日销售统计: days={}", days);
        Map<String, Object> data = statisticsService.getDailySales(days);
        return Result.success(data);
    }

    @GetMapping("/sales/monthly")
    public Result<Map<String, Object>> getMonthlySales(
            @RequestParam(required = false, defaultValue = "12") Integer months) {
        log.info("获取月销售统计: months={}", months);
        Map<String, Object> data = statisticsService.getMonthlySales(months);
        return Result.success(data);
    }

    @GetMapping("/sales/products")
    public Result<Map<String, Object>> getProductSalesRanking(
            @RequestParam(required = false, defaultValue = "10") Integer limit) {
        log.info("获取商品销售排行: limit={}", limit);
        Map<String, Object> data = statisticsService.getProductSalesRanking(limit);
        return Result.success(data);
    }

    @GetMapping("/inventory/summary")
    public Result<Map<String, Object>> getInventorySummary() {
        log.info("获取库存汇总统计");
        Map<String, Object> data = statisticsService.getInventorySummary();
        return Result.success(data);
    }

    @GetMapping("/inventory/low-stock")
    public Result<Map<String, Object>> getLowStockProducts(
            @RequestParam(required = false, defaultValue = "10") Integer limit) {
        log.info("获取低库存商品: limit={}", limit);
        Map<String, Object> data = statisticsService.getLowStockProducts(limit);
        return Result.success(data);
    }

    @GetMapping("/member/summary")
    public Result<Map<String, Object>> getMemberSummary() {
        log.info("获取会员汇总统计");
        Map<String, Object> data = statisticsService.getMemberSummary();
        return Result.success(data);
    }

    @GetMapping("/member/new")
    public Result<Map<String, Object>> getNewMembers(
            @RequestParam(required = false, defaultValue = "30") Integer days) {
        log.info("获取新增会员统计: days={}", days);
        Map<String, Object> data = statisticsService.getNewMembers(days);
        return Result.success(data);
    }

    @GetMapping("/member/consume")
    public Result<Map<String, Object>> getMemberConsumeRanking(
            @RequestParam(required = false, defaultValue = "10") Integer limit) {
        log.info("获取会员消费排行: limit={}", limit);
        Map<String, Object> data = statisticsService.getMemberConsumeRanking(limit);
        return Result.success(data);
    }

    @GetMapping("/overview")
    public Result<Map<String, Object>> getOverview() {
        log.info("获取经营概览");
        Map<String, Object> data = statisticsService.getOverview();
        return Result.success(data);
    }
}