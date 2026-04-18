package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@TableName("member")
public class Member implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String name;

    private String phone;

    private Integer gender;

    private LocalDate birthday;

    private Integer points;

    private BigDecimal totalConsume;

    private Integer level;

    private String password;

    private Integer status;

    private LocalDateTime registerTime;

    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String levelName;
}