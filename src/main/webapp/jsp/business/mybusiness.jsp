<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/12
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>${sessionScope.current_business.bname}-悦读书城</title>
    <script src="../../webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="../../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../../layui/js/layui.js"></script>
    <link href="../../webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../../layui/css/layui.css" rel="stylesheet" media="all">
    <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="../../css/theme.css" rel="stylesheet">
    <link href="../../css/dashboard.css" rel="stylesheet">
    <link href="../../css/signin.css" rel="stylesheet">
    <script type="text/javascript" language="JavaScript">
        function url(bid){
            if(confirm('警告：关停店铺将不可逆，请慎重考虑！！！请确认是否关停店铺')){
                window.location.href="deletebusiness.action?bid="+bid;
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
                <li><a href="../../personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
                <li><a href="#about">收藏夹</a></li>
                <li><a href="#shopping">购物车</a></li>
                <li><a href="#order">订单</a></li>
                <li class="active"><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li class="active"><a href="mybusiness.jsp">店铺信息</a></li>
                <li><a href="#">修改信息</a></li>
                <li><a href="#">全部商品</a></li>
                <li><a href="#">订单详情</a></li>
                <li><a onclick="url(${sessionScope.current_business.bid})" href="javascript:void(0)">关停店铺</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >

    </div>
</div>
</body>
