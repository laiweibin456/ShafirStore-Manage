package com.shafir.store.security;

import com.shafir.store.common.context.StoreContext;
import com.shafir.store.common.utils.JwtUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        try {
            String token = extractToken(request);

            if (StringUtils.hasText(token) && jwtUtil.validateToken(token)) {
                Long userId = jwtUtil.getUserIdFromToken(token);
                String username = jwtUtil.getUsernameFromToken(token);
                String role = jwtUtil.getRoleFromToken(token);
                Long storeId = jwtUtil.getStoreIdFromToken(token);
                List<Long> storeIds = jwtUtil.getStoreIdsFromToken(token);

                SecurityUser securityUser = new SecurityUser(userId, username, role, storeId, storeIds,
                        Collections.singletonList(new SimpleGrantedAuthority(role)));

                UsernamePasswordAuthenticationToken authentication =
                        new UsernamePasswordAuthenticationToken(securityUser, null, securityUser.getAuthorities());

                SecurityContextHolder.getContext().setAuthentication(authentication);

                Long targetStoreId = resolveStoreId(securityUser, request);
                if (targetStoreId != null) {
                    StoreContext.setCurrentStoreId(targetStoreId);
                }
            }
        } catch (Exception e) {
            log.error("JWT 认证失败: {}", e.getMessage());
        }

        filterChain.doFilter(request, response);
    }

    private String extractToken(HttpServletRequest request) {
        String bearerToken = request.getHeader("Authorization");
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
            return bearerToken.substring(7);
        }
        return null;
    }

    private Long resolveStoreId(SecurityUser securityUser, HttpServletRequest request) {
        Long headerStoreId = null;
        String storeIdHeader = request.getHeader("X-Store-Id");
        if (storeIdHeader != null && !storeIdHeader.isEmpty()) {
            try {
                headerStoreId = Long.parseLong(storeIdHeader);
            } catch (NumberFormatException ignored) {
            }
        }

        if (securityUser.isSuperAdmin()) {
            if (headerStoreId != null) {
                return headerStoreId;
            }
            return null;
        }

        if (headerStoreId != null && securityUser.getStoreIds() != null
                && securityUser.getStoreIds().contains(headerStoreId)) {
            return headerStoreId;
        }

        return securityUser.getStoreId();
    }
}
