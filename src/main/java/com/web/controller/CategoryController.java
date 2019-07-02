package com.web.controller;

import com.web.pojo.Category;
import com.web.service.CategoryService;
import com.web.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/news")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private NewsService newsService;

    @RequestMapping("/addType")
    public String addType(Category c) {
        System.out.println(c.getCategoryName());
        categoryService.addCategory(c);
        return "redirect:/news/listType";
    }

    @RequestMapping("/listType")
    public String Typelist(Model model) {
        List<Category> categoryList = categoryService.categorySelect();
        model.addAttribute("categoryList", categoryList);
        return "categoryList";
    }

    @RequestMapping("/delType")
    public void delType(HttpServletRequest request) {
        String id = request.getParameter("Cid");
        boolean b = categoryService.delCategory(Integer.parseInt(id));
        System.out.println(b);

    }

    @RequestMapping("/editTypeInfo")
    public String editType(HttpServletRequest request, Model model, HttpSession session) throws ServletException, IOException {
        String id = request.getParameter("Cid");
        Category c = categoryService.findById(Integer.parseInt(id));
        System.out.println(id+"3333333");
        model.addAttribute("category", c);
        session.setAttribute("category",c);
        session.setAttribute("categoryname",c.getCategoryName());
        boolean b = categoryService.edit(c);
        return "editType";
    }

    @RequestMapping("/editType")
    public String editType(Category category, HttpSession session,HttpServletRequest request){
//        Category category=new Category();
//        category.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
//        category.setCategoryName(request.getParameter("categoryName"));
//        category.setCategoryImgurl("null");
//        category.setCategoryUrl("null");
        System.out.println(category.getCategoryName()+"666"+(String) session.getAttribute("categoryname"));
        String name= category.getCategoryName();

        boolean b=categoryService.edit(category);
        boolean p=newsService.editType(category.getCategoryName(), (String) session.getAttribute("categoryname"));


        System.out.println("edit..........");
        return "redirect:/news/listType";
    }

}
