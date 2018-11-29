package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Banner;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BannerDao {

    public void insert(Banner banner);

    public void delete(int id);

    public void update(Banner banner);

    public int getTotal();

    public List<Banner> queryAll(@Param("start") int start, @Param("rows") int rows);

}
