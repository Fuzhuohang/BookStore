<%--
  Created by IntelliJ IDEA.
  User: LX
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
</head>
<body>
<div class="container" id = "login_frame">
    <form class="form-signin" action="login.action" method="post">
        <h2 class="form-signin-heading" style="text-align: center">登&nbsp;&nbsp;&nbsp;&nbsp;录</h2>
        <label for="accountOrName" class="sr-only">账号：</label>
        <input type="text" name = "accountOrName" id="accountOrName" class="form-control" placeholder="请输入账号或用户名" required autofocus>
        <label for="password" class="sr-only">密码：</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" required>
        <div>
            <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
        </div>
        <div>
            <div id = "res" style="float: left">
                <a href="register.jsp">没有账号？立即注册!</a>
            </div>
            <div id = "forget_pwd" style="float: right">
                <a href="forgetPassword.jsp">忘记密码</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
