package com.shafir.store.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.shafir.store.common.result.Result;
import com.shafir.store.common.result.ResultCode;
import com.shafir.store.entity.Product;
import com.shafir.store.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @GetMapping
    public Result<IPage<Product>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Integer status) {
        log.info("分页查询商品: pageNum={}, pageSize={}, name={}, categoryId={}, status={}",
                pageNum, pageSize, name, categoryId, status);
        IPage<Product> page = productService.selectPage(pageNum, pageSize, name, categoryId, status);
        return Result.success(page);
    }

    @GetMapping("/{id}")
    public Result<Product> getById(@PathVariable Long id) {
        log.info("查询商品详情: id={}", id);
        Product product = productService.getById(id);
        if (product == null) {
            return Result.error(ResultCode.NOT_FOUND);
        }
        return Result.success(product);
    }

    @PostMapping
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> add(@RequestBody Product product) {
        log.info("新增商品: {}", product.getName());
        boolean result = productService.addProduct(product);
        return Result.success(result);
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> update(@PathVariable Long id, @RequestBody Product product) {
        log.info("更新商品: id={}", id);
        product.setId(id);
        boolean result = productService.updateProduct(product);
        return Result.success(result);
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> delete(@PathVariable Long id) {
        log.info("删除商品: id={}", id);
        boolean result = productService.deleteProduct(id);
        return Result.success(result);
    }

    @PutMapping("/{id}/status")
    @PreAuthorize("hasRole('ROLE_SUPER_ADMIN')")
    public Result<Boolean> updateStatus(@PathVariable Long id, @RequestParam Integer status) {
        log.info("更新商品状态: id={}, status={}", id, status);
        boolean result = productService.updateStatus(id, status);
        return Result.success(result);
    }
}
