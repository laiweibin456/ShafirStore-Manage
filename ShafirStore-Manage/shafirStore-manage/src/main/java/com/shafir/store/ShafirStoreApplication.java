package com.shafir.store;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.shafir.store.repository")
public class ShafirStoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShafirStoreApplication.class, args);
        System.out.println("╔═══════════════════════════════════════════════════════════════╗");
        System.out.println("║                                                               ║");
        System.out.println("║     莎菲尔菓子门店管理系统启动成功！                                ║");
        System.out.println("║     Shafir Store Management System Started Successfully!      ║");
        System.out.println("║                                                               ║");
        System.out.println("║     访问地址: http://localhost:8080                             ║");
        System.out.println("║     API文档: http://localhost:8080/swagger-ui.html             ║");
        System.out.println("║                                                               ║");
        System.out.println("╚═══════════════════════════════════════════════════════════════╝");
    }
}
