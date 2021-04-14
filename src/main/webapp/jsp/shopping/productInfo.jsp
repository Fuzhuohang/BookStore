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
    <script type="text/css">

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
<div class="layui-row container" style="padding-top: 40px;background: #fff">
    <div class="layui-row container" style="display: flex;margin-bottom: 30px">
        <div class="layui-col-xs3">&nbsp;</div>
        <div class="layui-col-xs6" style="display: flex">
            <input type="text" id="search" name="search" class="form-control" style="height: 38px">
            <button type="button" class="layui-btn" style="float:right;">搜索</button>
        </div>
        <div class="layui-col-xs3">&nbsp;</div>
    </div>
    <hr class="layui-border-green">
    <div class="layui-row container" style="display: flex;margin-top: 50px;margin-bottom: 50px">
        <div class="layui-col-md5">
            <c:if test="${sessionScope.product_info.image == null}">
                <img src="${pageContext.request.contextPath}/images/bookicon.jpeg" style="height: auto;width: 450px;"/>
            </c:if>
            <c:if test="${sessionScope.product_info.image != null}">
                <img src="${product.image}" style="height: 500px;width: 500px;"/>
            </c:if>
        </div>
        <div class="layui-col-md7" style="margin-left:30px;">
            <div style="margin: 5px;"><h1>${sessionScope.product_info.pname}</h1></div>
            <div style="margin: 5px;">${sessionScope.product_info.pdesc}</div>
            <div style="display: flex; margin: 5px;">
                <div>价格：</div>
                <div style="font-weight: bold;color: #FF5722; font-size: large;"><h2>${sessionScope.product_info.price}</h2></div>
            </div>
            <div style="display: flex; margin: 5px;">
                <div>剩余数量：</div>
                <div>${sessionScope.product_info.pnum}</div>
            </div>
            <div style="display: flex; margin: 5px;">
                <div>购买数量：</div>
                <div>
                    <input id="buynum" name="buynum" type="number" class="layui-btn layui-btn-primary layui-btn-sm" value="1">
                </div>
            </div>
            <div style="display: flex; margin: 5px;">
                <div>店铺：</div>
                <div><a>${sessionScope.product_business.bname}</a></div>
            </div>
            <div style="margin: 5px;">
                <div class="layui-col-md6">
                    <button type="button" class="layui-btn" style="width: inherit">立即购买</button>
                </div>
                <div class="layui-col-md6">
                    <button type="button" class="layui-btn layui-btn-primary layui-border-green" style="width: inherit">加入购物车</button>
                </div>
            </div>
            <%--        <div style="border: 1px solid #000;">--%>
            <%--            <div style="border: 1px solid #000;">收藏</div>--%>
            <%--        </div>--%>
        </div>
    </div>
    <hr class="layui-border-green">
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">用户评论&nbsp;&nbsp;<span class="layui-badge-rim">${sessionScope.product_commentcount}</span></li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="layui-bg-gray" style="padding: 15px;">
                    <div class="layui-row layui-col-space15">
                        <c:forEach items="${sessionScope.product_comment}" var="comment">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <div>${comment.username}</div>
                                        <div id="score" style="float: right"></div>
                                        <script>
                                            layui.use(['rate'], function() {
                                                rate.render({
                                                    elem: '#score'
                                                    ,value: ${comment.score}
                                                    ,half: true
                                                    ,text: true
                                                    ,readonly: true
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="layui-card-body">
                                        ${comment.comm}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
