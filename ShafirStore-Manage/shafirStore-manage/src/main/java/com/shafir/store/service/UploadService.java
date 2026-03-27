package com.shafir.store.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

    String uploadImage(MultipartFile file) throws Exception;

    boolean deleteImage(String imageUrl) throws Exception;
}