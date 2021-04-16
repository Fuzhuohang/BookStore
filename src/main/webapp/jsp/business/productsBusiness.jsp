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
<div class="layui-row container" style="padding-top: 40px;background: #fff">
    <div class="layui-row container" style="display: flex;margin-bottom: 10px">
        <div class="layui-col-xs3">
            <h1>${sessionScope.current_business.bname}</h1>
            <h5>${sessionScope.current_business.BAddr}</h5>
        </div>
        <div class="layui-col-xs6" style="display: flex">
            <input type="text" id="search" name="search" class="form-control" style="height: 38px">
            <button type="button" class="layui-btn" style="float:right;">搜索</button>
        </div>
        <div class="layui-col-xs3">&nbsp;</div>
    </div>
    <hr class="layui-border-green">
    <div style="padding: 30px;">
        <div class="layui-row layui-col-space15">
            <c:forEach items="${sessionScope.business_products}" var="product">
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
                            </div>
                            <div style="padding: 20px 30px;position: absolute; right: 0;">
                                <div style="font-weight: bold;color: #FF5722; font-size: large;">${product.price}</div>
                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="window.location.href='editproduct01.action?pid=${product.pid}'"><i class="layui-icon"></i></button>
                                <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="urlproduct(${product.pid})"><i class="layui-icon"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
