package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.User;

import java.util.List;

public interface UserService {

    User getByUsername(String username);

    User getById(Long id);

    User getUserWithRole(Long id);

    boolean register(User user);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    IPage<User> selectPage(Integer pageNum, Integer pageSize, String username, String realName, Long roleId, Integer status);

    List<User> getAllRoles();

    boolean addUser(User user);

    boolean updateUser(User user);

    boolean updateStatus(Long id, Integer status);

    boolean deleteUser(Long id);

    boolean resetPassword(Long id, String password);
}