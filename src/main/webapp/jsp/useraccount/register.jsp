<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城-注册</title>
    <link rel="stylesheet" href="../../webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="../../css/signin.css" rel="stylesheet">
    <script type="text/javascript">
        function postform(){
            var tel = document.getElementById("tel").value;
            var password = document.getElementById("password").value;
            var password1 = document.getElementById("password1").value;
            if(password == password1){
                window.location.href="register.action?tel="+ tel+"&password="+password;
            }else{
                alert("两次密码不一样");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container" id = "register_frame">
    <form class="form-signin">
        <h2 class="form-signin-heading" style="text-align: center">注&nbsp;&nbsp;&nbsp;&nbsp;册</h2>
        <label for="tel" class="sr-only">手机号：</label>
        <input type="tel" name = "tel" id="tel" class="form-control" placeholder="请输入手机号" required autofocus>
        <label for="password" class="sr-only">密码：</label>
        <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" required>
        <label for="password1" class="sr-only">密码确认：</label>
        <input type="password" name="password1" id="password1" class="form-control" placeholder="请再次输入密码" required>
        <div>
            <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="postform()">注&nbsp;&nbsp;&nbsp;&nbsp;册</button>
        </div>
        <div>
            <div id = "login" style="float: right">
                <a href="login.jsp">已有账号？前往登录!</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
