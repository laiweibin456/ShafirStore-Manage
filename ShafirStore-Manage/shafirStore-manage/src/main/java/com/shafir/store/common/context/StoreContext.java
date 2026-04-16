package com.shafir.store.common.context;

public class StoreContext {

    private static final ThreadLocal<Long> STORE_ID = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> IGNORE_TENANT = new ThreadLocal<>();

    public static void setCurrentStoreId(Long storeId) {
        STORE_ID.set(storeId);
    }

    public static Long getCurrentStoreId() {
        return STORE_ID.get();
    }

    public static void setIgnoreTenant(boolean ignore) {
        IGNORE_TENANT.set(ignore);
    }

    public static boolean isIgnoreTenant() {
        Boolean ignore = IGNORE_TENANT.get();
        return ignore != null && ignore;
    }

    public static void clear() {
        STORE_ID.remove();
        IGNORE_TENANT.remove();
    }
}
