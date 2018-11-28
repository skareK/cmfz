package com.baizhi.cmfz.entity;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class Menu {
    private int menuId;
    private String menuTitle;
    private String menuIconCls;
    private int parentId;
    private String menuUrl;
    private List<Menu> menus;
}
