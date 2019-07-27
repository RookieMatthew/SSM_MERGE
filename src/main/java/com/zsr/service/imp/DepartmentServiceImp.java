package com.zsr.service.imp;

import com.zsr.bean.Department;
import com.zsr.dao.DepartmentMapper;
import com.zsr.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class DepartmentServiceImp implements IDepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getAllDepartment() {
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }
}
