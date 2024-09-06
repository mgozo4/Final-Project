package com.bitc.jeogi.common.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import java.util.logging.Logger;

public class FileUtil {

	private static final String UPLOAD_DIR = "uploads/";
    private static final Logger LOGGER = Logger.getLogger(FileUtil.class.getName());

    static {
        File directory = new File(UPLOAD_DIR);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }

    public static String saveImage(MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
        Path path = Paths.get(UPLOAD_DIR + uniqueFilename);

        try {
            Files.copy(file.getInputStream(), path);
        } catch (IOException e) {
            LOGGER.severe("파일 저장 실패: " + e.getMessage());
            throw new IOException("파일 저장에 실패했습니다. 다시 시도해 주세요.");
        }

        return uniqueFilename;
    }
}