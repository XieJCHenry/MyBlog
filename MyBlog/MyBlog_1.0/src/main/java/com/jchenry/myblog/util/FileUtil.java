package com.jchenry.myblog.util;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * FileUtil
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 10:58
 * @Version 1.0
 **/
public class FileUtil {


    /**
     * 保存图片到本地
     *
     * @param attach
     * @param rootPath
     * @param fileName
     * @return
     */
    public static boolean save(MultipartFile attach, String rootPath,
                               String fileName) {
        File targetFile = new File(rootPath, fileName);
        return save(attach, targetFile);
    }

    public static boolean save(MultipartFile attach, File targetFile) {
        boolean success = false;
        try {
            success = save(attach.getInputStream(), targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return success;
    }

    public static boolean save(InputStream inputStream, File targetFile) {
        if (!targetFile.exists()) {
            targetFile.getParentFile().mkdirs();
        }
        try {
            FileUtils.copyInputStreamToFile(inputStream, targetFile);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
