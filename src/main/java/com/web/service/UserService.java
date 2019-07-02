package com.web.service;

import com.web.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    boolean addUser(User user);

    List<User> userselect();

    boolean deluser(int Uid);

    User findById(int Uid);

    boolean editUser(User user);

    User checklogin(String Uname,String Upassword);

    boolean editUserById(@Param("uid") int uid);

   List<User> checkByname(@Param("Uname") String Uname);
}
