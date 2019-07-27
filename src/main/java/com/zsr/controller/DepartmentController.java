package com.zsr.controller;

import com.zsr.bean.Department;
import com.zsr.bean.Message;
import com.zsr.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    IDepartmentService departmentService;

    @RequestMapping("/departments")
    @ResponseBody
    public Message allDepartment(){
        List<Department> allDepartment = departmentService.getAllDepartment();
        return Message.success().addInfo("departments",allDepartment);
    }
}
