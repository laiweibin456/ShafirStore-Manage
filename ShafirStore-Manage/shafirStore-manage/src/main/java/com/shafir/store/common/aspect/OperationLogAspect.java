package com.shafir.store.common.aspect;

import com.shafir.store.common.context.StoreContext;
import com.shafir.store.entity.OperationLog;
import com.shafir.store.repository.OperationLogRepository;
import com.shafir.store.security.SecurityUser;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.time.LocalDateTime;

@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class OperationLogAspect {

    private final OperationLogRepository operationLogRepository;

    @Pointcut("execution(* com.shafir.store.controller.*Controller.*(..)) " +
            "&& !execution(* com.shafir.store.controller.AuthController.*(..)) " +
            "&& !execution(* com.shafir.store.controller.StatisticsController.*(..))")
    public void controllerPointcut() {
    }

    @Around("controllerPointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long startTime = System.currentTimeMillis();

        OperationLog operationLog = new OperationLog();
        operationLog.setCreateTime(LocalDateTime.now());

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes != null) {
            HttpServletRequest request = attributes.getRequest();
            operationLog.setRequestUrl(request.getRequestURI());
            operationLog.setRequestMethod(request.getMethod());
            operationLog.setIp(getClientIp(request));
        }

        String className = point.getTarget().getClass().getSimpleName();
        String methodName = point.getSignature().getName();
        operationLog.setMethod(className + "." + methodName);
        operationLog.setOperation(className.replace("Controller", "") + "-" + methodName);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()
                && authentication.getPrincipal() instanceof SecurityUser) {
            SecurityUser securityUser = (SecurityUser) authentication.getPrincipal();
            operationLog.setUserId(securityUser.getUserId());
            operationLog.setUsername(securityUser.getUsername());
            operationLog.setRoleKey(securityUser.getRole());
            operationLog.setStoreId(securityUser.getStoreId());
        }

        operationLog.setStoreId(StoreContext.getCurrentStoreId());

        Object result;
        try {
            result = point.proceed();
            operationLog.setStatus(1);
        } catch (Throwable e) {
            operationLog.setStatus(0);
            String errorMsg = e.getMessage();
            if (errorMsg != null && errorMsg.length() > 500) {
                errorMsg = errorMsg.substring(0, 500);
            }
            operationLog.setErrorMsg(errorMsg);
            throw e;
        } finally {
            operationLog.setDuration(System.currentTimeMillis() - startTime);
            try {
                operationLogRepository.insert(operationLog);
            } catch (Exception e) {
                log.warn("记录操作日志失败: {}", e.getMessage());
            }
        }

        return result;
    }

    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip != null && ip.contains(",")) {
            ip = ip.split(",")[0].trim();
        }
        return ip;
    }
}
