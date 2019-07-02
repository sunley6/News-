package com.web.service.impl;

import com.web.mapper.ManagerMapper;
import com.web.pojo.Manager;
import com.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public Manager checklogin(Manager manager) {
        return managerMapper.checklogin(manager);
    }

    @Override
    public Manager select() {
        return managerMapper.select();
    }

    @Override
    public boolean manageredit(Manager manager) {
        return managerMapper.manageredit(manager);
    }
}
