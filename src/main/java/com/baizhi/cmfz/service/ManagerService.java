package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.Manager;

public interface ManagerService {
    public Manager login(String managerName, String managerPassword);
}
