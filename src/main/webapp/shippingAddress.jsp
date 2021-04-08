<%@ page import="com.scu.fuzhuohang.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.scu.fuzhuohang.bean.Address" %>
<%@ page import="com.scu.fuzhuohang.controller.AddressController" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/8
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) request.getSession().getAttribute("current_user");
    List<Address> addresses = (List<Address>) request.getSession().getAttribute("current_addresses");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人空间</title>
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="webjars/layui/2.5.7/css/layui.css" rel="stylesheet" media="all">
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script type="text/javascript" language="JavaScript">
        function fun(){
            window.location.href="getAddressList.action?uid="+<%=user.getUid()%>;
        }
        function url(){
            var obj = document.getElementById("writeOff");
            if(confirm('警告：注销账号将不可逆，请慎重考虑！！！请确认是否注销账号')){
                window.location.href="writeoff.action";
            }
        }
    </script>
</head>
<body onload="fun()">
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
                <li><a href="changeUserInfo.jsp">修改信息</a></li>
                <li><a href="changePassword.jsp">修改密码</a></li>
                <li class="active"><a href="shippingAddress.jsp">我的地址</a></li>
                <li><a href="#">我的足迹</a></li>
                <li><a href="#">我的评论</a></li>
                <li><a onclick="url()" href="javascript:void(0)">注销账号</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <div class="layui-bg-gray" style="padding: 30px;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">卡片面板</div>
                        <div class="layui-card-body">
                            卡片式面板面板通常用于非白色背景色的主体内<br>
                            从而映衬出边框投影
                        </div>
                    </div>
                </div>
                <div class="layui-col-md6">
                    <div class="layui-card">
                        <div class="layui-card-header">卡片面板</div>
                        <div class="layui-card-body">
                            结合 layui 的栅格系统<br>
                            轻松实现响应式布局
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
