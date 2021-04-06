<%--
  Created by IntelliJ IDEA.
  User: Ai
  Date: 2020/6/11
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请注册</title>
    <style type="text/css">
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            padding: 0;
            font: 16px/20px microsft yahei;
            text-align: center;
        }
        .wrap {
            width: 100%;
            height: 100%;
            padding: 10% 0;
            position: fixed;
            opacity: 0.8;
            background: linear-gradient(to top left,#000000, #656565);
        }
        .container {
            width: 60%;
            margin: 0 auto;
        }
        .container h1 {
            text-align: center;
            color: #FFFFFF;
            font-weight: 500;
        }
        .container input {
            width: 320px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 32px auto;
        }
        .container input[type="text"] , .container input[type="password"]  {
            background-color: #FFFFFF;
            font-size: 16px;
            color: #50a3a2;
        }
        .container input[type='submit']{
            font-size: 16px;
            letter-spacing: 2px;
            color: #666666;
            background-color: #FFFFFF;
        }
        .container input:focus {
            width: 400px;
        }
        .container input[type='submit']:hover {
            cursor: pointer;
            width: 400px;
        }
        .to_login{
            color: #a7c4c9;
        }
        .text{
            color: #e2dfe4;
        }
    </style>
</head>
<body>
<div class="wrap">
    <form action="register.action", method="post">
            <div class="container">
                <h1 style="color: white; margin: 0; text-align: center">注册账户</h1>  
        <label><input type="text" name="user_name" placeholder="请输入您的用户名"/></label>
        <label><input type="account" name="account" placeholder="请输入您的账号"/></label>
        <label><input type="password" name="password" placeholder="请输入您的密码" /></label>
    </div>
        <label><input type="radio" name="authority" value="1">普通用户</label>
        <label><input type="radio" name="authority" value="2">管理员</label>
        <div class="container">
            <input type="submit" value="注册"/>
                        <p class="change_link" style="text-align: center">
                            <span class="text">已有账户？</span>
                            <a href="loginForm.jsp" class="to_login">那就去登录啊</a>
                        </p>
        </div>
    </form>
    <div width = 100px align="center"><font>${message}</font></div>
</div>
</body>
</html>
