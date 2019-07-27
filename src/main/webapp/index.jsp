<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>列表页面</title>
    <%
        pageContext.setAttribute("app_path",request.getContextPath());
    %>
    <%--引入jquery--%>
    <script type="text/javascript" src="${app_path}/static/js/jquery.min.js"></script>
    <%--引入样式--%>
    <link rel="stylesheet" href="${app_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="${app_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--员工修改的模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="emp_update_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="emp_update_lastName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="emp_update_lastName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_update_birthday" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="date" name="birthday" class="form-control" id="emp_update_birthday" placeholder="生日">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_update_gender1" value="1" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="emp_update_gender0" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="emp_update_email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="emp_update_email" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-5">
                            <select name="dId" class="form-control">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <%--员工添加的模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="emp_add_modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="emp_add_lastName" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="lastName" class="form-control" id="emp_add_lastName" placeholder="姓名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="emp_add_birthday" class="col-sm-2 control-label">生日</label>
                            <div class="col-sm-10">
                                <input type="date" name="birthday" class="form-control" id="emp_add_birthday" placeholder="生日">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="emp_add_gender1" value="1" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="emp_add_gender0" value="0"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="emp_add_email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="emp_add_email" placeholder="邮箱">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-5">
                                <select name="dId" class="form-control">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_insert_btn">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>员工信息列表</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-lg-offset-9">
                <button class="btn btn-primary " id="emp_add_btn">新增</button>
                <button class="btn btn-warning " id="emp_delete_btn">删除</button>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                    <th><input type="checkbox" id="check_all"/></th>
                    <th>工号</th>
                    <th>姓名</th>
                    <th>生日</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="row" id="page_info_area">
        </div>
        <div class="row" id="page_nav_area">

        </div>
    </div>
<script type="text/javascript">
    <%--记录总条数--%>
    var total;
    //当前页面编号
    var pageNum;

    //为复选框添加全选全不选事件
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //全部选中时最上边的也应该被选中
    $(document).on("click",".check_item",function () {
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });
    //发送请求批量删除
    $(document).on("click","#emp_delete_btn",function () {
        var empName="";
        var del_ids="";
       $.each($(".check_item:checked"),function () {
           empName+=$(this).parents("tr").find("td:eq(2)").text()+",";
           del_ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
       });
        empName = empName.substring(0,empName.length-1);
        del_ids = del_ids.substring(0,del_ids.length-1);
        alert(del_ids);
       if(confirm("确认删除【"+empName+"】吗?")){
           //发送批量删除请求
           $.ajax({
               url:"${app_path}/employee/"+del_ids,
               type:"delete",
               success:function (result) {
                   alert(result.message);
                   to_page(pageNum);
               }
           });
       }
    });


    //为删除按钮添加单击事件，当被点击时发送删除的请求
    $(document).on("click",".delete_btn",function () {
       //删除员工的姓名
       var lastName = $(this).parents("tr").find("td:eq(2)").text();
       var id = $(this).attr("delete-id");
       if (confirm("确认删除员工【"+lastName+"】吗？")){
            $.ajax({
                url:"${app_path}/employee/"+id,
                type:"delete",
                success:function (result) {
                    alert(result.message);
                    to_page(pageNum);
                }
            });
       }
    });

    //为修改提交按钮添加单击事件，信息无误后进行添加请求
    $("#emp_update_btn").click(function () {
        var id = $(this).attr("update-id");
        //email校验
        var email = $("#emp_update_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validata_msg("#emp_update_email","error","请输入正确格式的邮箱地址！");
            return false;
        }else {
            show_validata_msg("#emp_update_email","success","");
            updateEmployee(id);
        }
    });
    //修改员工信息请求
    function updateEmployee(id){
        $.ajax({
            url:"${app_path}/employee/"+id,
            type:"put",
            data:$("#emp_update_modal form").serialize(),
            success:function (result) {
                //成功的话关闭模态框
                if (result.code==100){
                    $('#emp_update_modal').modal('hide');
                    to_page(pageNum);
                }
            }
        });
    }

    //点击修改按钮弹出员工修改的模态框
    $(document).on("click",".update_btn",function () {
        //重置表单，清除表单原有信息
        formReset("#emp_update_modal form");
        //到员工添加框前加入部门信息
        getDepartments("#emp_update_modal select");
        //得到按钮上存储的当前要修改的员工id
        var id = $(this).attr("update-id");
        //得到员工数据，并回显
        getEmp(id);
        //为提交按钮添加属性用于修改完成后的提交
        $("#emp_update_btn").attr("update-id",id);
        //打开员工添加框
        $('#emp_update_modal').modal({
            backdrop:true
        });
    });
    //发送请求得到员工信息
    function getEmp(id){
        $.ajax({
            url:"${app_path}/employee/"+id,
            type:"get",
            success:function (result) {
                var employee = result.info.employee;
                $("#emp_update_lastName").text(employee.lastName);
                $("#emp_update_birthday").val(new Date(employee.birthday).format("yyyy-MM-dd"));
                $("#emp_update_email").val(employee.email);
                $("#emp_update_modal input[type=radio]").val([employee.gender]);
                $("#emp_update_modal select").val([employee.dId]);
            }
        });
    }

    //输入框文本失去焦点发送请求进行验证
    $("#emp_add_lastName").blur(function () {
        checkEmployee();
    });
    //姓名重复的验证
    function checkEmployee() {
        var lastName = $("#emp_add_lastName").val();
        $.ajax({
            url:"${app_path}/checkEmployee",
            type:"post",
            data:"lastName="+lastName,
            success:function (result) {
                if (result.code==100){
                    show_validata_msg("#emp_add_lastName","success",result.info.tip)
                    //给按钮添加属性，用于标记是是否可以提交
                    $("#emp_insert_btn").attr("ajax-validata","success");
                } else {
                    show_validata_msg("#emp_add_lastName","error",result.info.tip)
                    $("#emp_insert_btn").attr("ajax-validata","error");
                }
            }
        });
    }
    //表单验证后的提示信息
    function show_validata_msg(element,status,msg) {
        $(element).parent().removeClass("has-success has-error");
        $(element).next("span").text(msg);
        if ("success"==status){
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        }else if ("error"==status){
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }
    //表单数据验证
    function validate_add_form(){
        var lastName = $("#emp_add_lastName").val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}|(^[\u2E80-\u9FFF]{2,5})$)/;
        if(!regName.test(lastName)){
            show_validata_msg("#emp_add_lastName","error","姓名可以为3-16位英文或2-5位中文字符！");
            return false;
        }else {
            show_validata_msg("#emp_add_lastName","success","");
        }
        var email = $("#emp_add_email").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("请输入正确格式的邮箱地址！");
            show_validata_msg("#emp_add_email","error","请输入正确格式的邮箱地址！");
            return false;
        }else {
            show_validata_msg("#emp_add_email","success","");
        }
        //同时要验证姓名重复问题
        checkEmployee();
        return true;
    }
    <%--点击员工添加框的提交按钮，发送员工信息添加的请求--%>
    $("#emp_insert_btn").click(function () {
        //表单数据验证,
        if (!validate_add_form()){
          return false;
        }
        //判断按钮的验证属性，若为error则无法提交
        if ($(this).attr("ajax-validata")=="error"){
            return false;
        }
        //验证成功后发送添加请求
        $.ajax({
            url:"${app_path}/employee",
            type:"post",
            data:$("#emp_add_modal form").serialize(),
            success:function (result) {
                //后端验证通过
                if (result.code==100){
                    //添加成功，关闭模态框，跳到最后一页
                    $('#emp_add_modal').modal('hide');
                    to_page(total);
                } else{
                    //显示失败信息
                    if (undefined!=result.info.fieldErrors.deptName){
                        show_validata_msg("#emp_add_lastName","error",result.info.fieldErrors.lastName);
                    }
                    if (undefined!=result.info.fieldErrors.email){
                        show_validata_msg("#emp_add_email","error",result.info.fieldErrors.email);
                    }
                }
            }
        });
    });
    <%--发送查询部门信息的请求，并添加到部门信息的下拉框中--%>
    function getDepartments(ele) {
        //每次清空前边的信息
        $(ele).empty();
        $.ajax({
            url:"${app_path}/departments",
            type:"get",
            success:function (result) {
                var departments = result.info.departments;
                $.each(departments,function () {
                    $("<option></option>").append(this.deptName).attr("value",this.id).appendTo(ele);
                });
            }
        });
    }
    
    //表单重置
    function formReset(ele) {
        //清空表单数据
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        //清空提示信息
        $(ele).find(".help-block").text("");
    }
    
    <%--员工增加按钮添加事件，点击时弹出添加员工的模态框--%>
    $("#emp_add_btn").click(function () {
        //重置表单，清除表单原有信息
        formReset("#emp_add_modal form");
        //到员工添加框前加入部门信息
        getDepartments("#emp_add_modal select");
        //打开员工添加框
        $('#emp_add_modal').modal({
            backdrop:true
        });
    });

    //页面加载完成后，直接去发一个ajax请求，要到第一页的分页数据
    $(function () {
        to_page(1);
    });
    //跳页
    function to_page(pn){
        //跳页之前还原全选的复选框
        $("#check_all").prop("checked",false);
        $.ajax({
            url:"${app_path}/employees",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
                // console.log(result);
                //1.解析并显示员工信息
                build_emp_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条信息
                build_page_nav(result);
            }
        });
    }
    //1.解析并显示员工信息
    function build_emp_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.info.pageInfo.list;

        $.each(emps,function (index,item) {
            var empCheckTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(item.id);
            var empLastNameTd = $("<td></td>").append(item.lastName);
            var empBirthdayTd = $("<td></td>").append(new Date(item.birthday).format("yyyy-MM-dd"));
            var empGenderTd = $("<td></td>").append(item.gender==1?"男":"女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDpatNameTd = $("<td></td>").append(item.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm update_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil "))
                .append("编辑");
            //给按钮添加自定义属性存储id，用于删除或修改
            editBtn.attr("update-id",item.id);
            var deleteBtn = $("<button></button>").addClass("btn btn-warning btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash "))
                .append("删除");
            deleteBtn.attr("delete-id",item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);

            $("<tr></tr>").append(empCheckTd)
                .append(empIdTd)
                .append(empLastNameTd)
                .append(empBirthdayTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDpatNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");

        });
    }
    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("共有记录"+result.info.pageInfo.total+
            "条,共"+ result.info.pageInfo.pages+
            "页,当前第"+ result.info.pageInfo.pageNum+"页");
        //保存当前页码号
        pageNum = result.info.pageInfo.pageNum;
        $("#page_info_area").attr("pageNum",result.info.pageInfo.pageNum);
        //将总记录条数保存,用于保存成功后返回最后一页
        total=result.info.pageInfo.total;
    }
    //解析并显示分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>") .append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>") .append("&laquo;"));
        if (result.info.pageInfo.hasPreviousPage==false){
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page(1);
            })
            prePageLi.click(function () {
                to_page(result.info.pageInfo.pageNum-1);
            })
        }

        var nextPageLi = $("<li></li>").append($("<a></a>") .append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>") .append("末页").attr("href","#"));
        if (result.info.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            lastPageLi.click(function () {
                to_page(result.info.pageInfo.pages);
            })
            nextPageLi.click(function () {
                to_page(result.info.pageInfo.pageNum+1);
            })
        }

        ul.append(firstPageLi).append(prePageLi);
        $.each(result.info.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>") .append(item));
            if (result.info.pageInfo.pageNum==item)
                numLi.addClass("active");
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi).addClass("pagination pagination-lg");

        var nav = $("<nav></nav>").append(ul).addClass("col-lg-offset-3");
        nav.appendTo("#page_nav_area");
    }
    //日期格式化
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }



</script>
</body>
</html>
