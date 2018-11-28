package com.baizhi.cmfz.entity;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class User {
    private int id;
    private String phoneNum;
    private String username;
    private String password;
    private String salt;
    private String dharmaName;
    private String province;
    private String city;
    private int sex;
    private String sign;
    private String headPic;
    private int status;
    private Date regDate;
}
