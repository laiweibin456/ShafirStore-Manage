package com.shafir.store.service;

import java.util.Map;

public interface StatisticsService {

    Map<String, Object> getDailySales(Integer days);

    Map<String, Object> getMonthlySales(Integer months);

    Map<String, Object> getProductSalesRanking(Integer limit);

    Map<String, Object> getInventorySummary();

    Map<String, Object> getLowStockProducts(Integer limit);

    Map<String, Object> getMemberSummary();

    Map<String, Object> getNewMembers(Integer days);

    Map<String, Object> getMemberConsumeRanking(Integer limit);

    Map<String, Object> getOverview();

    Map<String, Object> getCrossStoreOverview();
}