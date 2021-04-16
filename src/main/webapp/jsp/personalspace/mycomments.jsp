<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
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
            <a class="navbar-brand" href="gotoindex.action">悦读书城</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
<%--                <li><a href="#about">收藏夹</a></li>--%>
                <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
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
<%--                <li><a href="#">我的足迹</a></li>--%>
                <li><a href="getcommentproduct.action?uid=${sessionScope.current_user.uid}">我的评论</a></li>
                <li><a onclick="url(${sessionScope.current_user.uid})" href="javascript:void(0)">注销账号</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <div class="layui-bg-gray" style="padding: 30px;">
            <div id="addrs" class="layui-row layui-col-space15">
                <c:forEach items="${sessionScope.user_comments}" var="comment">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header" style="display: flex">
                                <div>${comment.pname}</div>
                                <div style="margin-left: 15px">${comment.bname}</div>
                                <div id="score_${comment.cid}"></div>
                            </div>
                            <div class="layui-card-body">
                                    ${comment.comm}
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        layui.use(['rate'], function() {
                            var rate = layui.rate;
                            rate.render({
                                elem: '#score_${comment.cid}'
                                ,value: ${comment.score}
                                ,half: true
                                ,text: true
                                ,readonly: true
                            });
                        });
                    </script>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
