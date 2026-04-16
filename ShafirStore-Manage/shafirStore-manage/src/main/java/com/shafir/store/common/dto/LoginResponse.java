package com.shafir.store.common.dto;

import lombok.Data;

import java.util.List;

@Data
public class LoginResponse {

    private String token;

    private UserInfo userInfo;

    @Data
    public static class UserInfo {
        private Long id;
        private String username;
        private String realName;
        private String phone;
        private String roleName;
        private String roleKey;
        private Long storeId;
        private List<Long> storeIds;
        private boolean isSuperAdmin;
    }
}
