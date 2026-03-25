package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.shafir.store.entity.Role;
import com.shafir.store.entity.User;
import com.shafir.store.repository.RoleRepository;
import com.shafir.store.repository.UserRepository;
import com.shafir.store.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
}
