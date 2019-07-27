package com.zsr.service;

import com.zsr.bean.Employee;

import java.util.List;

public interface IEmployeeService {

    //查询所有员工信息
    List<Employee> getAllEmployees();

    //添加员工信息
    void insertEmployee(Employee employee);

    //员工信息检查，防止重名提交
    boolean employeeCheck(String empName);

    //查询某个员工
    Employee getEmp(Integer id);

    //更新员工信息
    void updateEmployee(Employee employee);

    //删除某个员工
    void deleteEmployee(Integer id);

    //批量删除员工
    void deleteEmployees(String[] ids);
}
