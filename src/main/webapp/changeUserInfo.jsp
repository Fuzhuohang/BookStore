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
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城-个人空间</title>
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script type="text/javascript" language="JavaScript">
        function url(uid){
            if(confirm('警告：注销账号将不可逆，请慎重考虑！！！请确认是否注销账号')){
                window.location.href="writeoff.action?uid="+uid;
            }
        }
    </script>
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
                <li class="active"><a href="personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
                <li><a href="#about">收藏夹</a></li>
                <li><a href="#shopping">购物车</a></li>
                <li><a href="#order">订单</a></li>
                <li><a href="#">我的店铺</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li><a href="personalspace.jsp">个人信息</a></li>
                <li class="active"><a href="changeUserInfo.jsp">修改信息</a></li>
                <li><a href="changePassword.jsp">修改密码</a></li>
                <li><a href="shippingAddress.jsp">我的地址</a></li>
                <li><a href="#">我的足迹</a></li>
                <li><a href="#">我的评论</a></li>
                <li><a onclick="url(${sessionScope.current_user.uid})" href="javascript:void(0)">注销账号</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <form class="form-signin" action="updateInfo.action" method="post">
            <div align="center">
                <label for="account">账&nbsp;&nbsp;&nbsp;号：</label>
                <input id="account" name="account" type="text" class="form-control2" value="<%=user.getAccount()%>" readonly="readonly">
            </div>
            <div align="center">
                <label for="username">用户名：</label>
                <input id="username" name="username" type="text" value="<%=user.getUsername()%>">
            </div>
            <div align="center">
                <label for="tel">电&nbsp;&nbsp;&nbsp;话：</label>
                <input id="tel" name="tel" type="tel" value="<%=user.getTel()%>">
            </div>
            <div align="center">
                <label for="email">邮&nbsp;&nbsp;&nbsp;件：</label>
                <input id="email" name="email" type="email" value="<%=user.getEmail()%>">
            </div>
            <div>
                <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
            </div>
        </form>

    </div>
</div>
</body>
</html>
