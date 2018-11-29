package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Album;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlbumDao {

    public int getTotal();

    public List<Album> queryAll(@Param("start") int start, @Param("rows") int rows);

    public void insert(Album album);

    public void delete(int albumId);

}
