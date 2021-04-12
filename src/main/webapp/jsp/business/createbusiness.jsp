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
    <script src="../../webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="../../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../../layui/js/layui.js"></script>
    <link href="../../webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../../layui/css/layui.css" rel="stylesheet" media="all">
    <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="../../css/theme.css" rel="stylesheet">
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
                    <li><a href="personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="#shopping">购物车</a></li>
                    <li><a href="#order">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
    <div class="container" id = "login_frame">
        <form class="form-signin" action="registerbusiness.action?uid=${sessionScope.current_user.uid}" method="post">
            <div align="center">
                <label for="bname">店&nbsp;&nbsp;铺&nbsp;&nbsp;名&nbsp;&nbsp;称：</label>
                <input id="bname" name="bname" type="text" class="form-control2" placeholder="请输入店铺名称">
            </div>
            <div align="center">
                <label for="baddr">店铺所在地址：</label>
                <input id="baddr" name="baddr" type="text" class="form-control2" placeholder="请输入店铺所在地址">
            </div>
            <div>
                <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
            </div>
        </form>
    </div>
</body>
</html>
