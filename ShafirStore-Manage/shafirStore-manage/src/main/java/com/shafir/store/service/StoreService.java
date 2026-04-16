package com.shafir.store.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.entity.Store;

import java.util.List;

public interface StoreService {

    Store getById(Long id);

    Store getByCode(String storeCode);

    Page<Store> selectPage(Integer pageNum, Integer pageSize, String storeName, Integer status);

    List<Store> getAllStores();

    List<Store> getStoresByUserId(Long userId);

    Store addStore(Store store);

    Store updateStore(Store store);

    boolean updateStatus(Long id, Integer status);

    boolean deleteStore(Long id);
}
