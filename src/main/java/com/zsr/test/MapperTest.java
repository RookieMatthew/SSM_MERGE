package com.zsr.test;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.zsr.bean.Department;
import com.zsr.bean.DepartmentExample;
import com.zsr.bean.Employee;
import com.zsr.bean.EmployeeExample;
import com.zsr.dao.DepartmentMapper;
import com.zsr.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/*
* 测试dao层
* 推荐使用spring的单元测试
*   导入springtest包
*   @ContextConfiguration指定spring配置文件位置
*   直接autowired要用的组件即可
* */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    /*
    * 测试departmentMapper
    * */
    @Test
    public void testCURD() {
        /*批量插入员工，使用可以执行批量操作的sqlsession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++) {
            String substring = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,substring,new Date(),
                    i%2==0?"1":"0",substring+"@163.com",i%5+1));
        }*/
        EmployeeExample example = new EmployeeExample();
        example.setOrderByClause("e.id");
        List<Employee> employees = employeeMapper.selectByExampleWithDept(example);
        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }

    @Test
    public void test() {
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }
}
