package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shafir.store.entity.Role;
import com.shafir.store.entity.User;
import com.shafir.store.repository.RoleRepository;
import com.shafir.store.repository.UserRepository;
import com.shafir.store.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    @Override
    public User getByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        return userRepository.selectOne(wrapper);
    }

    @Override
    public User getById(Long id) {
        return userRepository.selectById(id);
    }

    @Override
    public User getUserWithRole(Long id) {
        User user = userRepository.selectById(id);
        if (user != null && user.getRoleId() != null) {
            Role role = roleRepository.selectById(user.getRoleId());
            if (role != null) {
                user.setRoleName(role.getRoleName());
                user.setRoleKey(role.getRoleKey());
            }
        }
        return user;
    }

    @Override
    public boolean register(User user) {
        return userRepository.insert(user) > 0;
    }

    @Override
    public boolean existsByUsername(String username) {
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        return userRepository.selectCount(wrapper) > 0;
    }

    @Override
    public boolean existsByEmail(String email) {
        if (!StringUtils.hasText(email)) {
            return false;
        }
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getEmail, email);
        return userRepository.selectCount(wrapper) > 0;
    }

    @Override
    public IPage<User> selectPage(Integer pageNum, Integer pageSize, String username, String realName, Long roleId, Integer status) {
        Page<User> page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();

        if (StringUtils.hasText(username)) {
            wrapper.like(User::getUsername, username);
        }
        if (StringUtils.hasText(realName)) {
            wrapper.like(User::getRealName, realName);
        }
        if (roleId != null) {
            wrapper.eq(User::getRoleId, roleId);
        }
        if (status != null) {
            wrapper.eq(User::getStatus, status);
        }

        wrapper.orderByAsc(User::getId);
        IPage<User> resultPage = userRepository.selectPage(page, wrapper);

        for (User user : resultPage.getRecords()) {
            if (user.getRoleId() != null) {
                Role role = roleRepository.selectById(user.getRoleId());
                if (role != null) {
                    user.setRoleName(role.getRoleName());
                    user.setRoleKey(role.getRoleKey());
                }
            }
            user.setPassword(null);
        }

        return resultPage;
    }

    @Override
    public List<User> getAllRoles() {
        List<Role> roles = roleRepository.selectList(null);
        List<User> roleList = new ArrayList<>();
        for (Role role : roles) {
            User roleUser = new User();
            roleUser.setRoleId(role.getId());
            roleUser.setRoleName(role.getRoleName());
            roleUser.setRoleKey(role.getRoleKey());
            roleList.add(roleUser);
        }
        return roleList;
    }

    @Override
    @Transactional
    public boolean addUser(User user) {
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            user.setPassword("123456");
        }
        if (user.getStatus() == null) {
            user.setStatus(1);
        }
        Long maxId = userRepository.getMaxId();
        user.setId(maxId + 1);
        return userRepository.insert(user) > 0;
    }

    @Override
    @Transactional
    public boolean updateUser(User user) {
        user.setPassword(null);
        return userRepository.updateById(user) > 0;
    }

    @Override
    @Transactional
    public boolean updateStatus(Long id, Integer status) {
        User user = new User();
        user.setId(id);
        user.setStatus(status);
        return userRepository.updateById(user) > 0;
    }

    @Override
    @Transactional
    public boolean deleteUser(Long id) {
        return userRepository.deleteById(id) > 0;
    }

    @Override
    @Transactional
    public boolean resetPassword(Long id, String password) {
        if (password == null || password.isEmpty()) {
            password = "123456";
        }
        User user = new User();
        user.setId(id);
        user.setPassword(password);
        return userRepository.updateById(user) > 0;
    }
}