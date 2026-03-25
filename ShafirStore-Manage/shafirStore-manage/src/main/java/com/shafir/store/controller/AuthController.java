package com.shafir.store.controller;

import com.shafir.store.common.dto.LoginRequest;
import com.shafir.store.common.dto.LoginResponse;
import com.shafir.store.common.exception.BusinessException;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.common.utils.JwtUtil;
import com.shafir.store.common.utils.PasswordEncoderUtil;
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
    private final PasswordEncoderUtil passwordEncoderUtil;

    @PostMapping("/login")
    public Result<LoginResponse> login(@RequestBody @Valid LoginRequest request) {
        log.info("用户登录请求: {}", request.getUsername());
        log.info("输入密码: {}", request.getPassword());

        User user = userService.getByUsername(request.getUsername());
        if (user == null) {
            log.warn("用户不存在: {}", request.getUsername());
            return Result.error(ResultCode.USERNAME_PASSWORD_ERROR);
        }

        log.info("数据库密码: {}", user.getPassword());
        boolean passwordMatch = request.getPassword().equals(user.getPassword());
        log.info("密码比较结果: {}", passwordMatch);

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
