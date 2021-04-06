<%--
  Created by IntelliJ IDEA.
  User: Ai
  Date: 2020/6/12
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改密码</title>
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
            background: linear-gradient(to bottom right,#000000, #656565);
        }
        .wrap input[type="radio"]{
            background-color: #FFFFFF;
            font-size: 15px;
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
        .container input[type="text"] , .container input[type="paassword"]  {
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
        .text{
            color: #e2dfe4;
        }
        .to_login{
            color: #a7c4c9;
        }
    </style>
</head>
<body>
<div width = 100px align="center"><font>${message}</font></div>
<div class="wrap">
    <form action="changePassword.action" method="post">
        <div class="container">
            <h1 style="color: white; margin: 0; text-align: center">申请修改密码</h1>  
            <label><input type="text" name="accountOrName" placeholder="请输入您的用户名或账号"/></label>
            <label><input type="password" name="newPassword" placeholder="请输入您的新密码"/></label>
            <label><input type="submit" value="更改密码"/></label>
            <p class="change_link" style="text-align: center">
                                <span class="text">想起来密码了？</span>
                                <a href="loginForm.jsp" class="to_login">那就去登录啊</a>
                            </p>
        </div>
    </form>
</div>
</body>
</html>
