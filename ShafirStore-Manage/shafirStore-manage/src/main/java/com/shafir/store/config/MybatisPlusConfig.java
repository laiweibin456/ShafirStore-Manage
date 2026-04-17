package com.shafir.store.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.shafir.store.common.context.StoreContext;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.operators.relational.EqualsTo;
import net.sf.jsqlparser.schema.Column;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Set;

@Slf4j
@Configuration
public class MybatisPlusConfig {

    private static final Set<String> IGNORE_TABLES = Set.of(
            "store",
            "sys_menu",
            "sys_user",
            "sys_role",
            "member",
            "regular_user",
            "member_store_rel",
            "sys_user_store_rel",
            "store_daily_summary",
            "operation_log"
    );

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();

        TenantLineInnerInterceptor tenantInterceptor = new TenantLineInnerInterceptor();
        tenantInterceptor.setTenantLineHandler(new TenantLineHandler() {
            @Override
            public Expression getTenantId() {
                Long storeId = StoreContext.getCurrentStoreId();
                if (storeId == null) {
                    log.debug("租户ID为null，返回-1（将查询不到数据）");
                    return new LongValue(-1);
                }
                log.debug("租户ID: {}", storeId);
                return new LongValue(storeId);
            }

            @Override
            public String getTenantIdColumn() {
                return "store_id";
            }

            @Override
            public boolean ignoreTable(String tableName) {
                if (StoreContext.isIgnoreTenant()) {
                    log.debug("忽略租户过滤（全局标志）: {}", tableName);
                    return true;
                }
                if (IGNORE_TABLES.contains(tableName)) {
                    log.debug("忽略租户过滤（在忽略列表中）: {}", tableName);
                    return true;
                }
                return false;
            }
        });

        interceptor.addInnerInterceptor(tenantInterceptor);
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }
}
