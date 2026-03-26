package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.entity.User;
import com.shafir.store.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping
    public Result<IPage<User>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String username,
            @RequestParam(required = false) String realName,
            @RequestParam(required = false) Long roleId,
            @RequestParam(required = false) Integer status) {
        log.info("分页查询用户: pageNum={}, pageSize={}, username={}, realName={}, roleId={}, status={}",
                pageNum, pageSize, username, realName, roleId, status);
        IPage<User> page = userService.selectPage(pageNum, pageSize, username, realName, roleId, status);
        return Result.success(page);
    }

    @GetMapping("/{id}")
    public Result<User> getById(@PathVariable Long id) {
        log.info("查询用户详情: id={}", id);
        User user = userService.getUserWithRole(id);
        if (user == null) {
            return Result.error(ResultCode.NOT_FOUND);
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
    public Result<Boolean> add(@RequestBody User user) {
        log.info("新增用户: {}", user.getUsername());

        if (userService.existsByUsername(user.getUsername())) {
            return Result.error(ResultCode.USERNAME_EXISTS);
        }

        if (user.getEmail() != null && !user.getEmail().isEmpty() && userService.existsByEmail(user.getEmail())) {
            return Result.error(ResultCode.EMAIL_EXISTS);
        }

        boolean result = userService.addUser(user);
        return Result.success(result);
    }

    @PutMapping("/{id}")
    public Result<Boolean> update(@PathVariable Long id, @RequestBody User user) {
        log.info("更新用户: id={}", id);
        user.setId(id);
        boolean result = userService.updateUser(user);
        return Result.success(result);
    }

    @PutMapping("/{id}/status")
    public Result<Boolean> updateStatus(@PathVariable Long id, @RequestParam Integer status) {
        log.info("更新用户状态: id={}, status={}", id, status);
        boolean result = userService.updateStatus(id, status);
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    public Result<Boolean> delete(@PathVariable Long id) {
        log.info("删除用户: id={}", id);
        boolean result = userService.deleteUser(id);
        return Result.success(result);
    }

    @PutMapping("/{id}/password")
    public Result<Boolean> resetPassword(@PathVariable Long id, @RequestParam String password) {
        log.info("重置用户密码: id={}", id);
        boolean result = userService.resetPassword(id, password);
        return Result.success(result);
    }
}