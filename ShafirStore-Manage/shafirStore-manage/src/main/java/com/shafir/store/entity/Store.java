package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("store")
public class Store implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String storeName;

    private String storeCode;

    private String address;

    private String phone;

    private String businessHours;

    private String logoUrl;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
