package com.baizhi.cmfz.dao;

import com.baizhi.cmfz.entity.Chapter;
import org.springframework.stereotype.Repository;

@Repository
public interface ChapterDao {

    public void insert(Chapter chapter);

}
