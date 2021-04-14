<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.scu.fuzhuohang.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.scu.fuzhuohang.bean.Address" %>
<%@ page import="com.scu.fuzhuohang.controller.AddressController" %>
<%@ page import="org.json.JSONArray" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/8
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>悦读书城-个人空间</title>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/webjars/layui/2.5.7/css/layui.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <script type="text/javascript" language="JavaScript">
        function url(uid){
            if(confirm('警告：注销账号将不可逆，请慎重考虑！！！请确认是否注销账号')){
                window.location.href="writeoff.action?uid="+uid;
            }
        }

        function addr(){
            window.location.href="getAddressList.action"
        }

        function insertAddress(uid){
            var addrs = document.getElementById("addrs");

            var inputName = document.createElement("input");
            inputName.id='reciveName';
            inputName.type='text';
            inputName.name='reciveName';
            inputName.placeholder='请输入联系人';

            var inputPhone = document.createElement("input");
            inputPhone.id='phone';
            inputPhone.type='tel';
            inputPhone.name='phone';
            inputPhone.placeholder='请输入联系人电话';

            var inputAddr = document.createElement("input");
            inputAddr.id='address';
            inputAddr.type='text';
            inputAddr.name='address';
            inputAddr.placeholder='请输入联系人地址';

            var buttonSubmit = document.createElement("button");
            buttonSubmit.type='submit';
            buttonSubmit.className='layui-btn layui-btn-primary layui-btn-sm';
            buttonSubmit.textContent='提交';

            var div1 = document.createElement("div");
            div1.style.cssText='float: right';
            div1.appendChild(buttonSubmit);

            var div2 = document.createElement("div");
            div2.className='layui-card-header';
            div2.appendChild(inputName);
            div2.appendChild(inputPhone);
            div2.appendChild(div1);

            var div3 = document.createElement("div");
            div3.className='layui-card-body';
            div3.appendChild(inputAddr);

            var form = document.createElement("form");
            form.id='addform';
            form.action='insertaddress.action?uid='+uid;
            form.method='post';
            form.appendChild(div2);
            form.appendChild(div3);

            var div4 = document.createElement("div");
            div4.id='address-card';
            div4.className='layui-card';
            div4.appendChild(form);

            var div5 = document.createElement("div");
            div5.className='layui-col-md6';
            div5.appendChild(div4);

            addrs.appendChild(div5);
        }

        function editAddress(addrid){
            var inputName = document.getElementById("reciveName_"+addrid);
            inputName.style.cssText='border-width: 1px';
            inputName.readOnly=false;

            var inputPhone = document.getElementById("phone_"+addrid);
            inputPhone.style.cssText='border-width: 1px';
            inputPhone.readOnly=false;

            var inputAddr = document.getElementById("address_"+addrid);
            inputAddr.style.cssText='border-width: 1px';
            inputAddr.readOnly=false;

            var button1 = document.getElementById("button1_"+addrid);
            button1.style.cssText='float: right;display: none';

            var button2 = document.getElementById("button2_"+addrid);
            button2.style.cssText='float: right';
        }

        function deleteAddress(addrid){
            if(confirm('警告：删除将不可逆，请慎重考虑！！！请确认是否删除当前地址')){
                window.location.href="deleteaddress.action?addrid="+addrid;
            }
        }
    </script>
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/shopping/shopindex1.jsp">悦读书城</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
                <li><a href="#about">收藏夹</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/shopping/shoppingcart.jsp">购物车</a></li>
                <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/changeUserInfo.jsp">修改信息</a></li>
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/changePassword.jsp">修改密码</a></li>
                <li class="active"><a onclick="addr()" href="javascript:void(0)">我的地址</a></li>
                <li><a href="#">我的足迹</a></li>
                <li><a href="#">我的评论</a></li>
                <li><a onclick="url(${sessionScope.current_user.uid})" href="javascript:void(0)">注销账号</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <div class="layui-btn-group">
            <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="insertAddress(${sessionScope.current_user.uid})"><i class="layui-icon"></i></button>
        </div>
        <div class="layui-bg-gray" style="padding: 30px;">
            <div id="addrs" class="layui-row layui-col-space15">
                <c:forEach items="${sessionScope.current_addresses}" var="address">
                    <div class="layui-col-md6">
                        <div id="address-card" class="layui-card">
                            <form id="addrform" action="updateaddress.action?addrid=${address.addrId}" method="post">
                                <div class="layui-card-header">
<%--                                    <input id="addrid_${address.addrId}" type="text" name="addrid" value="${address.name}" readonly="readonly" style="border-width: 0px">--%>
                                    <input id="reciveName_${address.addrId}" type="text" name="reciveName" value="${address.name}" readonly="readonly" style="border-width: 0px">
                                    <input id="phone_${address.addrId}" type="tel" name="phone" value="${address.tel}" readonly="readonly" style="border-width: 0px">
                                    <div id="button1_${address.addrId}" class="layui-btn-group" style="float: right;display: block">
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="editAddress(${address.addrId})"><i class="layui-icon"></i></button>
                                        <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" onclick="deleteAddress(${address.addrId})"><i class="layui-icon"></i></button>
                                    </div>
                                    <div id="button2_${address.addrId}" class="layui-btn-group" style="float: right;display: none">
                                        <button type="submit" class="layui-btn layui-btn-primary layui-btn-sm">提交</button>
                                    </div>
                                </div>
                                <div class="layui-card-body">
                                    <input id="address_${address.addrId}" type="text" name="address" value="${address.addr}" readonly="readonly" style="border-width: 0px">
                                </div>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
