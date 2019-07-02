package com.web.service.impl;

import com.web.mapper.CommentMapper;
import com.web.pojo.Comment;
import com.web.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public boolean addComment(Comment comment) {
        return commentMapper.addComment(comment);
    }

    @Override
    public List<Comment> selectcomment() {
        return commentMapper.selectcomment();
    }

    @Override
    public List<Comment> selectById(int newsId) {
        return commentMapper.selectById(newsId);
    }

    @Override
    public boolean delcomment(int commentId) {
        return commentMapper.delcomment(commentId);
    }
}
