package com.baizhi.cmfz;

import com.baizhi.cmfz.dao.AlbumDao;
import com.baizhi.cmfz.dao.BannerDao;
import com.baizhi.cmfz.dao.ManagerDao;
import com.baizhi.cmfz.dao.MenuDao;
import com.baizhi.cmfz.entity.Album;
import com.baizhi.cmfz.entity.Banner;
import com.baizhi.cmfz.entity.Menu;
import com.baizhi.cmfz.service.AlbumService;
import com.baizhi.cmfz.service.BannerService;
import com.baizhi.cmfz.service.ManagerService;
import com.baizhi.cmfz.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private BannerDao bannerDao;
    @Autowired
    private BannerService bannerService;

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

    @Test
    public void testBanner() {
        //       int total = bannerDao.getTotal();
        //       List<Banner> bannerList = bannerDao.queryAll(0, 4);
//        System.out.println(total);
        /*for (Banner banner : bannerList) {
            System.out.println("banner = " + banner);
        }*/

        Banner banner = new Banner();
        banner.setTitle("feyw");
        banner.setStatus("展示");
        banner.setImgPath("/img/citong.jpg");
        banner.setDesc("dfewfwe");
        banner.setDate(new Date());
        bannerDao.insert(banner);
    }

    @Test
    public void testBannerService() {
        Map map = bannerService.queryAll(1, 4);
        List<Banner> bannerList = (List<Banner>) map.get("rows");
        for (Banner banner : bannerList) {
            System.out.println("banner = " + banner);
        }
    }

    @Autowired
    private AlbumDao albumDao;
    @Autowired
    private AlbumService albumService;

    @Test
    public void testAlbun() {
        /*List<Album> albumList = albumDao.queryAll();
        for (Album album : albumList) {
            System.out.println("album = " + album);
        }*/
        Map map = albumService.queryAll();
        List<Album> list = (List<Album>) map.get("albumList");
        for (Album album : list) {
            System.out.println("album = " + album);
        }
    }
}
