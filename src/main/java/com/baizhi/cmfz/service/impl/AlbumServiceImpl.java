package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.AlbumDao;
import com.baizhi.cmfz.entity.Album;
import com.baizhi.cmfz.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDao albumDao;

    @Override
    public Map queryAll(int page, int rows) {
        int total = albumDao.getTotal();
        int start = (page - 1) * rows;

        List<Album> albumList = albumDao.queryAll(start, rows);

        Map map = new HashMap();
        map.put("total", total);
        map.put("rows", albumList);
        return map;
    }
}
