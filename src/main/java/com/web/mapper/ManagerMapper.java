package com.web.mapper;

import com.web.pojo.Manager;

public interface ManagerMapper {
    Manager checklogin(Manager manager);

    Manager select();

    boolean manageredit(Manager manager);
}
