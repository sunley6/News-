package com.web.controller;


import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import com.web.pojo.Manager;
import com.web.pojo.User;
import com.web.service.ManagerService;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private UserService userService;

    @RequestMapping("/managerLogin")
    public String managerLogin(){
        return "login";
    }

    @RequestMapping("/checklogin")
    public String checklogin(Manager manager, Model model,HttpSession session){

        Manager m=managerService.checklogin(manager);
        System.out.println("111");
        if (m!=null){
            model.addAttribute("m",m);
            session.removeAttribute("msg");
            session.setAttribute("m",m);
            return "main";
        }
        else{
            model.addAttribute("msg","账户密码错误");//hahah
            return "login";
        }
    }

    @RequestMapping("/managerout")
    public String managerout( Model model,HttpSession session) {
        Object obj=session.getAttribute("m");
        if (obj!=null) {
            session.removeAttribute("m");
            return "login";
        }
        else
            return "";

    }
    @RequestMapping("/managernews")
    public String managernews( Model model,HttpSession session) {
       Manager manager=managerService.select();
       model.addAttribute("manager",manager);
       return "editManager";

    }

    @RequestMapping("/manageredit")
    public String manageredit( Manager manager,Model model,HttpSession session) {
        boolean b=managerService.manageredit(manager);
        System.out.println(b);
        model.addAttribute("manager",manager);
        return "editManager";

    }











}
