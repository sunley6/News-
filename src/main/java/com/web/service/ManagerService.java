package com.web.service;

import com.web.pojo.Manager;

public interface ManagerService {

    Manager checklogin(Manager manager);

    Manager select();

    boolean manageredit(Manager manager);
}
