package com.baizhi.cmfz.service;

import com.baizhi.cmfz.entity.Banner;

import java.util.Map;

public interface BannerService {

    public void updateBanner(Banner banner);

    public Map queryAll(int page, int rows);

    public void addBanner(Banner banner);

    public void deleteBanner(int id);
}
