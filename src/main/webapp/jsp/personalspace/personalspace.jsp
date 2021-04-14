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
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/js/layui.js"></script>
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <script type="text/javascript" language="JavaScript">
        function url(uid){
            if(confirm('警告：注销账号将不可逆，请慎重考虑！！！请确认是否注销账号')){
                window.location.href="writeoff.action?uid="+uid;
            }
        }
        function addr(){
            window.location.href="getAddressList.action"
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/shopping/shopindex1.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/shopping/shoppingcart.jsp">购物车</a></li>
                    <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar" >
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/changeUserInfo.jsp">修改信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/changePassword.jsp">修改密码</a></li>
                    <li><a onclick="addr()" href="javascript:void(0)">我的地址</a></li>
                    <li><a href="#">我的足迹</a></li>
                    <li><a href="#">我的评论</a></li>
                    <li><a onclick="url(${sessionScope.current_user.uid})" href="javascript:void(0)">注销账号</a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
            <div align="center">
                <h1>你好！${sessionScope.current_user.username}</h1>
                <label for="account">账号：</label>
                <input id="account" name="account" type="text" value="${sessionScope.current_user.account}" disabled>
            </div>
            <div align="center">
                <label for="tel">电话：</label>
                <input id="tel" name="tel" type="tel" value="${sessionScope.current_user.tel}" disabled>
            </div>
            <div align="center">
                <label for="email">邮件：</label>
                <input id="email" name="email" type="email" value="${sessionScope.current_user.email}" disabled>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr class="layui-border-green">
            <div style="align-content: center; "><h2>个人订单信息总览</h2></div>
            <div class="layui-form">
                <table class="layui-table">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>待发货</th>
                        <th>待收货</th>
                        <th>待付款</th>
                        <th>待评价</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${sessionScope.orders_count_user_state01}</td>
                        <td>${sessionScope.orders_count_user_state02}</td>
                        <td>${sessionScope.orders_count_user_state00}</td>
                        <td>${sessionScope.orders_count_user_state03}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
