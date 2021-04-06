<%--
  Created by IntelliJ IDEA.
  User: Ai
  Date: 2020/6/11
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"/>
<html>
<head>
    <title>登陆页面</title>
    <style type="text/css">
        #res{
            color: blue;
            float: left;
            margin-left: 20px;
            margin-top: 100px;
        }
        body {
            /*background-image: url("images/majima_construction.jpg");;*/
            background-size: 100%;
            background-repeat: no-repeat;
        }
        #login_frame {
            width: 400px;
            height: 260px;
            padding: 13px;

            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -200px;

            background-color: rgba(240, 255, 255, 0.5);

            border-radius: 10px;
            text-align: center;
        }
        form p > * {
            display: inline-block;
            vertical-align: middle;
        }
        #image_logo {
            margin-top: 22px;
        }
        .label_input {
            font-size: 14px;
            font-family: 宋体;
            width: 65px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            color: white;
            background-color: #3CD8FF;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }
        .text_field {
            width: 278px;
            height: 28px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border: 0;
        }
        #btn_login {
            font-size: 14px;
            font-family: 宋体;
            width: 120px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            color: white;
            background-color: #3BD9FF;
            border-radius: 6px;
            border: 0;
            float: left;
        }
        #forget_pwd {
            font-size: 12px;
            color: white;
            text-decoration: none;
            position: relative;
            float: right;
            top: 5px;
        }
        #forget_pwd:hover {
            color: blue;
            text-decoration: underline;
        }
        #login_control {
            margin-top: 20px;
            padding: 0 28px;
        }
    </style>
</head>
<body>
<%--<div width = 100px align="center"><font>${message}</font></div>--%>
<div id = "res">
    <a href="register.jsp">没有账号？立即注册!</a>
</div>
<div id = "login_frame">
    <p id="image_logo"><img width=80px src="images\majima_icon.png"></p>
    <form action="login.action" method="post">
        <p><label for="accountOrName">账号/用户名：</label><input type="text" name = "accountOrName" id="accountOrName" class="text_field"></p>
        <p><label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;&nbsp;</label><input type = "password" name="password" id="password" class="text_field"></p>
        <div id="login_control">
            <input type="submit" value="登陆" id="btn_login">
            <div id = "forget_pwd">
                <a href="forgetPassword.jsp">忘记密码</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
