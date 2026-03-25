package com.shafir.store.service;

import com.shafir.store.entity.User;

public interface UserService {

    User getByUsername(String username);

    User getById(Long id);

    User getUserWithRole(Long id);
}
