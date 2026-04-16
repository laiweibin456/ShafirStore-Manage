package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@TableName("sale_order")
public class Order implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long storeId;

    private String orderNo;

    private Long memberId;

    private BigDecimal totalAmount;

    private BigDecimal discountAmount;

    private BigDecimal payAmount;

    private BigDecimal pointsDiscount;

    private Integer payType;

    private Integer orderType;

    private Integer status;

    private String remark;

    private Long operatorId;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String memberName;

    @TableField(exist = false)
    private String memberPhone;

    @TableField(exist = false)
    private String operatorName;

    @TableField(exist = false)
    private List<OrderItem> items;
}