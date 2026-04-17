package com.shafir.store.controller;

import com.shafir.store.common.dto.LoginRequest;
import com.shafir.store.common.dto.LoginResponse;
import com.shafir.store.common.dto.RegisterRequest;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.common.utils.JwtUtil;
import com.shafir.store.entity.Store;
import com.shafir.store.entity.User;
import com.shafir.store.repository.SysUserStoreRelRepository;
import com.shafir.store.security.SecurityUser;
import com.shafir.store.service.StoreService;
import com.shafir.store.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;
    private final JwtUtil jwtUtil;
    private final StoreService storeService;
    private final SysUserStoreRelRepository sysUserStoreRelRepository;
    private final PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public Result<LoginResponse> login(@RequestBody @Valid LoginRequest request) {
        log.info("用户登录请求: {}", request.getUsername());

        User user = userService.getByUsername(request.getUsername());
        if (user == null) {
            log.warn("用户不存在: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_PASSWORD_ERROR);
        }

        if (!matchesPassword(request.getPassword(), user.getPassword())) {
            log.warn("密码错误: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_PASSWORD_ERROR);
        }

        if (user.getStatus() == 0) {
            log.warn("账号已被禁用: {}", request.getUsername());
            return Result.error(ResultCode.ACCOUNT_DISABLED);
        }

        User userWithRole = userService.getUserWithRole(user.getId());

        List<Long> storeIds = sysUserStoreRelRepository.findStoreIdsByUserId(user.getId());
        Long currentStoreId = storeIds.isEmpty() ? null : storeIds.get(0);

        boolean isSuperAdmin = "ROLE_SUPER_ADMIN".equals(userWithRole.getRoleKey());
        if (isSuperAdmin) {
            List<Store> allStores = storeService.getAllStores();
            storeIds = allStores.stream().map(Store::getId).collect(Collectors.toList());
            currentStoreId = null;
        }

        String token = jwtUtil.generateToken(
                user.getId(),
                user.getUsername(),
                userWithRole.getRoleKey(),
                currentStoreId,
                storeIds
        );

        LoginResponse response = new LoginResponse();
        response.setToken(token);

        LoginResponse.UserInfo userInfo = new LoginResponse.UserInfo();
        userInfo.setId(user.getId());
        userInfo.setUsername(user.getUsername());
        userInfo.setRealName(user.getRealName());
        userInfo.setPhone(user.getPhone());
        userInfo.setRoleName(userWithRole.getRoleName());
        userInfo.setRoleKey(userWithRole.getRoleKey());
        userInfo.setStoreId(currentStoreId);
        userInfo.setStoreIds(storeIds);
        userInfo.setSuperAdmin(isSuperAdmin);
        response.setUserInfo(userInfo);

        log.info("用户登录成功: {}, 当前店铺: {}", request.getUsername(), currentStoreId);
        return Result.success(response);
    }

    @PostMapping("/register")
    public Result<Void> register(@RequestBody @Valid RegisterRequest request) {
        log.info("用户注册请求: {}", request.getUsername());

        if (userService.existsByUsername(request.getUsername())) {
            log.warn("用户名已存在: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_EXISTS);
        }

        if (userService.existsByEmail(request.getEmail())) {
            log.warn("邮箱已被注册: {}", request.getEmail());
            return Result.error(ResultCode.EMAIL_EXISTS);
        }

        if (!request.getPassword().equals(request.getConfirmPassword())) {
            log.warn("两次输入的密码不一致");
            return Result.error(ResultCode.PASSWORD_MISMATCH);
        }

        User user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEmail(request.getEmail());
        user.setRoleId(2L);
        user.setStatus(1);

        if (userService.register(user)) {
            log.info("用户注册成功: {}", request.getUsername());
            return Result.success();
        }

        log.error("用户注册失败: {}", request.getUsername());
        return Result.error(ResultCode.FAILED);
    }

    @PostMapping("/logout")
    public Result<Void> logout() {
        log.info("用户退出登录");
        return Result.success();
    }

    @GetMapping("/current")
    public Result<LoginResponse.UserInfo> getCurrentUser(@AuthenticationPrincipal SecurityUser securityUser) {
        if (securityUser == null) {
            return Result.error(ResultCode.UNAUTHORIZED);
        }

        User user = userService.getByUsername(securityUser.getUsername());
        if (user == null) {
            return Result.error(ResultCode.UNAUTHORIZED);
        }

        User userWithRole = userService.getUserWithRole(user.getId());

        LoginResponse.UserInfo userInfo = new LoginResponse.UserInfo();
        userInfo.setId(user.getId());
        userInfo.setUsername(user.getUsername());
        userInfo.setRealName(user.getRealName());
        userInfo.setPhone(user.getPhone());
        userInfo.setRoleName(userWithRole.getRoleName());
        userInfo.setRoleKey(userWithRole.getRoleKey());
        userInfo.setStoreId(securityUser.getStoreId());
        userInfo.setStoreIds(securityUser.getStoreIds());
        userInfo.setSuperAdmin(securityUser.isSuperAdmin());

        return Result.success(userInfo);
    }

    @PostMapping("/switch-store")
    public Result<LoginResponse> switchStore(
            @RequestBody Map<String, Long> params,
            @AuthenticationPrincipal SecurityUser securityUser) {

        Long targetStoreId = params.get("storeId");
        if (targetStoreId == null) {
            return Result.error(ResultCode.VALIDATE_FAILED);
        }

        if (!securityUser.isSuperAdmin() && !securityUser.getStoreIds().contains(targetStoreId)) {
            return Result.error(ResultCode.FORBIDDEN);
        }

        String newToken = jwtUtil.generateToken(
                securityUser.getUserId(),
                securityUser.getUsername(),
                securityUser.getRole(),
                targetStoreId,
                securityUser.getStoreIds()
        );

        LoginResponse response = new LoginResponse();
        response.setToken(newToken);

        LoginResponse.UserInfo userInfo = new LoginResponse.UserInfo();
        userInfo.setId(securityUser.getUserId());
        userInfo.setUsername(securityUser.getUsername());
        userInfo.setRoleKey(securityUser.getRole());
        userInfo.setStoreId(targetStoreId);
        userInfo.setStoreIds(securityUser.getStoreIds());
        userInfo.setSuperAdmin(securityUser.isSuperAdmin());

        User user = userService.getByUsername(securityUser.getUsername());
        if (user != null) {
            userInfo.setRealName(user.getRealName());
            userInfo.setPhone(user.getPhone());
            User userWithRole = userService.getUserWithRole(user.getId());
            if (userWithRole != null) {
                userInfo.setRoleName(userWithRole.getRoleName());
            }
        }

        response.setUserInfo(userInfo);

        log.info("用户切换店铺: userId={}, storeId={}", securityUser.getUserId(), targetStoreId);
        return Result.success(response);
    }

    private boolean matchesPassword(String rawPassword, String storedPassword) {
        if (storedPassword.startsWith("$2a$") || storedPassword.startsWith("$2b$") || storedPassword.startsWith("$2y$")) {
            return passwordEncoder.matches(rawPassword, storedPassword);
        }
        return rawPassword.equals(storedPassword);
    }
}
