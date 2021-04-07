<%@ page import="com.scu.fuzhuohang.bean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) request.getSession().getAttribute("current_user");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人空间</title>
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
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
                <li class="active"><a href="personalspace.jsp">欢迎！<%=user.getUsername()%></a></li>
                <li><a href="logout.action">退出登录</a></li>
                <li><a href="#about">收藏夹</a></li>
                <li><a href="#shopping">购物车</a></li>
                <li><a href="#order">订单</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
    <%--        <form>--%>
    <%--            <div>--%>
    <%--                <input type="text" id="search" name="search" class="form-control">--%>
    <%--                <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">搜索</button>--%>
    <%--            </div>--%>
    <%--        </form>--%>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li><a href="personalspace.jsp">个人信息</a></li>
                <li class="active"><a href="changeUserInfo.jsp">修改信息</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">我的购物车</a></li>
                <li><a href="#">我的收藏夹</a></li>
                <li><a href="#">我的足迹</a></li>
                <li><a href="#">我的评论</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <form>
            <div align="center">
                <h1>你好！<%=user.getUsername()%></h1>
                <label for="account">账号：</label>
                <input id="account" name="account" type="text" value="<%=user.getAccount()%>" disabled>
            </div>
            <div align="center">
                <label for="tel">电话：</label>
                <input id="tel" name="tel" type="text" value="<%=user.getTel()%>">
            </div>
            <div align="center">
                <label for="email">邮件：</label>
                <input id="email" name="email" type="text" value="<%=user.getTel()%>">
            </div>
            <div>
                <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
            </div>
        </form>

    </div>
</div>
</body>
</html>
