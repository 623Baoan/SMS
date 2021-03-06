<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学院专业查询</title>
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
                    <a href="">学院专业管理</a>
                    <a><cite>学院专业查询</cite></a>
                </span>
            <table class="layui-table" lay-filter="test">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>班级</th>
                    <th>操作</th>
                </tr>
                </thead>

                <c:forEach items="${cdcs}" var="cdc" varStatus="c">
                    <tr>
                        <td>${c.count}</td>
                        <td>${cdc.college}</td>
                        <td>${cdc.department}</td>
                        <td>${cdc.cclass}</td>
                        <td><a class="layui-btn layui-btn-primary layui-border-green" href="javascript:deleteCDC();">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <jsp:include page="/footer.jsp"></jsp:include>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#nav li:nth-child(4) dl dd:nth-child(1)").addClass("layui-this");
    $("#nav li:nth-child(4)").addClass("layui-nav-itemed");
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