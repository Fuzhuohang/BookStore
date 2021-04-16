<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/12
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>${sessionScope.current_business.bname}-悦读书城</title>
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
    <script type="text/javascript" language="JavaScript">
        function url(uid){
            if(confirm('警告：关停店铺将不可逆，请慎重考虑！！！请确认是否关停店铺')){
                window.location.href="deletebusiness.action?uid="+uid;
            }
        }
        function urlproduct(pid){
            if(confirm('警告：删除商品将不可逆，请慎重考虑！！！请确认是否删除商品')){
                window.location.href="deleteproduct.action?pid="+pid;
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
            <a class="navbar-brand" href="gotoindex.action">悦读书城</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
<%--                <li><a href="#about">收藏夹</a></li>--%>
                <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
                <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                <li class="active"><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li><a href="mybusiness.jsp">店铺信息</a></li>
                <li><a href="changeBusinessInfo.jsp">修改信息</a></li>
                <li class="active"><a href="enterbusinessproduct.action?bid=${sessionScope.current_business.bid}">全部商品</a></li>
                <li><a href="getbusinessorders.action?bid=${sessionScope.current_business.bid}">订单详情</a></li>
                <li><a onclick="url(${sessionScope.current_business.uid})" href="javascript:void(0)">关停店铺</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <div class="layui-btn-group">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/jsp/business/addProduct.jsp'"><i class="layui-icon"></i></button>
        </div>
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
</div>
</body>
