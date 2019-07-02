package com.web.controller;

import com.web.pojo.News;
import com.web.pojo.User;
import com.web.service.NewsService;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private NewsService newsService;

    @RequestMapping("/adduser")
    public String m1(User user){
        userService.addUser(user);
        System.out.println(user.getUname()+"111111111");
        return "redirect:/user/listuser";
    }

    @RequestMapping("/listuser")
    public String listuser(Model model){
        List<User> list=userService.userselect();
        model.addAttribute("list",list);
        System.out.println(list.toArray());
        return "userList";
    }

    @RequestMapping("/deluser")
        public void deluser(HttpServletRequest request){
        String id=request.getParameter("Uid");
        boolean i= userService.deluser(Integer.parseInt(id));


    }

    @RequestMapping("/editUserInfo")
    public String editUserInfo(HttpServletRequest  request, Model model, HttpSession session) throws ServletException, IOException {

        System.out.println(request.getParameter("Uid"));
        String Uid=request.getParameter("Uid");
        User user=userService.findById(Integer.parseInt(Uid));
        session.setAttribute("user",user);
   //     System.out.println(user.getUname()+user.getUpassword()+"   "+user.getUid());
        model.addAttribute("user",user);

        return "editUser";

    }


    @RequestMapping("/editUser")
    public String editUser(User user,HttpSession session,HttpServletRequest request){
        boolean b=userService.editUser(user);


        System.out.println(user.getUid()+user.getUpassword()+user.getUname()+user.getSex()+"   "+b);
        System.out.println("edit..........");
        return "redirect:/user/listuser";
    }

    @RequestMapping("/m3")
    public void m3(User user,HttpServletRequest request){
        System.out.println(user.getUid());
        System.out.println("edit.........."+request.getParameter("id"));
       // return "redirect:/user/listuser";
    }

    @RequestMapping("/login")
    public String login(){
        return "user/login";
    }

    @RequestMapping("/signup")
    public String signup(User user,HttpServletRequest request){
       return "/user/signup";
    }

    @RequestMapping("/register")
    public String regiser(User user){
        userService.addUser(user);
        System.out.println(user.getUname()+"111111111");
        return "redirect:/user/login";
    }

    @RequestMapping("/checklogin")
    public String checklogin(Model model, HttpSession session, HttpServletRequest request){
        List<News> newsList=newsService.newsSelect();
        System.out.println(newsList+"登录新闻列表查询");
        model.addAttribute("newsList",newsList);
        session.setAttribute("newsList",newsList);

        String Uname=request.getParameter("Uname");
        String Upassword=request.getParameter("Upassword");
        User user=userService.checklogin(Uname,Upassword);
        System.out.println("登录模块");
        if(user!=null){
            model.addAttribute("user",user);
            session.setAttribute("user",user);
            System.out.println(session.getAttribute("user"));
            return "redirect:/news/newsindex";
        }else {if(Uname!="")
                  model.addAttribute("msg","账户密码错误");
            return "/user/login";
        }

    }

    @RequestMapping("/loginout/{Uid}")
    public String loginout(Model model,@PathVariable("Uid") int Uid ,HttpServletRequest request){
        User user=userService.findById(Uid);
        HttpSession session=request.getSession();
        System.out.println(session.getAttribute("user"));
        System.out.println("退出模块");
        session.removeAttribute("user");

        return "redirect:/news/newsindex";
    }

    @RequestMapping("/usernews/{uid}")
    public String usernews(Model model,@PathVariable("uid") int uid){
        User user=userService.findById(uid);
        model.addAttribute("usernews",user);
        return "/user/usernews";
    }
    @RequestMapping("/editUserNews/{uid}")
    public String editUserNews(Model model,@PathVariable("uid") int uid){

        User user=userService.findById(uid);
        model.addAttribute("usernews",user);
        return "/user/useredit";
    }

    @RequestMapping("/Useredit/{uid}")
    public String Useredit(User user,@PathVariable("uid") int uid,Model model){

        boolean b=userService.editUser(user);


        System.out.println(user.getUid()+user.getUpassword()+user.getUname()+user.getSex()+"   "+b);
        System.out.println("edit..........");
        User user1=userService.findById(uid);
        model.addAttribute("usernews",user);
        return "/user/usernews";
    }

    @ResponseBody
    @RequestMapping(value = "isEdit")
    public String ischeck(HttpServletRequest request){
        String Uname=request.getParameter("Uname");
        System.out.println(Uname+"hushfuhf");
       List<User> list=userService.checkByname(Uname);
        System.out.println(list.size()+"333");
        if (list.size()>0){
            return "ok";
        }
        else {
            return "no";
        }

    }

}
