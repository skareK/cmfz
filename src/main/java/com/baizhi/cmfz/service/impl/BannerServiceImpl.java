package com.baizhi.cmfz.service.impl;

import com.baizhi.cmfz.dao.BannerDao;
import com.baizhi.cmfz.entity.Banner;
import com.baizhi.cmfz.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    private BannerDao bannerDao;

    @Override
    public void updateBanner(Banner banner) {
        bannerDao.update(banner);
    }

    @Override
    public Map queryAll(int page, int rows) {
        int total = bannerDao.getTotal();
        int start = (page - 1) * rows;
        List<Banner> bannerList = bannerDao.queryAll(start, rows);
        Map map = new HashMap();
        map.put("total", total);
        map.put("rows", bannerList);
        return map;
    }

    @Override
    public void addBanner(Banner banner) {
        banner.setDate(new Date());
        bannerDao.insert(banner);
    }

    @Override
    public void deleteBanner(int id) {
        bannerDao.delete(id);
    }
}
