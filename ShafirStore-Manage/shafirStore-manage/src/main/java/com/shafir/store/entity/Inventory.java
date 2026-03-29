package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("inventory")
public class Inventory implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long productId;

    private Integer quantity;

    private Integer alertThreshold;

    private LocalDateTime lastInTime;

    private LocalDateTime lastOutTime;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String productName;

    @TableField(exist = false)
    private String categoryName;

    @TableField(exist = false)
    private String unit;

    @TableField(exist = false)
    private BigDecimal price;

    @TableField(exist = false)
    private Boolean isLowStock;

    @TableField(exist = false)
    private BigDecimal stockValue;

    public Boolean getIsLowStock() {
        return quantity != null && alertThreshold != null && quantity < alertThreshold;
    }

    public BigDecimal getStockValue() {
        if (price != null && quantity != null) {
            return price.multiply(BigDecimal.valueOf(quantity));
        }
        return BigDecimal.ZERO;
    }
}
