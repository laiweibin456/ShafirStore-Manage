package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.entity.Store;
import com.shafir.store.repository.StoreRepository;
import com.shafir.store.repository.SysUserStoreRelRepository;
import com.shafir.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class StoreServiceImpl implements StoreService {

    private final StoreRepository storeRepository;
    private final SysUserStoreRelRepository sysUserStoreRelRepository;

    @Override
    public Store getById(Long id) {
        return storeRepository.selectById(id);
    }

    @Override
    public Store getByCode(String storeCode) {
        LambdaQueryWrapper<Store> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Store::getStoreCode, storeCode);
        return storeRepository.selectOne(wrapper);
    }

    @Override
    public Page<Store> selectPage(Integer pageNum, Integer pageSize, String storeName, Integer status) {
        Page<Store> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Store> wrapper = new LambdaQueryWrapper<>();

        if (storeName != null && !storeName.isEmpty()) {
            wrapper.like(Store::getStoreName, storeName);
        }
        if (status != null) {
            wrapper.eq(Store::getStatus, status);
        }

        wrapper.orderByDesc(Store::getCreateTime);

        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);
            return storeRepository.selectPage(page, wrapper);
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }

    @Override
    public List<Store> getAllStores() {
        LambdaQueryWrapper<Store> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Store::getStatus, 1);
        wrapper.orderByAsc(Store::getId);

        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);
            return storeRepository.selectList(wrapper);
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }

    @Override
    public List<Store> getStoresByUserId(Long userId) {
        List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(userId);
        if (storeIds.isEmpty()) {
            return List.of();
        }

        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);
            return storeRepository.selectBatchIds(storeIds);
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Store addStore(Store store) {
        Store existing = getByCode(store.getStoreCode());
        if (existing != null) {
            throw new BusinessException("店铺编码已存在：" + store.getStoreCode());
        }

        store.setStatus(1);
        store.setCreateTime(LocalDateTime.now());
        store.setUpdateTime(LocalDateTime.now());

        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);
            storeRepository.insert(store);
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
        return store;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Store updateStore(Store store) {
        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);

            Store existing = storeRepository.selectById(store.getId());
            if (existing == null) {
                throw new BusinessException("店铺不存在");
            }

            if (store.getStoreCode() != null && !existing.getStoreCode().equals(store.getStoreCode())) {
                Store byCode = getByCode(store.getStoreCode());
                if (byCode != null) {
                    throw new BusinessException("店铺编码已存在：" + store.getStoreCode());
                }
            }

            store.setUpdateTime(LocalDateTime.now());
            storeRepository.updateById(store);
            return storeRepository.selectById(store.getId());
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateStatus(Long id, Integer status) {
        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);

            Store store = storeRepository.selectById(id);
            if (store == null) {
                throw new BusinessException("店铺不存在");
            }

            store.setStatus(status);
            store.setUpdateTime(LocalDateTime.now());
            return storeRepository.updateById(store) > 0;
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteStore(Long id) {
        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);
            return storeRepository.deleteById(id) > 0;
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }
    }
}
