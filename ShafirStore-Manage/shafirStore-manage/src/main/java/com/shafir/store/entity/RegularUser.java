package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("regular_user")
public class RegularUser implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String phone;

    private String password;

    private String nickname;

    private BigDecimal totalConsume;

    private LocalDateTime createTime;

    private Integer status;
}