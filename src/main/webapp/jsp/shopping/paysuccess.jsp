<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城</title>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <script>

    </script>
</head>
<body>
<!-- Fixed navbar -->
<nav>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar">a</span>
                    <span class="icon-bar">b</span>
                    <span class="icon-bar">c</span>
                </button>
                <a class="navbar-brand" href="gotoindex.action">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
<%--                    <li><a href="#about">收藏夹</a></li>--%>
                    <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
                    <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</nav>
<div class="layui-row container">
    <div style="padding: 40px; background: #b2ffd3; border:5px double #b2dba1">
        <div style="width: 100%; height: 30px; padding: 5px; font-size: 20px;">支付成功，<a href="login.action?accountOrName=${sessionScope.current_user.account}&password=${sessionScope.current_user.password}">点击此处返回商城首页</a></div>
    </div>
</div>
</body>
</html>
