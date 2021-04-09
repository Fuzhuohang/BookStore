<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城</title>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <script type="text/javascript">
        function postform(){
            var password = document.getElementById("newpassword").value;
            var password1 = document.getElementById("newpassword1").value;
            if(password == password1){
                window.location.href="reset.action?password="+password;
            }else{
                alert("两次密码不一样");
                return false;
            }
        }
    </script>
</head>
<body>
<form class="form-signin">
    <h2 class="form-signin-heading" style="text-align: center">重设密码</h2>
    <label for="newpassword" class="sr-only">请输入新密码：</label>
    <input type="password" name="newpassword" id="newpassword" class="form-control" placeholder="请输入新密码" required>
    <label for="newpassword1" class="sr-only">请确认新密码：</label>
    <input type="password" name="newpassword1" id="newpassword1" class="form-control" placeholder="请确认新密码" required>
    <div>
        <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="button" onclick="postform()">提&nbsp;&nbsp;&nbsp;&nbsp;交</button>
    </div>
    <div>
        <div id = "login" style="float: right">
            <a href="login.jsp">想起密码了？前往登录!</a>
        </div>
    </div>
</form>
</body>
</html>
