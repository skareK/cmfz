package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {

    public List<Menu> queryAll();
}
