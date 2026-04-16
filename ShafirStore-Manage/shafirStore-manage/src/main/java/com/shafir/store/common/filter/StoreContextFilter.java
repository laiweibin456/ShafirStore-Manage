package com.shafir.store.common.filter;

import com.shafir.store.common.context.StoreContext;
import com.shafir.store.security.SecurityUser;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE + 10)
public class StoreContextFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication != null && authentication.getPrincipal() instanceof SecurityUser) {
                SecurityUser securityUser = (SecurityUser) authentication.getPrincipal();
                Long storeId = securityUser.getStoreId();
                if (storeId != null) {
                    StoreContext.setCurrentStoreId(storeId);
                }
            }

            HttpServletRequest httpRequest = (HttpServletRequest) request;
            String storeIdHeader = httpRequest.getHeader("X-Store-Id");
            if (storeIdHeader != null && !storeIdHeader.isEmpty()) {
                try {
                    StoreContext.setCurrentStoreId(Long.parseLong(storeIdHeader));
                } catch (NumberFormatException ignored) {
                }
            }

            chain.doFilter(request, response);
        } finally {
            StoreContext.clear();
        }
    }
}
