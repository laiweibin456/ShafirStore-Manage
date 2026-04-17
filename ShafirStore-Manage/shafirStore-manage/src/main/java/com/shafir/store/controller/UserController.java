package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.entity.SysUserStoreRel;
import com.shafir.store.entity.User;
import com.shafir.store.repository.SysUserStoreRelRepository;
import com.shafir.store.security.SecurityUser;
import com.shafir.store.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final SysUserStoreRelRepository sysUserStoreRelRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<IPage<User>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String realName,
            @RequestParam(required = false) Long roleId,
            @RequestParam(required = false) Integer status,
            @AuthenticationPrincipal SecurityUser securityUser) {

        if (securityUser.isSuperAdmin()) {
            log.info("超级管理员查询所有用户");
        } else {
            log.info("店铺管理员查询本店店员: storeId={}", securityUser.getStoreId());
        }

        IPage<User> page = userService.selectPage(pageNum, pageSize, username, realName, roleId, status);
        return Result.success(page);
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<User> getById(@PathVariable Long id, @AuthenticationPrincipal SecurityUser securityUser) {
        log.info("查询用户详情: id={}", id);
        User user = userService.getUserWithRole(id);
        if (user == null) {
            return Result.error(ResultCode.NOT_FOUND);
        }

        if (!securityUser.isSuperAdmin()) {
            List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(id);
            if (!storeIds.contains(securityUser.getStoreId())) {
                return Result.error(ResultCode.FORBIDDEN);
            }
        }

        user.setPassword(null);
        return Result.success(user);
    }

    @GetMapping("/roles")
    public Result<List<User>> getAllRoles() {
        List<User> roles = userService.getAllRoles();
        return Result.success(roles);
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<Boolean> add(@RequestBody User user, @AuthenticationPrincipal SecurityUser securityUser) {
        log.info("新增用户: {}", user.getUsername());

        if (userService.existsByUsername(user.getUsername())) {
            return Result.error(ResultCode.USERNAME_EXISTS);
        }

        if (user.getEmail() != null && !user.getEmail().isEmpty() && userService.existsByEmail(user.getEmail())) {
            return Result.error(ResultCode.EMAIL_EXISTS);
        }

        if (!securityUser.isSuperAdmin()) {
            user.setRoleId(3L);
            user.setStoreId(securityUser.getStoreId());
        }

        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        boolean result = userService.addUser(user);

        if (result && !securityUser.isSuperAdmin() && securityUser.getStoreId() != null) {
            SysUserStoreRel rel = new SysUserStoreRel();
            rel.setUserId(user.getId());
            rel.setStoreId(securityUser.getStoreId());
            sysUserStoreRelRepository.insert(rel);
        }

        return Result.success(result);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<Boolean> update(@PathVariable Long id, @RequestBody User user,
                                  @AuthenticationPrincipal SecurityUser securityUser) {
        log.info("更新用户: id={}", id);
        user.setId(id);

        if (!securityUser.isSuperAdmin()) {
            List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(id);
            if (!storeIds.contains(securityUser.getStoreId())) {
                return Result.error(ResultCode.FORBIDDEN);
            }
            user.setRoleId(null);
            user.setStoreId(null);
        }

        user.setPassword(null);
        boolean result = userService.updateUser(user);
        return Result.success(result);
    }

    @PutMapping("/{id}/status")
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<Boolean> updateStatus(@PathVariable Long id, @RequestParam Integer status,
                                        @AuthenticationPrincipal SecurityUser securityUser) {
        log.info("更新用户状态: id={}, status={}", id, status);

        if (!securityUser.isSuperAdmin()) {
            List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(id);
            if (!storeIds.contains(securityUser.getStoreId())) {
                return Result.error(ResultCode.FORBIDDEN);
            }
        }

        boolean result = userService.updateStatus(id, status);
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> delete(@PathVariable Long id) {
        log.info("删除用户: id={}", id);
        boolean result = userService.deleteUser(id);
        return Result.success(result);
    }

    @PutMapping("/{id}/password")
    @PreAuthorize("hasAnyRole('ROLE_SUPER_ADMIN', 'ROLE_STORE_ADMIN')")
    public Result<Boolean> resetPassword(@PathVariable Long id, @RequestParam String password,
                                         @AuthenticationPrincipal SecurityUser securityUser) {
        log.info("重置用户密码: id={}", id);

        if (!securityUser.isSuperAdmin()) {
            List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(id);
            if (!storeIds.contains(securityUser.getStoreId())) {
                return Result.error(ResultCode.FORBIDDEN);
            }
        }

        String encodedPassword = passwordEncoder.encode(password);
        boolean result = userService.resetPassword(id, encodedPassword);
        return Result.success(result);
    }
}
