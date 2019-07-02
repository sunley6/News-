package com.web.service.impl;

import com.web.mapper.NewsMapper;
import com.web.pojo.News;
import com.web.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public boolean addNews(News news) {
        return newsMapper.addNews(news);
    }

    @Override
    public List<News> newsSelect() {
        return newsMapper.newsSelect();
    }

    @Override
    public News findById(int newsId) {
        return newsMapper.findById(newsId);
    }

    @Override
    public boolean delnews(int newsId) {
        return newsMapper.delnews(newsId);
    }

    @Override
    public boolean editnews(News news) {
        return newsMapper.editnews(news);
    }

    @Override
    public List<News> findByType(String newsType) {
        return newsMapper.findByType(newsType);
    }

    @Override
    public List<News> mohufind(String searchname) {
        return newsMapper.mohufind(searchname);
    }

    @Override
    public List<News> selectByrand() {
        return newsMapper.selectByrand();

    }

    @Override
    public List<News> selectByType(String newsType) {
        return newsMapper.selectByType(newsType);
    }

    @Override
    public boolean editType(String name, String firstname) {
        return newsMapper.editType(name,firstname);
    }
}
