package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Manager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerDao {

    public Manager getManager(@Param("managerName") String managerName, @Param("managerPassword") String managerPassword);
}
