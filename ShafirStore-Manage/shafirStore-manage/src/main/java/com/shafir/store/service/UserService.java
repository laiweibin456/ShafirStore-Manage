package com.shafir.store.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.entity.User;

import java.util.List;

public interface UserService {

    User getByUsername(String username);

    User getById(Long id);

    User getUserWithRole(Long id);

    User getUserWithRoleAndStore(Long id);

    boolean register(User user);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

    IPage<User> selectPage(Integer pageNum, Integer pageSize, String username, String realName, Long roleId, Integer status);

    IPage<User> selectPageWithFilter(Integer pageNum, Integer pageSize, String username, String realName, Long roleId, Integer status, Long storeId, boolean isSuperAdmin);

    List<User> getAllRoles();

    List<User> getAllRolesForUser(boolean isSuperAdmin);

    boolean addUser(User user);

    boolean updateUser(User user);

    boolean updateStatus(Long id, Integer status);

    boolean deleteUser(Long id);

    boolean resetPassword(Long id, String password);
}
