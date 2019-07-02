package com.web.service.impl;


import com.web.mapper.UserMapper;
import com.web.pojo.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public List<User> userselect() {
        return userMapper.userselect();
    }

    @Override
    public boolean deluser(int Uid) {
        return userMapper.deluser(Uid);
    }

    @Override
    public User findById(int Uid) {
        return userMapper.findById(Uid);
    }

    @Override
    public boolean editUser(User user) {
        return userMapper.editUser(user);
    }

    @Override
    public User checklogin(String Uname, String Upassword) {
        return userMapper.checklogin(Uname,Upassword);
    }

    @Override
    public boolean editUserById(int uid) {
        return userMapper.editUserById(uid);
    }

    @Override
    public List<User> checkByname(String Uname) {
        return userMapper.checkByname(Uname);
    }
}
