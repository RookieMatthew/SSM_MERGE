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

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>员工信息列表</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-lg-offset-8">
                <button class="btn btn-primary ">新增</button>
                <button class="btn btn-warning ">删除</button>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover">
                <tr>
                    <th>工号</th>
                    <th>姓名</th>
                    <th>生日</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.lastName}</td>
                        <td><f:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd"></f:formatDate></td>
                        <td>${emp.gender eq 1?'男':'女'}</td>
                        <td>${emp.email}</td>
                        <td>${emp.dept.deptName}</td>
                        <td>
                            <button class="btn btn-primary glyphicon glyphicon-pencil btn-sm">编辑</button>
                            <button class="btn btn-warning glyphicon glyphicon-trash btn-sm">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="row">
            共有记录${pageInfo.total}条,共${pageInfo.pages}页，当前第${pageInfo.pageNum}页
        </div>
        <div class="row">
            <nav aria-label="Page navigation" class="col-lg-offset-4">
                <ul class="pagination">
                    <li><a href="${app_path}/employees?pn=1">首页</a></li>
                    <c:if test="${pageInfo.pageNum!=1}">
                        <li>
                            <a href="${app_path}/employees?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pn">
                        <c:if test="${pageInfo.pageNum==pn}">
                            <li class="active"><a href="#">${pn}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=pn}">
                            <li><a href="${app_path}/employees?pn=${pn}">${pn}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                        <li>
                            <a href="${app_path}/employees?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${app_path}/employees?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>
