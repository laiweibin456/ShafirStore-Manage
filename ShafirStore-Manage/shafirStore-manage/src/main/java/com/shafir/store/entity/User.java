package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("sys_user")
public class User implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long storeId;

    private String username;

    private String password;

    private String realName;

    private String phone;

    private String email;

    private String avatar;

    private Long roleId;

    @TableField(exist = false)
    private String roleName;

    @TableField(exist = false)
    private String roleKey;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
