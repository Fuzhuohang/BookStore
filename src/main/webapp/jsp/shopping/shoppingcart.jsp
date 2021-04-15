<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/12
  Time: 15:13
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
    <script type="javascript">

    </script>
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/shopping/shopindex1.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
                    <li><a href="#about">收藏夹</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/shopping/shoppingcart.jsp">购物车</a></li>
                    <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</nav>
<div class="layui-row container">
    <div class="layui-form">
        <table class="layui-table" id="test">
            <colgroup>
                <col align="center">
                <col>
                <col align="center">
                <col align="center">
                <col align="center">
            </colgroup>
            <thead>
            <tr>
                <th style="width: 65px;">
                    <div style="width: 32px;" onclick="checkAll(check_all)">
                        <input type="checkbox" id="check_all" name="check_all" value="check_all">
                    </div>
                </th>
                <th>商品</th>
                <th style="width: 100px;">数量</th>
                <th style="width: 100px;">价格</th>
                <th style="width: 100px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.orders_list_user_state00}" var="orders">
                <tr>
                    <td>
                        <div style="width: 32px;">
                            <input type="checkbox" id="check_${orders.oid}" name="checkbox_info" value="${orders}" onclick="console.log(check_${orders.oid}+'checked');">
                        </div>
                    </td>
                    <td>
                        <div style="height: 120px; display: flex;">
                            <c:if test="${orders.image == null}">
                                <img src="${pageContext.request.contextPath}/images/bookicon.jpeg" style="height: 100px;width: 100px;padding: 10px;"/>
                            </c:if>
                            <c:if test="${orders.image != null}">
                                <img src="${orders.image}" style="height: 100px;width: 100px;padding: 10px;"/>
                            </c:if>
                            <div style="height: 100%;width: 100%;display:flex;">
                                <div style="height: 100%; padding: 10px 30px;">
                                    <div style="position: absolute; top:15px;font-weight: bold; font-size: large;">${orders.pname}</div>
                                    <div style="position: absolute; bottom:15px;">${orders.bname}</div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div style="width: 65px;">
                            <input type="number" id="num_${orders.oid}" value="${orders.pnum}" style="width: 65px;">
                        </div>
                    </td>
                    <td>
                        <div style="width: 65px;">
                            <input type="number" step="0.01" id="price_${orders.oid}" value="${orders.total}" readonly="readonly" style="width: 65px; border: none; color: #FF5722; font-size: 20px;">
                        </div>
                    </td>
                    <td>
                        <div style="width: 65px;">
                            <div><a>订单结算</a></div>
                            <div><a>保存修改</a></div>
                            <div><a>删除订单</a></div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    function checkAll(checkall) {
        console.log("check_all is checked");
        var arr = document.getElementsByName("checkbox_info");
        if (checkall.checked == true) {
            console.log(checkall.checked);
            for(var i = 0;i < arr.length;i++){
                console.log(arr[i].id+"::"+arr[i].checked);
                if(arr[i].checked == false){
                    console.log(arr[i].id+" changeed");
                    arr[i].checked = true;
                }
                console.log(arr[i].id+"::"+arr[i].checked);
            }
        }else{
            for(var i = 0;i < arr.length;i++){
                console.log(arr[i].id+"::"+arr[i].checked);
                if(arr[i].checked == true){
                    arr[i].checked = false;
                }
                console.log(arr[i].id+"::"+arr[i].checked);
            }
        }
    }
</script>
</body>
</html>
