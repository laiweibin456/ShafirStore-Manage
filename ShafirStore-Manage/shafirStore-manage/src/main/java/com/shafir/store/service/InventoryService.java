package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.Inventory;
import com.shafir.store.entity.InventoryRecord;

import java.util.List;

public interface InventoryService {

    IPage<Inventory> selectPage(Integer pageNum, Integer pageSize, String productName, Long categoryId);

    Inventory getByProductId(Long productId);

    boolean stockIn(Long productId, Integer quantity, Long operatorId, String remark);

    boolean stockOut(Long productId, Integer quantity, Long operatorId, Long orderId, String remark);

    boolean adjustStock(Long productId, Integer quantity, Integer beforeQuantity, Long operatorId, String remark);

    IPage<InventoryRecord> getRecords(Integer pageNum, Integer pageSize, Long productId, Integer type);

    List<Inventory> getLowStockAlerts();

    boolean updateAlertThreshold(Long productId, Integer threshold);

    List<Inventory> getStatistics();
}
