package com.web.controller;

import com.web.pojo.Comment;
import com.web.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/addcomment/{newsId}")
    public String addComment(@PathVariable("newsId") int newsId, Model model, HttpSession session, Comment comment){
        System.out.println(comment.getCommentContext());
        System.out.println(newsId+"ppp");
     //   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
   //     System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        Date date=new Date();
        Timestamp t=new Timestamp(date.getTime());
        comment.setCommentTime(t);
        boolean b=commentService.addComment(comment);
        List<Comment> commentList=commentService.selectById(newsId);
        model.addAttribute("commentList",commentList);
       session.setAttribute("commentList",commentList);
       String s=String.valueOf(newsId);
       return "redirect:/news/newsdetail/"+s;

    }

    @RequestMapping("/commentlist")
    public String comment(Model model){
        List<Comment> commentList=commentService.selectcomment();
        model.addAttribute("commentList",commentList);
        return "commentlist";
    }

    @RequestMapping("/commentdel")
    public String commentdel(HttpServletRequest request){
        boolean b=commentService.delcomment(Integer.parseInt(request.getParameter("commentId")));
        System.out.println(b+"评论删除");
        return "redirect:/comment/commentlist";
    }
}
