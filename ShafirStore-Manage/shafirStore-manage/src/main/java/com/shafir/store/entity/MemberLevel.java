package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("member_level")
public class MemberLevel implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long storeId;

    private String name;

    private Integer level;

    private BigDecimal discount;

    private BigDecimal minAmount;

    private Integer pointsRate;

    private Integer status;

    private LocalDateTime createTime;
}