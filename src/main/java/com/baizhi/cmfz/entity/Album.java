package com.baizhi.cmfz.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@NoArgsConstructor
public class Album {
    private int id;
    private String title;
    private String albumCoverimg;
    private int albumCount;
    private double albumScore;
    private String albumAuthor;
    private String albumBroadCast;//播音
    private String albumBrief; //摘要

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") //String转化日期
    @JSONField(format = "yyyy-MM-dd hh:mm:ss") //日期妆花String
    private Date albumPublishDate;
    private List<Chapter> children;
}
