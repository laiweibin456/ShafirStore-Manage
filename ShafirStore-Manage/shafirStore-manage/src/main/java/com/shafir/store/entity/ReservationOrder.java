package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@TableName("reservation_order")
public class ReservationOrder implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String orderNo;

    private Long userId;

    private Integer userType;

    private BigDecimal totalAmount;

    private BigDecimal discountAmount;

    private BigDecimal payAmount;

    private Integer status;

    private LocalDateTime pickupTime;

    private String remark;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String statusName;

    @TableField(exist = false)
    private String userPhone;

    @TableField(exist = false)
    private String userNickname;

    @TableField(exist = false)
    private String memberLevelName;

    @TableField(exist = false)
    private List<ReservationOrderItem> items;
}