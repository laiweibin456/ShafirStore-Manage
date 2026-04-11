package com.shafir.store.service;

import com.shafir.store.entity.Member;
import com.shafir.store.entity.RegularUser;

import java.util.Map;

public interface MiniUserService {

    RegularUser register(String phone, String password, String nickname);

    Map<String, Object> login(String phone, String password);

    Map<String, Object> getUserInfo(Long userId, Integer userType);

    boolean updateUserInfo(Long userId, Integer userType, String nickname);

    Member upgradeToMember(RegularUser user);
}