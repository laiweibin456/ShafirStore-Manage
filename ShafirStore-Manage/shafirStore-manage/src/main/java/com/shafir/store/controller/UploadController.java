package com.shafir.store.controller;

import com.shafir.store.common.result.Result;
import com.shafir.store.service.UploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/api/upload")
@RequiredArgsConstructor
public class UploadController {

    private final UploadService uploadService;

    @PostMapping("/image")
    public Result<Map<String, String>> uploadImage(@RequestParam("file") MultipartFile file) {
        log.info("接收图片上传请求: {}", file.getOriginalFilename());

        if (file.isEmpty()) {
            return Result.error(400, "请选择要上传的图片");
        }

        String contentType = file.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            return Result.error(400, "只能上传图片文件");
        }

        String[] allowedTypes = {"image/jpeg", "image/png", "image/gif", "image/webp", "image/jpg"};
        boolean isAllowed = false;
        for (String type : allowedTypes) {
            if (type.equals(contentType)) {
                isAllowed = true;
                break;
            }
        }
        if (!isAllowed) {
            return Result.error(400, "不支持的图片格式，请上传 JPG、PNG、GIF 或 WebP 格式");
        }

        if (file.getSize() > 10 * 1024 * 1024) {
            return Result.error(400, "图片大小不能超过 10MB");
        }

        try {
            String imageUrl = uploadService.uploadImage(file);
            log.info("图片上传成功: {}", imageUrl);
            return Result.success(Map.of("url", imageUrl));
        } catch (Exception e) {
            log.error("图片上传失败", e);
            return Result.error(500, "图片上传失败: " + e.getMessage());
        }
    }

    @DeleteMapping("/image")
    public Result<Boolean> deleteImage(@RequestParam String imageUrl) {
        log.info("删除图片: {}", imageUrl);
        try {
            boolean result = uploadService.deleteImage(imageUrl);
            return Result.success(result);
        } catch (Exception e) {
            log.error("删除图片失败", e);
            return Result.error(500, "删除图片失败");
        }
    }
}