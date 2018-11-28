package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Menu;
import com.baizhi.cmfz.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/main")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @RequestMapping("/getMenus")
    public String getMenus(Map map) {
        List<Menu> menuList = menuService.queryAll();
        map.put("menuList", menuList);
        return "main/main";
    }
}
