package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("sale_order_item")
public class OrderItem implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long storeId;

    private Long orderId;

    private Long productId;

    private String productName;

    private BigDecimal price;

    private BigDecimal originalPrice;

    private Integer quantity;

    private BigDecimal subtotal;

    private Boolean isPointsExchange;

    private Integer requiredPoints;

    private LocalDateTime createTime;

    @TableField(exist = false)
    private String unit;

    @TableField(exist = false)
    private String imageUrl;
}