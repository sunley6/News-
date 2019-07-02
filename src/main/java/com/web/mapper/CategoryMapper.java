package com.web.mapper;

import com.web.pojo.Category;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface CategoryMapper {
    boolean addCategory(Category category);

    List<Category> categorySelect();

    boolean delCategory(int CategoryId);

    Category findById(int CategoryId);

    boolean edit(Category category);

    List<Category> findByName(@Param("name") String name);


}
