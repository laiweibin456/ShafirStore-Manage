package com.shafir.store.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.common.result.Result;
import com.shafir.store.entity.Store;
import com.shafir.store.security.SecurityUser;
import com.shafir.store.service.StoreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/stores")
@RequiredArgsConstructor
public class StoreController {

    private final StoreService storeService;

    @PostMapping
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Store> addStore(@RequestBody Store store) {
        log.info("创建店铺: {}", store.getStoreName());
        Store saved = storeService.addStore(store);
        return Result.success(saved);
    }

    @GetMapping
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Page<Store>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String storeName,
            @RequestParam(required = false) Integer status) {
        log.info("分页查询店铺: pageNum={}, pageSize={}, storeName={}, status={}",
                pageNum, pageSize, storeName, status);
        Page<Store> page = storeService.selectPage(pageNum, pageSize, storeName, status);
        return Result.success(page);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Store> getById(@PathVariable Long id) {
        log.info("查询店铺详情: id={}", id);
        Store store = storeService.getById(id);
        return Result.success(store);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Store> updateStore(@PathVariable Long id, @RequestBody Store store) {
        store.setId(id);
        log.info("更新店铺: id={}", id);
        Store updated = storeService.updateStore(store);
        return Result.success(updated);
    }

    @PutMapping("/{id}/status")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> updateStatus(@PathVariable Long id, @RequestParam Integer status) {
        log.info("更新店铺状态: id={}, status={}", id, status);
        boolean result = storeService.updateStatus(id, status);
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> deleteStore(@PathVariable Long id) {
        log.info("删除店铺: id={}", id);
        boolean result = storeService.deleteStore(id);
        return Result.success(result);
    }

    @GetMapping("/my")
    public Result<List<Store>> getMyStores(@AuthenticationPrincipal SecurityUser securityUser) {
        log.info("查询当前用户关联店铺: userId={}, role={}", securityUser.getUserId(), securityUser.getRole());
        
        List<Store> stores;
        if (securityUser.isSuperAdmin()) {
            stores = storeService.getAllStores();
        } else {
            stores = storeService.getStoresByUserId(securityUser.getUserId());
        }
        
        return Result.success(stores);
    }

    @GetMapping("/all")
    public Result<List<Store>> getAllStores() {
        log.info("查询所有营业中店铺");
        List<Store> stores = storeService.getAllStores();
        return Result.success(stores);
    }
}
