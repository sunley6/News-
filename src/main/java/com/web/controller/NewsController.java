package com.web.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.web.pojo.Category;
import com.web.pojo.Comment;
import com.web.pojo.News;
import com.web.service.CategoryService;
import com.web.service.CommentService;
import com.web.service.NewsService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/newsType")
    public String newsType(News news,Model model,HttpSession session){
        List<Category> listType=categoryService.categorySelect();
        model.addAttribute("listType",listType);
        session.setAttribute("listType",listType);
        return "addnews";
    }

    @RequestMapping("/addnews")
    public String addnews(News news,Model model,HttpSession session){

        String content=news.getNewsContent();
        System.out.println(content);
        String img="null";//获取第一张新闻图片img地址
        if(content.indexOf("<img src=\"/upload/")!=-1) {
            img = content.substring(content.indexOf("<img src=\"/upload/"), content.indexOf("<img src=\"/upload/") + 76);
        }


        System.out.println(img+"2222");

        news.setImgurl(img);


       boolean b=newsService.addNews(news);




        return "redirect:/news/newsList";
    }

    @RequestMapping("/newsList")
    public String newsList(Model model){
        List<News> newsList=newsService.newsSelect();
        System.out.println(newsList+"新闻列表");
        model.addAttribute("newsList",newsList);
        return "newsList";
    }

    @RequestMapping("/delnews")
    public String findById(Model model,HttpServletRequest request){

        boolean b=newsService.delnews(Integer.parseInt(request.getParameter("newsId")));
        System.out.println(b+"新闻删除模块");

        return "redirect:/news/newsList";
    }

    @RequestMapping("/newsListall")
    public String newsListall(Model model){
        List<News> newsList=newsService.newsSelect();
        System.out.println(newsList+"1122");
        model.addAttribute("newsList",newsList);
        return "/user/news";
    }

    @RequestMapping("/editNewsInfo")
    public String editUserInfo(HttpServletRequest  request, Model model, HttpSession session) throws ServletException, IOException{
       News news=newsService.findById(Integer.parseInt(request.getParameter("newsId")));
        System.out.println(request.getParameter("newsId")+"ById change");
        session.setAttribute("news",news);
        //     System.out.println(user.getUname()+user.getUpassword()+"   "+user.getUid());
        model.addAttribute("news",news);
        session.setAttribute("news",news);
        List<Category> listType=categoryService.categorySelect();
        model.addAttribute("listType",listType);
        session.setAttribute("listType",listType);

        return "editnews";
    }

    @RequestMapping("/editnews")
    public String editUser(News news,HttpServletRequest  request, Model model, HttpSession session){
        news.setImgurl("null");

        String content=news.getNewsContent();
        String img=content.substring(content.indexOf("<img src=\"/upload/"),content.indexOf("<img src=\"/upload/")+76);


        System.out.println(img+"2222");

        news.setImgurl(img);


        boolean b=newsService.editnews(news);

        System.out.println("edit..........NEWS"+b);
        return "redirect:/news/newsList";
    }


    @RequestMapping("/newsdetail/{newsId}")
    public String newsdetail(Model model, @PathVariable("newsId") int newsId,HttpSession session){
        News news=newsService.findById(newsId);


        List<News> newsRand=newsService.selectByrand();//最新推荐新闻查询
        model.addAttribute("newsRand",newsRand);
        session.setAttribute("newsRand",newsRand);

        List<News> newsType=newsService.selectByType(news.getNewsType());//根据类型查询
        model.addAttribute("newsType",newsType);
        session.setAttribute("newsType",newsType);

        System.out.println(newsRand.size());
        List<Comment> commentList=commentService.selectById(newsId);
        model.addAttribute("commentList",commentList);
        session.setAttribute("commentList",commentList);
        model.addAttribute("news",news);

        return "/user/index1";
    }

    @RequestMapping("/newsindex")
    public String newsindex(Model model,HttpSession session,@RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){

        List<Category>  listCategory=categoryService.categorySelect();
        model.addAttribute("listCategory",listCategory);
        session.setAttribute("listCategory",listCategory);
        PageHelper.startPage(PageNum,2);
        List<News> newsList=newsService.newsSelect();
        System.out.println(newsList.size());

        PageInfo page=new PageInfo(newsList,3);
        model.addAttribute("pageInfo",page);
        model.addAttribute("news",newsList);


        System.out.println(newsList+"登录新闻列表查询");


        System.out.println(newsList.size());


        model.addAttribute("newsList",newsList);
        session.setAttribute("newsList",newsList);



        return "/user/news";
    }

    @RequestMapping("/type/{name}")
    public String Bytype(HttpServletRequest request,Model model,HttpSession session,@PathVariable("name") String name,@RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){
        System.out.println(name);
        List<Category>  listCategory=categoryService.categorySelect();

        model.addAttribute("listCategory",listCategory);
        session.setAttribute("listCategory",listCategory);

        List<News> newsRand=newsService.selectByrand();
        model.addAttribute("newsRand",newsRand);
        session.setAttribute("newsRand",newsRand);
        System.out.println(newsRand.size());




        if (name.equals("all")){
            PageHelper.startPage(PageNum,3);
            List<News> newsList=newsService.newsSelect();
            PageInfo page=new PageInfo(newsList,3);
            model.addAttribute("pageInfo",page);
            System.out.println(name);
            model.addAttribute("name",name);
            session.setAttribute("name",name);

            model.addAttribute("newsList",newsList);
            session.setAttribute("newsList",newsList);
            session.setAttribute("newsList",newsList);
            System.out.println("11111111");
            return "/user/news";

        }
        else {
            PageHelper.startPage(PageNum,3);
               System.out.println(name+"0000");

                List<News> newsList = newsService.findByType(name);
                PageInfo page=new PageInfo(newsList,3);
                model.addAttribute("pageInfo",page);
                System.out.println(name);
                model.addAttribute("name",name);
                session.setAttribute("name",name);

                model.addAttribute("newsList",newsList);
                session.setAttribute("newsList",newsList);
                session.setAttribute("newsList",newsList);
                System.out.println("+++++++++++++++");
                return "/user/news";



        }


    }

    @RequestMapping("/mohufind/{name}")
    public String mndc(@PathVariable("name") String name,HttpServletRequest request,Model model,HttpSession session,@RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){

        List<News> newsRand=newsService.selectByrand();
        model.addAttribute("newsRand",newsRand);
        session.setAttribute("newsRand",newsRand);

        PageHelper.startPage(PageNum,3);
        List<News> newsList=newsService.mohufind(name);
        PageInfo page=new PageInfo(newsList,3);
        model.addAttribute("pageInfo",page);
        System.out.println(name);
        model.addAttribute("name",name);
        session.setAttribute("name",name);

        model.addAttribute("newsList1",newsList);
        session.setAttribute("newsList1",newsList);

        System.out.println("11111111");



        return "/user/newssearch";
    }


}
