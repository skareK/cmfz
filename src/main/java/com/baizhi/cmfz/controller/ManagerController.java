package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Manager;
import com.baizhi.cmfz.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @RequestMapping("/login")
    public String login(String managerName, String managerPassword, String enCode, HttpSession session) {
        Manager manager = managerService.login(managerName, managerPassword);
        String code = (String) session.getAttribute("vrifyCode");
        if (manager != null && code.equals(enCode)) {
            session.setAttribute("manager", manager);
            return "redirect:/main/getMenus";
        }
        return "login";
    }
}
