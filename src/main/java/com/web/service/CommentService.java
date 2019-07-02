package com.web.service;

import com.web.pojo.Comment;
import com.web.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {
    boolean addComment(Comment comment);

    List<Comment> selectcomment();

    List<Comment> selectById(@Param("newsId") int newsId);

    boolean delcomment(int commentId);
}
