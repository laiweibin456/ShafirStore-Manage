package com.shafir.store.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.shafir.store.common.context.StoreContext;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.expression.NullValue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Set;

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
                if (StoreContext.isIgnoreTenant()) {
                    return new NullValue();
                }
                Long storeId = StoreContext.getCurrentStoreId();
                return new LongValue(storeId != null ? storeId : 0L);
            }

            @Override
            public String getTenantIdColumn() {
                return "store_id";
            }

            @Override
            public boolean ignoreTable(String tableName) {
                return IGNORE_TABLES.contains(tableName) || StoreContext.isIgnoreTenant();
            }
        });

        interceptor.addInnerInterceptor(tenantInterceptor);
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }
}
