package com.baizhi.cmfz.entity;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class Manager {
    private int id;
    private String managerName;
    private String managerPassword;
}
