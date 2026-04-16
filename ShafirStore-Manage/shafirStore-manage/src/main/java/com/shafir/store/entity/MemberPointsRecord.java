package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("member_points_record")
public class MemberPointsRecord implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long storeId;

    private Long memberId;

    private Integer type;

    private Integer points;

    private Integer balance;

    private Long orderId;

    private String remark;

    private LocalDateTime createTime;

    @TableField(exist = false)
    private String memberName;
}