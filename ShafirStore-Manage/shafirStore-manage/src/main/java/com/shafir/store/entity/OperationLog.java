package com.shafir.store.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("operation_log")
public class OperationLog implements Serializable {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long userId;

    private String username;

    private String roleKey;

    private Long storeId;

    private String operation;

    private String method;

    private String requestUrl;

    private String requestMethod;

    private String requestParams;

    private String ip;

    private Long duration;

    private Integer status;

    private String errorMsg;

    private LocalDateTime createTime;
}
