package com.shafir.store.controller;

import com.shafir.store.common.result.Result;
import com.shafir.store.security.SecurityUser;
import com.shafir.store.service.MiniUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/mini")
@RequiredArgsConstructor
public class MiniUserController {

    private final MiniUserService miniUserService;

    @PostMapping("/register")
    public Result<Map<String, Object>> register(@RequestBody Map<String, String> params) {
        String phone = params.get("phone");
        String password = params.get("password");
        String nickname = params.get("nickname");

        log.info("小程序用户注册: phone={}", phone);

        var user = miniUserService.register(phone, password, nickname);

        Map<String, Object> data = new HashMap<>();
        data.put("id", user.getId());
        data.put("phone", user.getPhone());
        data.put("nickname", user.getNickname());

        return Result.success(data);
    }

    @PostMapping("/login")
    public Result<Map<String, Object>> login(@RequestBody Map<String, String> params) {
        String phone = params.get("phone");
        String password = params.get("password");

        log.info("小程序用户登录: phone={}", phone);

        Map<String, Object> result = miniUserService.login(phone, password);
        return Result.success(result);
    }

    @GetMapping("/user-info")
    public Result<Map<String, Object>> getUserInfo() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        Long userId = securityUser.getUserId();
        Integer userType = "member".equals(securityUser.getRole()) ? 2 : 1;

        log.info("获取用户信息: userId={}, userType={}", userId, userType);

        Map<String, Object> userInfo = miniUserService.getUserInfo(userId, userType);
        return Result.success(userInfo);
    }

    @PutMapping("/update")
    public Result<Boolean> update(@RequestBody Map<String, String> params) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || !(auth.getPrincipal() instanceof SecurityUser)) {
            return Result.error(401, "请先登录");
        }

        SecurityUser securityUser = (SecurityUser) auth.getPrincipal();
        Long userId = securityUser.getUserId();
        Integer userType = "member".equals(securityUser.getRole()) ? 2 : 1;
        String nickname = params.get("nickname");

        log.info("更新用户信息: userId={}, nickname={}", userId, nickname);

        boolean result = miniUserService.updateUserInfo(userId, userType, nickname);
        return Result.success(result);
    }
}