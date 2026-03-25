package com.shafir.store.service;

import com.shafir.store.entity.User;

public interface UserService {

    User getByUsername(String username);

    User getById(Long id);

    User getUserWithRole(Long id);

    boolean register(User user);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}
