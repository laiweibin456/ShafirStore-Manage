package com.shafir.store.controller;

import com.shafir.store.common.dto.LoginRequest;
import com.shafir.store.common.dto.LoginResponse;
import com.shafir.store.common.dto.RegisterRequest;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.common.utils.JwtUtil;
import com.shafir.store.entity.User;
import com.shafir.store.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserService userService;
    private final JwtUtil jwtUtil;

    @PostMapping("/login")
    public Result<LoginResponse> login(@RequestBody @Valid LoginRequest request) {
        log.info("用户登录请求: {}", request.getUsername());

        User user = userService.getByUsername(request.getUsername());
        if (user == null) {
            log.warn("用户不存在: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_PASSWORD_ERROR);
        }

        boolean passwordMatch = request.getPassword().equals(user.getPassword());
        if (!passwordMatch) {
            log.warn("密码错误: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_PASSWORD_ERROR);
        }

        if (user.getStatus() == 0) {
            log.warn("账号已被禁用: {}", request.getUsername());
            return Result.error(ResultCode.ACCOUNT_DISABLED);
        }

        User userWithRole = userService.getUserWithRole(user.getId());

        String token = jwtUtil.generateToken(user.getId(), user.getUsername(), userWithRole.getRoleKey());

        LoginResponse response = new LoginResponse();
        response.setToken(token);

        LoginResponse.UserInfo userInfo = new LoginResponse.UserInfo();
        userInfo.setId(user.getId());
        userInfo.setUsername(user.getUsername());
        userInfo.setRealName(user.getRealName());
        userInfo.setPhone(user.getPhone());
        userInfo.setRoleName(userWithRole.getRoleName());
        userInfo.setRoleKey(userWithRole.getRoleKey());
        response.setUserInfo(userInfo);

        log.info("用户登录成功: {}", request.getUsername());
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
        user.setPassword(request.getPassword());
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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            log.info("用户退出登录: {}", authentication.getName());
        }
        SecurityContextHolder.clearContext();
        return Result.success();
    }

    @GetMapping("/current")
    public Result<LoginResponse.UserInfo> getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return Result.error(ResultCode.UNAUTHORIZED);
        }

        String username = authentication.getName();
        User user = userService.getByUsername(username);
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

        return Result.success(userInfo);
    }
}
