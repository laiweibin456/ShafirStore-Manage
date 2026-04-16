package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("member_store_rel")
public class MemberStoreRel implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long memberId;

    private Long storeId;

    private BigDecimal totalConsume;

    private Integer points;

    private Integer level;

    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
}
