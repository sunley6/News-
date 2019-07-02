package com.web.controller;


import com.web.pojo.Manager;
import com.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/file")
public class UploadController {

    @Autowired
    private ManagerService managerService;
    @RequestMapping(value = "/uploadHead", method = RequestMethod.POST)
    @ResponseBody
    public int uploadHead(@RequestParam("file") MultipartFile file, HttpSession session) {
        Manager manager=managerService.select();
        try {
            if (file != null) {
                //获取文件名
                String fileName = file.getOriginalFilename();
                //截取扩展名
                String extName = fileName.substring(fileName.lastIndexOf("."));
                List list = new ArrayList();
                list.add(".jpg");
                list.add(".png");
                list.add(".jpeg");
                list.add(".gif");
                if(list.contains(extName.toLowerCase())){

                    //01获取服务器项目部署的路径，并在根目录下创建 myphoto 目录
                    //String realPath = session.getServletContext().getRealPath("myphoto");
                    //02也可以直接定义文件路径
                    String realPath = "H:\\模板文件\\web\\src\\main\\webapp\\upload";

                    String photoFileName = new Date().getTime()+extName;
                    String descPath = realPath + "\\" + photoFileName;

                    System.out.println(descPath);
                    file.transferTo(new File(realPath,photoFileName));
                    return 1;//成功
                }else {
                    return -1;//文件类型不正确
                }
            }else {
                return 0;//上传文件为空
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;//上传异常
        }
    }
}
