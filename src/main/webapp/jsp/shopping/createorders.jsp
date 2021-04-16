<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/7
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城</title>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
</head>
<body>
<!-- Fixed navbar -->
<nav>
    <div class="navbar navbar-inverse navbar-fixed-top">
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
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
<%--                    <li><a href="#about">收藏夹</a></li>--%>
                    <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
                    <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</nav>
<div class="layui-row container" style="padding-top: 40px;background: #fff">
    <form action="payment.action?uid=${sessionScope.product_paid.uid}&bid=${sessionScope.product_paid.bid}&pid=${sessionScope.product_paid.pid}" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称：</label>
            <div class="layui-input-block">
                <input type="text" name="pname" lay-verify="title" autocomplete="off" value="${sessionScope.product_paid.pname}" class="layui-input" disabled style="border: none">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商&nbsp;&nbsp;&nbsp;&nbsp;家：</label>
            <div class="layui-input-block">
                <input type="text" name="bname" lay-verify="title" autocomplete="off" value="${sessionScope.product_paid.bname}" class="layui-input" disabled style="border: none">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品数量：</label>
            <div class="layui-input-block">
                <input type="number" name="pnum" lay-verify="title" autocomplete="off" value="${sessionScope.product_paid.pnum}" class="layui-input" disabled style="border: none">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">商品单价：</label>
            <div class="layui-input-block">
                <input type="number" step="0.01" name="price" lay-verify="title" autocomplete="off" value="${sessionScope.product_paid.money}" class="layui-input" readonly style="border: none">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单总价：</label>
            <div class="layui-input-block">
                <input type="number" step="0.01" name="total" lay-verify="title" autocomplete="off" value="${sessionScope.product_paid.total}" class="layui-input" readonly style="border: none">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">收货地址：</label>
            <div class="layui-input-block">
                <c:forEach items="${sessionScope.current_addresses}" var="address">
                    <label for="addr_${address.addrId}">
                        <div class="layui-col-md6" style="background: #f3f3f3">
                            <div id="address-card" class="layui-card" style="padding: 10px;">
                                <input id="addr_${address.addrId}" type="radio" name="addrid" value="${address.addrId}" title="${address.name}  ${address.tel}  ${address.addr}">
                                <div style="width: 200px; padding: 5px">
                                    <div style="margin: 5px;">${address.name}</div>
                                    <div style="margin: 5px;">${address.tel}</div>
                                    <div style="margin: 5px;">${address.addr}</div>
                                </div>
                            </div>
                        </div>
                    </label>
                </c:forEach>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"> 选择银行：</label><br/>
            <div class="layui-input-block">
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
                <img src="${ pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
                <img src="${ pageContext.request.contextPath }/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
                <img src="${ pageContext.request.contextPath }/bank_img/abc.bmp" align="middle"/>
                <br/>
                <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
                <img src="${ pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
                <img src="${ pageContext.request.contextPath }/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
                <img src="${ pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle"/>
                <br/>
                <input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
                <img src="${ pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
                <img src="${ pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn">确认支付</button>
                <button type="button" class="layui-btn layui-btn-primary">返回修改</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
