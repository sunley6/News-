package com.web.mapper;

import com.web.pojo.Category;
import com.web.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    boolean addNews(News news);

    List<News> newsSelect();

    News findById(int newsId);

    boolean delnews(int newsId);

    boolean editnews(News news);

    List<News> findByType(@Param("newsType") String newsType);

    List<News> mohufind(@Param("searchname") String searchname);

    List<News> selectByrand();

    List<News> selectByType(@Param("newsType") String newsType);

    boolean editType(@Param("name") String name,@Param("firstname") String firstname);


}
