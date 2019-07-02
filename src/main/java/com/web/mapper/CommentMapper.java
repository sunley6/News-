package com.web.mapper;

import com.web.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    boolean addComment(Comment comment);

    List<Comment> selectcomment();

    List<Comment> selectById(@Param("newsId") int newsId);

    boolean delcomment(int commentId);
}
