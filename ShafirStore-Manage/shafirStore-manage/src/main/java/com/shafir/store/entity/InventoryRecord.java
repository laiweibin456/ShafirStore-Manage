package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("inventory_record")
public class InventoryRecord implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long productId;

    private Integer type;

    private Integer quantity;

    private Integer beforeQuantity;

    private Integer afterQuantity;

    private Long orderId;

    private Long operatorId;

    private String remark;

    private LocalDateTime createTime;

    @TableField(exist = false)
    private String productName;

    @TableField(exist = false)
    private String operatorName;

    @TableField(exist = false)
    private String typeName;

    public String getTypeName() {
        if (type == null) return "";
        return switch (type) {
            case 1 -> "入库";
            case 2 -> "出库";
            case 3 -> "盘点调整";
            default -> "未知";
        };
    }
}
