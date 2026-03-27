package com.shafir.store.service.impl;

import com.shafir.store.service.UploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Slf4j
@Service
public class UploadServiceImpl implements UploadService {

    @Value("${upload.path:/www/shafirstore/images/products}")
    private String uploadPath;

    @Value("${upload.base-url:http://localhost:8081/images/products}")
    private String baseUrl;

    @Override
    public String uploadImage(MultipartFile file) throws Exception {
        String originalFilename = file.getOriginalFilename();
        if (originalFilename == null || originalFilename.isEmpty()) {
            throw new IllegalArgumentException("文件名不能为空");
        }

        String extension = getFileExtension(originalFilename);
        if (extension.isEmpty()) {
            throw new IllegalArgumentException("文件没有扩展名");
        }

        String[] allowedExtensions = {"jpg", "jpeg", "png", "gif", "webp"};
        boolean isAllowed = false;
        for (String ext : allowedExtensions) {
            if (ext.equalsIgnoreCase(extension)) {
                isAllowed = true;
                break;
            }
        }
        if (!isAllowed) {
            throw new IllegalArgumentException("不支持的图片格式");
        }

        String newFilename = UUID.randomUUID().toString() + "." + extension.toLowerCase();

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            if (!created) {
                throw new IOException("无法创建上传目录");
            }
        }

        Path filePath = Paths.get(uploadPath, newFilename);
        Files.write(filePath, file.getBytes());

        String imageUrl = baseUrl + "/" + newFilename;
        log.info("图片上传成功: {}, 保存路径: {}", imageUrl, filePath);

        return imageUrl;
    }

    @Override
    public boolean deleteImage(String imageUrl) {
        if (imageUrl == null || imageUrl.isEmpty()) {
            return false;
        }

        try {
            String filename = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
            Path filePath = Paths.get(uploadPath, filename);
            File file = filePath.toFile();

            if (file.exists()) {
                boolean deleted = file.delete();
                log.info("删除图片文件: {}, 结果: {}", filePath, deleted);
                return deleted;
            } else {
                log.warn("图片文件不存在: {}", filePath);
                return false;
            }
        } catch (Exception e) {
            log.error("删除图片失败: {}", imageUrl, e);
            return false;
        }
    }

    private String getFileExtension(String filename) {
        if (filename == null || filename.isEmpty()) {
            return "";
        }
        int lastDotIndex = filename.lastIndexOf(".");
        if (lastDotIndex == -1 || lastDotIndex == filename.length() - 1) {
            return "";
        }
        return filename.substring(lastDotIndex + 1);
    }
}