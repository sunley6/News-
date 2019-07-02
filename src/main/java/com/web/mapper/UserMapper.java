package com.web.mapper;

import com.web.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    boolean addUser(User user);

    List<User> userselect();

    boolean deluser(int Uid);

    User findById(int Uid);

    boolean editUser(User user);

    User checklogin(@Param("Uname") String Uname,@Param("Upassword") String Upassword);

    boolean editUserById(@Param("Uid") int Uid);

    List<User> checkByname(@Param("Uname") String Uname);

}
