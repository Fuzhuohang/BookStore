<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商城</title>
    <link href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
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
                <a class="navbar-brand" href="shopindex.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="login.jsp">登录</a></li>
                    <li><a href="register.jsp">注册</a> </li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="#shopping">购物车</a></li>
                    <li><a href="#order">订单</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
        <%--    <form>--%>
        <%--        <div>--%>
        <%--            <input type="text" id="search" name="search" class="form-control">--%>
        <%--            <button id="btn_login" class="btn btn-lg btn-primary btn-block" type="submit">搜索</button>--%>
        <%--        </div>--%>
        <%--    </form>--%>
    </nav>

</body>
</html>