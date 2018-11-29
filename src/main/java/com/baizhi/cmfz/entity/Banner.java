package com.baizhi.cmfz.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@AllArgsConstructor(access = AccessLevel.PROTECTED)
@NoArgsConstructor
@Data
public class Banner {
    private int id;
    private String title;
    private String imgPath;
    private String desc;
    private String status;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") //String转化日期
    @JSONField(format = "yyyy-MM-dd hh:mm:ss") //日期妆花String
    private Date date;
}
