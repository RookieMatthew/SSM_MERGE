package com.zsr.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsr.bean.Employee;
import com.zsr.bean.Message;
import com.zsr.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    IEmployeeService employeeService;


    /*@RequestMapping("/employees")
    public String allEmployees(@RequestParam(value="pn",defaultValue="8")Integer pn, Model model){
        PageHelper.startPage(pn,10);
        List<Employee> employees = employeeService.getAllEmployees();
        PageInfo page = new PageInfo(employees,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }*/

    //返回json格式的信息,查询所有员工
    @RequestMapping("/employees")
    @ResponseBody
    public Message allEmployeesWithJson(@RequestParam(value="pn",defaultValue="8")Integer pn){
        PageHelper.startPage(pn,10);
        List<Employee> employees = employeeService.getAllEmployees();
        PageInfo page = new PageInfo(employees,5);
        return Message.success().addInfo("pageInfo",page);
    }

    //添加员工信息
    @RequestMapping(value = "/employee",method = RequestMethod.POST)
    @ResponseBody
    public Message insertEmployee(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Map<String,Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                System.out.println("错误字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Message.fail().addInfo("fieldErrors",map);
        }else{
            employeeService.insertEmployee(employee);
            return Message.success();
        }
    }

    //员工姓名重复检查
    @RequestMapping(value = "/checkEmployee",method = RequestMethod.POST)
    @ResponseBody
    public Message checkEmployee(String lastName){
        boolean matches = lastName.matches("(^[a-zA-Z0-9_-]{3,16}|(^[\\u2E80-\\u9FFF]{2,5})$)");
        if (!matches){
            return  Message.fail().addInfo("tip","姓名可以是3-16位英文或2-5位中文字符！");
        }
        boolean check = employeeService.employeeCheck(lastName);
        if (check){
            return Message.success().addInfo("tip","用户名可用！");
        }else {
            return  Message.fail().addInfo("tip","用户名已存在！");
        }
    }

    //得到某个员工信息，用于修改的数据回显
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Message.success().addInfo("employee",employee);
    }

    //更新员工信息
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Message updateEmployee(Employee employee){
        employeeService.updateEmployee(employee);
        return Message.success();
    }

    //删除员工信息
    @RequestMapping(value = "/employee/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Message deleteEmployee(@PathVariable("ids") String ids){
        if (!ids.contains("-")){
            employeeService.deleteEmployee(Integer.parseInt(ids));
            return Message.success();
        }else {
            String[] idsString = ids.split("-");
            employeeService.deleteEmployees(idsString);
            return Message.success();
        }

    }
}
