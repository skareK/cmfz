package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Chapter;
import com.baizhi.cmfz.service.ChapterService;
import com.baizhi.cmfz.utils.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    private ChapterService chapterService;

    @RequestMapping("/addChapter")
    public boolean addChapter(Chapter chapter, MultipartFile chapterbgm, HttpServletRequest request) {
        /*String realPath = request.getSession().getServletContext().getRealPath("/");  //webapp当前项目的路径
        File file = new File(realPath + "/upload");
        if (!file.exists()) {
            file.mkdir();
        }*/
        String realPath = request.getSession().getServletContext().getRealPath("/chapter");

        //获取音频文件后缀(,mp3)
        String extension = FilenameUtils.getExtension(chapterbgm.getOriginalFilename());
        String prename = UUID.randomUUID().toString();
        String newName = prename + "." + extension;
         /*try {
            chapter.transferTo(new File(file.getAbsolutePath(), newName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        FileUtil.getDuration(new File(file.getAbsolutePath() + "/" + newName));
        long size = chapter.getSize();
        double l = size / 1024.0 / 1024.0;
        System.out.println(l)*/
        try {
            chapterbgm.transferTo(new File(realPath, newName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        FileUtils.getDuration(new File(realPath + "/" + newName));
        long presize = chapterbgm.getSize();
        double size = presize / (1024.0 * 1024.0);

        chapterService.addChapter(chapter);

        return true;
    }
}
