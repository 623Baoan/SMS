<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>选课列表</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2">
<jsp:include page="/filterLogin.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin/aHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/admin/adleftNav.jsp"></jsp:include>
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
                <span class="layui-breadcrumb">
                    <a href="index.jsp">主页</a>
                    <a href="">选课信息管理</a>
                    <a><cite>选课列表</cite></a>
                </span>
            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学号</th>
                    <th>学生姓名</th>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>课程简介</th>
                    <th>教师号</th>
                    <th>教师</th>
                    <th>分数</th>
                </tr>
                </thead>

                <c:forEach items="${selectcourses}" var="selectcourse" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${selectcourse.s_id}</td>
                        <td>${selectcourse.s_name}</td>
                        <td>${selectcourse.c_id}</td>
                        <td>${selectcourse.c_name}</td>
                        <td>${selectcourse.c_info}</td>
                        <td>${selectcourse.t_id}</td>
                        <td>${selectcourse.t_name}</td>
                        <td>${selectcourse.score}</td>
                    </tr>
                </c:forEach>
            </table>
            <jsp:include page="/footer.jsp"></jsp:include>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(1) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(1)").addClass("layui-nav-itemed");
</script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        element.init();
    });
</script>

</body>
</html>

