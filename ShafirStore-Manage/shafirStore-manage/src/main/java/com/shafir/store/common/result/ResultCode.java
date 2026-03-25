package com.shafir.store.common.result;

public enum ResultCode {

    SUCCESS(200, "操作成功"),
    FAILED(500, "操作失败"),
    VALIDATE_FAILED(400, "参数校验失败"),
    UNAUTHORIZED(401, "未登录或登录已过期"),
    FORBIDDEN(403, "没有权限访问该资源"),
    NOT_FOUND(404, "资源不存在"),
    INTERNAL_SERVER_ERROR(500, "服务器内部错误"),

    USERNAME_PASSWORD_ERROR(401, "用户名或密码错误"),
    TOKEN_EXPIRED(401, "令牌已过期"),
    TOKEN_INVALID(401, "令牌无效"),
    ACCOUNT_DISABLED(403, "账号已被禁用"),
    USERNAME_EXISTS(400, "用户名已存在"),
    EMAIL_EXISTS(400, "邮箱已被注册"),
    PASSWORD_MISMATCH(400, "两次输入的密码不一致"),

    PRODUCT_NOT_FOUND(404, "商品不存在"),
    PRODUCT_OFF_SHELF(400, "商品已下架"),
    INVENTORY_NOT_FOUND(404, "库存记录不存在"),
    INVENTORY_SHORTAGE(400, "库存不足"),

    MEMBER_NOT_FOUND(404, "会员不存在"),
    POINTS_INSUFFICIENT(400, "积分不足"),

    ORDER_NOT_FOUND(404, "订单不存在"),
    ORDER_CANNOT_CANCEL(400, "订单无法取消"),
    ORDER_CANNOT_REFUND(400, "订单无法退款");

    private final Integer code;
    private final String message;

    ResultCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
