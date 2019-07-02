package com.web.service.impl;

import com.web.mapper.CategoryMapper;
import com.web.pojo.Category;
import com.web.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategorySerivceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    public boolean addCategory(Category category) {
        return categoryMapper.addCategory(category);
    }

    @Override
    public List<Category> categorySelect() {
        return categoryMapper.categorySelect();
    }

    @Override
    public boolean delCategory(int CategoryId) {
        return categoryMapper.delCategory(CategoryId);
    }

    @Override
    public Category findById(int CategoryId) {
        return categoryMapper.findById(CategoryId);
    }

    @Override
    public boolean edit(Category category) {
        return categoryMapper.edit(category);
    }

    @Override
    public List<Category> findByName(String name) {
        return categoryMapper.findByName(name);
    }
}
