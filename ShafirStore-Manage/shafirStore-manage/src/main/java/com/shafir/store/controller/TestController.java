package com.shafir.store.controller;

import com.shafir.store.common.result.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api")
public class TestController {

    @GetMapping("/hello")
    public Result<String> hello() {
        log.info("Hello 接口被调用");
        return Result.success("欢迎使用莎菲尔菓子门店管理系统！");
    }

    @GetMapping("/health")
    public Result<Map<String, Object>> health() {
        Map<String, Object> health = new HashMap<>();
        health.put("status", "UP");
        health.put("service", "shafir-store");
        health.put("timestamp", System.currentTimeMillis());
        return Result.success(health);
    }

    @PostMapping("/test")
    public Result<Map<String, Object>> test(@RequestBody Map<String, Object> params) {
        log.info("Test 接口收到参数: {}", params);
        Map<String, Object> result = new HashMap<>();
        result.put("received", params);
        result.put("message", "数据接收成功");
        return Result.success(result);
    }
}
