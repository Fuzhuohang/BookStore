<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/8
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城</title>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
</head>
<body>
<form class="form-signin" action="verify.action" method="post">
    <h2 class="form-signin-heading" style="text-align: center">账号验证</h2>
    <label for="account" class="sr-only">账号：</label>
    <input type="text" name = "account" id="account" class="form-control" placeholder="请输入账号" required autofocus>
    <label for="username" class="sr-only">用户名：</label>
    <input type="text" name = "username" id="username" class="form-control" placeholder="请输入用户名" required autofocus>
    <label for="tel" class="sr-only">电话：</label>
    <input type="tel" name = "tel" id="tel" class="form-control" placeholder="请输入电话" required autofocus>
    <label for="email" class="sr-only">邮箱：</label>
    <input type="email" name = "email" id="email" class="form-control" placeholder="请输入邮箱" required autofocus>
    <div>
        <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">验&nbsp;&nbsp;&nbsp;&nbsp;证</button>
    </div>
    <div>
        <div id = "login" style="float: right">
            <a href="login.jsp">想起密码了？前往登录!</a>
        </div>
    </div>
</form>
</body>
</html>
