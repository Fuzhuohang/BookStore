<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/9
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城</title>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="layui/js/layui.js"></script>
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="layui/css/layui.css" rel="stylesheet" media="all">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
</head>
<body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar">a</span>
                    <span class="icon-bar">b</span>
                    <span class="icon-bar">c</span>
                </button>
                <a class="navbar-brand" href="shopindex1.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="#shopping">购物车</a></li>
                    <li><a href="#order">订单</a></li>
                    <li class="active"><a href="#">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

</body>
</html>
