package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Banner;
import com.baizhi.cmfz.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("/queryAll")
    public Map queryAll(int page, int rows) {
        return bannerService.queryAll(page, rows);
    }

    @RequestMapping("/addBanner")
    public boolean addBanner(Banner banner, MultipartFile uploadFile, HttpServletRequest request) {

        if (!"".equals(uploadFile.getOriginalFilename())) {
            //处理文件上传的内容
            String realPath = request.getSession().getServletContext().getRealPath("/img");
            String newFileName = new Date().getTime() + "_" + uploadFile.getOriginalFilename();

            banner.setImgPath(realPath + "/" + newFileName);
            //写入数据库
            try {
                bannerService.addBanner(banner);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            //文件上传
            File pfile = new File(realPath + "/" + newFileName);
            try {
                uploadFile.transferTo(pfile);
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

    @RequestMapping("/deleteBanner")
    public boolean deleteBanner(int id) {
        try {
            bannerService.deleteBanner(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/updateBanner")
    public boolean updateBanner(Banner banner) {
        try {
            bannerService.updateBanner(banner);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
