package com.zsr.service.imp;

import com.zsr.bean.Employee;
import com.zsr.bean.EmployeeExample;
import com.zsr.dao.EmployeeMapper;
import com.zsr.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImp implements IEmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAllEmployees() {
        EmployeeExample example = new EmployeeExample();
        example.setOrderByClause("e.id");
        return employeeMapper.selectByExampleWithDept(example);
    }

    @Override
    public void insertEmployee(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean employeeCheck(String empName) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andLastNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }

    @Override
    public Employee getEmp(Integer id) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andIdEqualTo(id);
        return employeeMapper.selectByExample(example).get(0);
    }

    @Override
    public void updateEmployee(Employee employee) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andIdEqualTo(employee.getId());
        employeeMapper.updateByExampleSelective(employee,example);
    }

    @Override
    public void deleteEmployee(Integer id) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andIdEqualTo(id);
        employeeMapper.deleteByExample(example);
    }

    @Override
    public void deleteEmployees(String[] ids) {
        ArrayList<Integer> idList = new ArrayList<>();
        for (String id : ids) {
            idList.add(Integer.parseInt(id));
        }
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andIdIn(idList);
        employeeMapper.deleteByExample(example);
    }

}
