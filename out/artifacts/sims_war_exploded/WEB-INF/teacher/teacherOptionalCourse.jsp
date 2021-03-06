<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的授课</title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/style.css">
    <script src="./layui.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #F2F2F2">
<jsp:include page="/filterLogin.jsp"></jsp:include>
<jsp:include page="/WEB-INF/teacher/tHeader.jsp"></jsp:include>
<jsp:include page="/WEB-INF/teacher/tleftNav.jsp"></jsp:include>
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
                <span class="layui-breadcrumb">
                    <a href="index.jsp">主页</a>
                    <a>课程信息</a>
                    <a><cite>我的授课</cite></a>
                </span>
            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>课程简介</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:forEach items="${optionalcourses}" var="optionalcourse" varStatus="t">
                    <tr>
                        <td>${t.count}</td>
                        <td>${optionalcourse.c_id}</td>
                        <td>${optionalcourse.c_name}</td>
                        <td>${optionalcourse.c_info}</td>
                        <td>
                            <a class="layui-btn layui-btn-primary layui-border-green" href="${pageContext.request.contextPath}/updateTeacherOptionalCourseServlet?cid=${optionalcourse.c_id}">修改</a>
                            <a class="layui-btn layui-btn-primary layui-border-green" href="${pageContext.request.contextPath}/findStudentCourseScoreServlet?cid=${optionalcourse.c_id}">查看</a>
                            <a class="layui-btn layui-btn-primary layui-border-green" href="javascript:deleteOptionalCourse(${optionalcourse.c_id});">删除</a>
                        </td>
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
<script type="text/javascript">
    function deleteOptionalCourse(c_id) {
        if (confirm("你确定删除授课吗？")) {
            location.href = "${pageContext.request.contextPath}/deleteOptionalCourseServlet?cid=" + c_id;
        }
    }
</script>
</body>
</html>
