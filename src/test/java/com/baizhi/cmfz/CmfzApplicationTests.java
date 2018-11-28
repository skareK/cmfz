package com.baizhi.cmfz;

import com.baizhi.cmfz.dao.ManagerDao;
import com.baizhi.cmfz.dao.MenuDao;
import com.baizhi.cmfz.entity.Menu;
import com.baizhi.cmfz.service.ManagerService;
import com.baizhi.cmfz.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CmfzApplicationTests {

    @Autowired
    private ManagerDao managerDao;
    @Autowired
    private ManagerService managerService;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private MenuService menuService;

    @Test
    public void contextLoads() {
    }

    @Test
    public void manTest() {
        System.out.println(managerService.login("a123", "a123456"));
    }

    @Test
    public void menTest() {
        List<Menu> menuList = menuService.queryAll();
        for (Menu m : menuList) {
            System.out.println(m);
        }
    }
}
