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
    <script type="javascript">

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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/shopping/shopindex1.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/shopping/shoppingcart.jsp">购物车</a></li>
                    <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <h3>欢迎！${sessionScope.current_user.username}</h3>
            <div style="display: flex; margin:10px 0px 10px 0px;">
                <div class="layui-col-md3" onclick="window.location.href='getuserorders.action?uid=${sessionScope.current_user.uid}'">
                    <div>待发货</div>
                    <div>${sessionScope.orders_count_user_state01}</div>
                </div>
                <div class="layui-col-md3" onclick="window.location.href='getuserorders.action?uid=${sessionScope.current_user.uid}'">
                    <div>待收货</div>
                    <div>${sessionScope.orders_count_user_state02}</div>
                </div>
                <div class="layui-col-md3">
                    <div>待付款</div>
                    <div>${sessionScope.orders_count_user_state00}</div>
                </div>
                <div class="layui-col-md3" onclick="window.location.href='getuserorders.action?uid=${sessionScope.current_user.uid}'">
                    <div>已完成</div>
                    <div>${sessionScope.orders_count_user_state03}</div>
                </div>
            </div>
            <h3 class="form-signin-heading" style="margin-top: 10px">书籍分类</h3>
            <ul class="nav nav-sidebar">
                <c:forEach items="${sessionScope.current_category_second}" var="category">
                    <li><a href="#" onclick="window.location.href='getCategorysecond2.action?csid=${category.csid}'">${category.csname}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <div class="layui-row container" style="display: flex;margin-bottom: 10px">
            <div class="layui-col-xs3">&nbsp;</div>
            <div class="layui-col-xs6" style="display: flex">
                <input type="text" id="search" name="search" class="form-control" style="height: 38px">
                <button type="button" class="layui-btn" style="float:right;">搜索</button>
            </div>
            <div class="layui-col-xs3">&nbsp;</div>
        </div>
        <span class="layui-breadcrumb">
            <a href="${pageContext.request.contextPath}/jsp/shopping/shopindex1.jsp">首页</a>
            <a><cite>${sessionScope.current_category.get(sessionScope.current_category_persent-1).cname}</cite></a>
        </span>
        <div style="padding: 30px;">
            <div class="layui-row layui-col-space15">
                <c:forEach items="${sessionScope.current_product_persent}" var="product">
                    <div class="layui-col-md12">
                        <div class="layui-panel" style="height: 120px; display: flex;">
                            <c:if test="${product.image == null}">
                                <img src="${pageContext.request.contextPath}/images/bookicon.jpeg" style="height: 100px;width: 100px;padding: 10px;"/>
                            </c:if>
                            <c:if test="${product.image != null}">
                                <img src="${product.image}" style="height: 100px;width: 100px;padding: 10px;"/>
                            </c:if>
                            <div style="height: 100%;width: 100%;display:flex;">
                                <div style="height: 100%; padding: 10px 30px;">
                                    <div style="position: absolute; top:15px;font-weight: bold; font-size: large;">${product.pname}</div>
                                    <div style="position: absolute; bottom:15px;">${product.bname}</div>
                                </div>
                                <div style="padding: 20px 30px;position: absolute; right: 0;font-weight: bold;color: #FF5722; font-size: large;">${product.price}</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
