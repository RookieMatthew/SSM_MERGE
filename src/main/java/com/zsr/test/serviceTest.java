package com.zsr.test;

import com.zsr.bean.Employee;
import com.zsr.bean.EmployeeExample;
import com.zsr.dao.DepartmentMapper;
import com.zsr.dao.EmployeeMapper;
import com.zsr.service.IEmployeeService;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class serviceTest {
    
    @Autowired
    IEmployeeService employeeService;
    
    @Test
    public void getEmp(){
        Employee emp = employeeService.getEmp(1);
        System.out.println(emp);
    }
    @Test
    public void insertEmployee() throws ParseException {
        Employee employee;
        employee = new Employee();
        employee.setId(1);
        employee.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse("1998-03-28"));
        employee.setdId(5);
        employee.setEmail("1134404457@666.com");
        employee.setGender("1");
        System.out.println(employee);
        employeeService.updateEmployee(employee);
    }
}
