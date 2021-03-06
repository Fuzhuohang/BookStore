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
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
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

        function postform(){
            var oldpassword = document.getElementById("oldpassword").value;
            if(oldpassword == ${sessionScope.current_user.password}){
                var newpassword = document.getElementById("newpassword").value;
                var newpassword2 = document.getElementById("newpassword1").value;
                if(newpassword == oldpassword){
                    alert("新密码与旧密码相同，请重新输入");
                    return false;
                }
                if(newpassword == newpassword2){
                    var password = newpassword;
                    window.location.href="updatepwd.action?accountOrName="+ ${sessionScope.current_user.account}+"&password="+password;
                }else{
                    alert("两次密码不一样");
                    return false;
                }
            }else{
                alert("旧密码输入错误");
                return false;
            }
        }
    </script>
    <script type="javascript">

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
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/changeUserInfo.jsp">修改信息</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/jsp/personalspace/changePassword.jsp">修改密码</a></li>
                <li><a onclick="addr()" href="javascript:void(0)">我的地址</a></li>
<%--                <li><a href="#">我的足迹</a></li>--%>
                <li><a href="getcommentproduct.action?uid=${sessionScope.current_user.uid}">我的评论</a></li>
                <li><a onclick="url(${sessionScope.current_user.uid})" href="javascript:void(0)">注销账号</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <form id="formid" class="form-signin">
            <label for="oldpassword" class="sr-only">请输入旧密码：</label>
            <input type="password" name="oldpassword" id="oldpassword" class="form-control" placeholder="请输入旧密码" required>
            <label for="newpassword" class="sr-only">请输入新密码：</label>
            <input type="password" name="newpassword" id="newpassword" class="form-control" placeholder="请输入新密码" required>
            <label for="newpassword1" class="sr-only">请确认新密码：</label>
            <input type="password" name="newpassword1" id="newpassword1" class="form-control" placeholder="请确认新密码" required>
            <div>
                <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="postform()">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>