package com.baizhi.cmfz.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Data
public class Chapter {
    private String id;
    private String title;
    private String chapterSize;
    private String chapterDuration;//时长
    private String chapterDownPath;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") //String转化日期
    @JSONField(format = "yyyy-MM-dd hh:mm:ss") //日期妆花String
    private Date chapterUploadDate;
    private int albumId;
}
