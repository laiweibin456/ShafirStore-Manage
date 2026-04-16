package com.shafir.store.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.shafir.store.common.context.StoreContext;
import com.shafir.store.entity.*;
import com.shafir.store.repository.*;
import com.shafir.store.service.StatisticsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class StatisticsServiceImpl implements StatisticsService {

    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final ProductRepository productRepository;
    private final InventoryRepository inventoryRepository;
    private final MemberRepository memberRepository;
    private final JdbcTemplate jdbcTemplate;

    private static final Map<Integer, String> LEVEL_NAME_MAP = Map.of(
            1, "普通会员",
            2, "银卡会员",
            3, "金卡会员",
            4, "钻石会员"
    );

    @Override
    public Map<String, Object> getDailySales(Integer days) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> salesData = new ArrayList<>();
        List<String> dates = new ArrayList<>();
        List<BigDecimal> amounts = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();

        LocalDate today = LocalDate.now();
        LocalDate startDate = today.minusDays(days - 1);

        String sql = "SELECT DATE(create_time) AS sale_date, " +
                "COUNT(*) AS order_count, " +
                "COALESCE(SUM(pay_amount), 0) AS total_amount " +
                "FROM sale_order " +
                "WHERE create_time BETWEEN ? AND ? " +
                "AND status = 1 AND order_type = 1 " +
                "GROUP BY DATE(create_time) " +
                "ORDER BY sale_date";

        List<Map<String, Object>> dbData;
        try {
            dbData = jdbcTemplate.queryForList(sql,
                    startDate.atStartOfDay(),
                    today.atTime(LocalTime.MAX));
        } catch (Exception e) {
            log.warn("SQL聚合查询失败，回退到内存计算: {}", e.getMessage());
            return getDailySalesFallback(days);
        }

        Map<String, Map<String, Object>> dataMap = new LinkedHashMap<>();
        for (Map<String, Object> row : dbData) {
            String dateStr = null;
            Object dateObj = row.get("sale_date");
            if (dateObj instanceof java.sql.Date) {
                dateStr = ((java.sql.Date) dateObj).toLocalDate().format(DateTimeFormatter.ofPattern("MM-dd"));
            } else if (dateObj != null) {
                dateStr = dateObj.toString();
            }
            if (dateStr != null) {
                dataMap.put(dateStr, row);
            }
        }

        for (int i = days - 1; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            String dateStr = date.format(DateTimeFormatter.ofPattern("MM-dd"));
            dates.add(dateStr);

            Map<String, Object> dayData = dataMap.get(dateStr);
            if (dayData != null) {
                BigDecimal dayAmount = toBigDecimal(dayData.get("total_amount"));
                int dayCount = toInt(dayData.get("order_count"));
                amounts.add(dayAmount);
                counts.add(dayCount);

                Map<String, Object> item = new HashMap<>();
                item.put("date", dateStr);
                item.put("amount", dayAmount);
                item.put("count", dayCount);
                salesData.add(item);
            } else {
                amounts.add(BigDecimal.ZERO);
                counts.add(0);

                Map<String, Object> item = new HashMap<>();
                item.put("date", dateStr);
                item.put("amount", BigDecimal.ZERO);
                item.put("count", 0);
                salesData.add(item);
            }
        }

        result.put("dates", dates);
        result.put("amounts", amounts);
        result.put("counts", counts);
        result.put("data", salesData);

        BigDecimal totalAmount = amounts.stream().reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalCount = counts.stream().reduce(0, Integer::sum);
        BigDecimal avgAmount = totalCount > 0 ? totalAmount.divide(BigDecimal.valueOf(totalCount), 2, RoundingMode.HALF_UP) : BigDecimal.ZERO;

        result.put("totalAmount", totalAmount);
        result.put("totalCount", totalCount);
        result.put("avgAmount", avgAmount);

        return result;
    }

    private Map<String, Object> getDailySalesFallback(Integer days) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> salesData = new ArrayList<>();
        List<String> dates = new ArrayList<>();
        List<BigDecimal> amounts = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();

        LocalDate today = LocalDate.now();

        for (int i = days - 1; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            LocalDateTime startOfDay = date.atStartOfDay();
            LocalDateTime endOfDay = date.atTime(LocalTime.MAX);

            LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
            wrapper.between(Order::getCreateTime, startOfDay, endOfDay);
            wrapper.eq(Order::getStatus, 1);
            wrapper.eq(Order::getOrderType, 1);

            List<Order> orders = orderRepository.selectList(wrapper);

            BigDecimal dayAmount = BigDecimal.ZERO;
            for (Order order : orders) {
                if (order.getPayAmount() != null) {
                    dayAmount = dayAmount.add(order.getPayAmount());
                }
            }

            String dateStr = date.format(DateTimeFormatter.ofPattern("MM-dd"));
            dates.add(dateStr);
            amounts.add(dayAmount);
            counts.add(orders.size());

            Map<String, Object> dayData = new HashMap<>();
            dayData.put("date", dateStr);
            dayData.put("amount", dayAmount);
            dayData.put("count", orders.size());
            salesData.add(dayData);
        }

        result.put("dates", dates);
        result.put("amounts", amounts);
        result.put("counts", counts);
        result.put("data", salesData);

        BigDecimal totalAmount = amounts.stream().reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalCount = counts.stream().reduce(0, Integer::sum);
        BigDecimal avgAmount = totalCount > 0 ? totalAmount.divide(BigDecimal.valueOf(totalCount), 2, RoundingMode.HALF_UP) : BigDecimal.ZERO;

        result.put("totalAmount", totalAmount);
        result.put("totalCount", totalCount);
        result.put("avgAmount", avgAmount);

        return result;
    }

    @Override
    public Map<String, Object> getMonthlySales(Integer months) {
        Map<String, Object> result = new HashMap<>();
        List<Map<String, Object>> salesData = new ArrayList<>();
        List<String> monthsList = new ArrayList<>();
        List<BigDecimal> amounts = new ArrayList<>();
        List<Integer> counts = new ArrayList<>();

        LocalDate today = LocalDate.now();

        for (int i = months - 1; i >= 0; i--) {
            LocalDate monthDate = today.minusMonths(i);
            int year = monthDate.getYear();
            int month = monthDate.getMonthValue();

            LocalDateTime startOfMonth = LocalDate.of(year, month, 1).atStartOfDay();
            LocalDateTime endOfMonth = LocalDate.of(year, month, 1).plusMonths(1).atTime(LocalTime.MAX).minusSeconds(1);

            LambdaQueryWrapper<Order> wrapper = new LambdaQueryWrapper<>();
            wrapper.between(Order::getCreateTime, startOfMonth, endOfMonth);
            wrapper.eq(Order::getStatus, 1);
            wrapper.eq(Order::getOrderType, 1);

            List<Order> orders = orderRepository.selectList(wrapper);

            BigDecimal monthAmount = BigDecimal.ZERO;
            for (Order order : orders) {
                if (order.getPayAmount() != null) {
                    monthAmount = monthAmount.add(order.getPayAmount());
                }
            }

            String monthStr = year + "-" + String.format("%02d", month);
            monthsList.add(monthStr);
            amounts.add(monthAmount);
            counts.add(orders.size());

            Map<String, Object> monthData = new HashMap<>();
            monthData.put("month", monthStr);
            monthData.put("amount", monthAmount);
            monthData.put("count", orders.size());
            salesData.add(monthData);
        }

        result.put("months", monthsList);
        result.put("amounts", amounts);
        result.put("counts", counts);
        result.put("data", salesData);

        BigDecimal totalAmount = amounts.stream().reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalCount = counts.stream().reduce(0, Integer::sum);

        result.put("totalAmount", totalAmount);
        result.put("totalCount", totalCount);

        return result;
    }

    @Override
    public Map<String, Object> getProductSalesRanking(Integer limit) {
        Map<String, Object> result = new HashMap<>();

        LocalDateTime startDate = LocalDate.now().minusMonths(1).atStartOfDay();

        LambdaQueryWrapper<OrderItem> wrapper = new LambdaQueryWrapper<>();
        wrapper.ge(OrderItem::getCreateTime, startDate);
        List<OrderItem> items = orderItemRepository.selectList(wrapper);

        Map<Long, Map<String, Object>> productStats = new LinkedHashMap<>();
        for (OrderItem item : items) {
            Long productId = item.getProductId();
            if (productStats.containsKey(productId)) {
                Map<String, Object> stats = productStats.get(productId);
                int quantity = (int) stats.get("quantity") + item.getQuantity();
                BigDecimal amount = (BigDecimal) stats.get("amount");
                stats.put("quantity", quantity);
                stats.put("amount", amount.add(item.getSubtotal() != null ? item.getSubtotal() : BigDecimal.ZERO));
            } else {
                Map<String, Object> stats = new HashMap<>();
                stats.put("productId", productId);
                stats.put("productName", item.getProductName());
                stats.put("quantity", item.getQuantity());
                stats.put("amount", item.getSubtotal() != null ? item.getSubtotal() : BigDecimal.ZERO);
                productStats.put(productId, stats);
            }
        }

        List<Map<String, Object>> ranking = productStats.values().stream()
                .sorted((a, b) -> {
                    BigDecimal amountA = (BigDecimal) a.get("amount");
                    BigDecimal amountB = (BigDecimal) b.get("amount");
                    if (amountA == null) amountA = BigDecimal.ZERO;
                    if (amountB == null) amountB = BigDecimal.ZERO;
                    return amountB.compareTo(amountA);
                })
                .limit(limit)
                .collect(Collectors.toList());

        int[] index = {0};
        ranking.forEach(item -> item.put("rank", index[0]++ + 1));

        result.put("ranking", ranking);

        BigDecimal totalAmount = ranking.stream()
                .map(m -> (BigDecimal) m.get("amount"))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        int totalQuantity = ranking.stream()
                .mapToInt(m -> (int) m.get("quantity"))
                .sum();

        result.put("totalAmount", totalAmount);
        result.put("totalQuantity", totalQuantity);

        return result;
    }

    @Override
    public Map<String, Object> getInventorySummary() {
        Map<String, Object> result = new HashMap<>();

        LambdaQueryWrapper<Inventory> invWrapper = new LambdaQueryWrapper<>();
        List<Inventory> inventories = inventoryRepository.selectList(invWrapper);

        LambdaQueryWrapper<Product> prodWrapper = new LambdaQueryWrapper<>();
        prodWrapper.eq(Product::getStatus, 1);
        List<Product> products = productRepository.selectList(prodWrapper);

        int totalProducts = products.size();
        int totalStock = inventories.stream().mapToInt(i -> i.getQuantity() != null ? i.getQuantity() : 0).sum();
        int lowStockCount = (int) inventories.stream().filter(i -> i.getIsLowStock() != null && i.getIsLowStock()).count();
        int outOfStockCount = (int) inventories.stream().filter(i -> i.getQuantity() != null && i.getQuantity() <= 0).count();

        BigDecimal totalValue = BigDecimal.ZERO;
        for (Inventory inv : inventories) {
            if (inv.getQuantity() != null && inv.getQuantity() > 0) {
                Product product = productRepository.selectById(inv.getProductId());
                if (product != null && product.getPrice() != null) {
                    totalValue = totalValue.add(product.getPrice().multiply(BigDecimal.valueOf(inv.getQuantity())));
                }
            }
        }

        result.put("totalProducts", totalProducts);
        result.put("totalStock", totalStock);
        result.put("lowStockCount", lowStockCount);
        result.put("outOfStockCount", outOfStockCount);
        result.put("totalValue", totalValue);

        return result;
    }

    @Override
    public Map<String, Object> getLowStockProducts(Integer limit) {
        Map<String, Object> result = new HashMap<>();

        LambdaQueryWrapper<Inventory> wrapper = new LambdaQueryWrapper<>();
        List<Inventory> inventories = inventoryRepository.selectList(wrapper);

        List<Long> productIds = inventories.stream()
                .filter(inv -> inv.getIsLowStock() != null && inv.getIsLowStock())
                .map(Inventory::getProductId)
                .collect(Collectors.toList());

        Map<Long, Product> productMap;
        if (!productIds.isEmpty()) {
            List<Product> products = productRepository.selectBatchIds(productIds);
            productMap = products.stream().collect(Collectors.toMap(Product::getId, p -> p));
        } else {
            productMap = Map.of();
        }

        List<Map<String, Object>> lowStockProducts = inventories.stream()
                .filter(inv -> inv.getIsLowStock() != null && inv.getIsLowStock())
                .map(inv -> {
                    Map<String, Object> item = new HashMap<>();
                    item.put("productId", inv.getProductId());
                    Product product = productMap.get(inv.getProductId());
                    item.put("productName", product != null ? product.getName() : "未知商品");
                    item.put("quantity", inv.getQuantity());
                    item.put("alertThreshold", inv.getAlertThreshold());
                    item.put("unit", product != null ? product.getUnit() : "个");
                    item.put("lastInTime", inv.getLastInTime());
                    item.put("lastOutTime", inv.getLastOutTime());
                    return item;
                })
                .sorted(Comparator.comparing(m -> (int) m.get("quantity")))
                .limit(limit)
                .collect(Collectors.toList());

        result.put("products", lowStockProducts);
        result.put("total", lowStockProducts.size());

        return result;
    }

    @Override
    public Map<String, Object> getMemberSummary() {
        Map<String, Object> result = new HashMap<>();

        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        List<Member> members = memberRepository.selectList(wrapper);

        int totalMembers = members.size();
        int activeMembers = (int) members.stream().filter(m -> m.getStatus() != null && m.getStatus() == 1).count();

        BigDecimal totalConsume = members.stream()
                .map(m -> m.getTotalConsume() != null ? m.getTotalConsume() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        int totalPoints = members.stream()
                .mapToInt(m -> m.getPoints() != null ? m.getPoints() : 0)
                .sum();

        Map<Integer, Long> levelDistribution = members.stream()
                .collect(Collectors.groupingBy(
                        m -> m.getLevel() != null ? m.getLevel() : 1,
                        Collectors.counting()
                ));

        result.put("totalMembers", totalMembers);
        result.put("activeMembers", activeMembers);
        result.put("totalConsume", totalConsume);
        result.put("totalPoints", totalPoints);
        result.put("levelDistribution", levelDistribution);

        return result;
    }

    @Override
    public Map<String, Object> getNewMembers(Integer days) {
        Map<String, Object> result = new HashMap<>();

        LocalDateTime startDate = LocalDate.now().minusDays(days).atStartOfDay();

        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.ge(Member::getRegisterTime, startDate);
        List<Member> newMembers = memberRepository.selectList(wrapper);

        List<Map<String, Object>> memberList = newMembers.stream()
                .map(m -> {
                    Map<String, Object> item = new HashMap<>();
                    item.put("id", m.getId());
                    item.put("name", m.getName());
                    item.put("phone", m.getPhone());
                    item.put("level", m.getLevel());
                    item.put("levelName", LEVEL_NAME_MAP.getOrDefault(m.getLevel(), "普通会员"));
                    item.put("registerTime", m.getRegisterTime());
                    return item;
                })
                .collect(Collectors.toList());

        result.put("members", memberList);
        result.put("total", memberList.size());

        return result;
    }

    @Override
    public Map<String, Object> getMemberConsumeRanking(Integer limit) {
        Map<String, Object> result = new HashMap<>();

        LambdaQueryWrapper<Member> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(Member::getTotalConsume);
        List<Member> members = memberRepository.selectList(wrapper);

        List<Map<String, Object>> ranking = members.stream()
                .limit(limit)
                .map(m -> {
                    Map<String, Object> item = new HashMap<>();
                    item.put("memberId", m.getId());
                    item.put("name", m.getName());
                    item.put("phone", m.getPhone());
                    item.put("level", m.getLevel());
                    item.put("levelName", LEVEL_NAME_MAP.getOrDefault(m.getLevel(), "普通会员"));
                    item.put("totalConsume", m.getTotalConsume() != null ? m.getTotalConsume() : BigDecimal.ZERO);
                    item.put("points", m.getPoints() != null ? m.getPoints() : 0);
                    return item;
                })
                .collect(Collectors.toList());

        int[] index = {0};
        ranking.forEach(item -> item.put("rank", index[0]++ + 1));

        result.put("ranking", ranking);

        return result;
    }

    @Override
    public Map<String, Object> getOverview() {
        Map<String, Object> result = new HashMap<>();

        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
        LocalDateTime todayEnd = LocalDate.now().atTime(LocalTime.MAX);

        LambdaQueryWrapper<Order> todayOrderWrapper = new LambdaQueryWrapper<>();
        todayOrderWrapper.between(Order::getCreateTime, todayStart, todayEnd);
        todayOrderWrapper.eq(Order::getStatus, 1);
        todayOrderWrapper.eq(Order::getOrderType, 1);
        List<Order> todayOrders = orderRepository.selectList(todayOrderWrapper);

        BigDecimal todaySales = todayOrders.stream()
                .map(o -> o.getPayAmount() != null ? o.getPayAmount() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        int todayOrderCount = todayOrders.size();

        LambdaQueryWrapper<Order> allOrderWrapper = new LambdaQueryWrapper<>();
        allOrderWrapper.eq(Order::getStatus, 1);
        allOrderWrapper.eq(Order::getOrderType, 1);
        List<Order> allOrders = orderRepository.selectList(allOrderWrapper);

        BigDecimal totalAmount = allOrders.stream()
                .map(o -> o.getPayAmount() != null ? o.getPayAmount() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        int totalCount = allOrders.size();
        BigDecimal avgAmount = totalCount > 0 ? totalAmount.divide(BigDecimal.valueOf(totalCount), 2, RoundingMode.HALF_UP) : BigDecimal.ZERO;

        LambdaQueryWrapper<Product> productWrapper = new LambdaQueryWrapper<>();
        productWrapper.eq(Product::getStatus, 1);
        long productCount = productRepository.selectCount(productWrapper);

        LambdaQueryWrapper<Member> memberWrapper = new LambdaQueryWrapper<>();
        long memberCount = memberRepository.selectCount(memberWrapper);

        LambdaQueryWrapper<Inventory> invWrapper = new LambdaQueryWrapper<>();
        List<Inventory> inventories = inventoryRepository.selectList(invWrapper);
        long alertCount = inventories.stream()
                .filter(i -> i.getIsLowStock() != null && i.getIsLowStock())
                .count();

        result.put("todaySales", todaySales);
        result.put("todayOrderCount", todayOrderCount);
        result.put("productCount", productCount);
        result.put("memberCount", memberCount);
        result.put("alertCount", alertCount);
        result.put("totalAmount", totalAmount);
        result.put("totalCount", totalCount);
        result.put("avgAmount", avgAmount);

        return result;
    }

    @Override
    public Map<String, Object> getCrossStoreOverview() {
        Map<String, Object> result = new HashMap<>();

        boolean oldIgnore = StoreContext.isIgnoreTenant();
        try {
            StoreContext.setIgnoreTenant(true);

            String storeSql = "SELECT s.id AS storeId, s.store_name AS storeName, " +
                    "COALESCE(o.order_count, 0) AS orderCount, " +
                    "COALESCE(o.total_amount, 0) AS totalAmount " +
                    "FROM store s " +
                    "LEFT JOIN (" +
                    "  SELECT store_id, COUNT(*) AS order_count, SUM(pay_amount) AS total_amount " +
                    "  FROM sale_order WHERE status = 1 AND order_type = 1 " +
                    "  AND create_time >= CURDATE() " +
                    "  GROUP BY store_id" +
                    ") o ON s.id = o.store_id " +
                    "WHERE s.status = 1 " +
                    "ORDER BY s.id";

            List<Map<String, Object>> storeStats;
            try {
                storeStats = jdbcTemplate.queryForList(storeSql);
            } catch (Exception e) {
                log.warn("跨店铺统计SQL查询失败: {}", e.getMessage());
                storeStats = List.of();
            }

            result.put("storeStats", storeStats);

            String totalSql = "SELECT COUNT(*) AS totalCount, COALESCE(SUM(pay_amount), 0) AS totalAmount " +
                    "FROM sale_order WHERE status = 1 AND order_type = 1 AND create_time >= CURDATE()";

            try {
                Map<String, Object> totalData = jdbcTemplate.queryForMap(totalSql);
                result.put("todayTotalCount", toInt(totalData.get("totalCount")));
                result.put("todayTotalAmount", toBigDecimal(totalData.get("totalAmount")));
            } catch (Exception e) {
                result.put("todayTotalCount", 0);
                result.put("todayTotalAmount", BigDecimal.ZERO);
            }

            result.put("storeCount", storeStats.size());
        } finally {
            if (oldIgnore) {
                StoreContext.setIgnoreTenant(true);
            } else {
                StoreContext.setIgnoreTenant(false);
            }
        }

        return result;
    }

    private BigDecimal toBigDecimal(Object value) {
        if (value == null) return BigDecimal.ZERO;
        if (value instanceof BigDecimal) return (BigDecimal) value;
        if (value instanceof Number) return BigDecimal.valueOf(((Number) value).doubleValue());
        try {
            return new BigDecimal(value.toString());
        } catch (Exception e) {
            return BigDecimal.ZERO;
        }
    }

    private int toInt(Object value) {
        if (value == null) return 0;
        if (value instanceof Number) return ((Number) value).intValue();
        try {
            return Integer.parseInt(value.toString());
        } catch (Exception e) {
            return 0;
        }
    }
}
