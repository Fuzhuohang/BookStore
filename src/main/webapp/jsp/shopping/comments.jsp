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
    <div class="layui-bg-gray" style="padding: 30px;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">
                        <div style="display: flex; ">
                            <div style="margin: 5px 10px 5px 5px; ">${sessionScope.comment_orders.bname}</div>
                            <div style="margin: 5px 5px 5px 10px; ">状态更新时间：${sessionScope.comment_orders.time}</div>
                        </div>
                    </div>
                    <div class="layui-card-body">
                        <div style="display: flex; ">
                            <div>
                                <div style="margin: 5px 10px 5px 10px; "><h3>${sessionScope.comment_orders.pname}</h3></div>
                                <div style="margin: 5px 10px 5px 10px; ">商品数量：${sessionScope.comment_orders.pnum}</div>
                                <div style="margin: 5px 10px 5px 10px; ">订单总价：${sessionScope.comment_orders.total}</div>
                                <div style="margin: 5px 10px 5px 10px; display: flex; ">
                                    <div>收货人信息：</div>
                                    <div style="margin: 0 10px 0 0; ">${sessionScope.comment_orders.name}</div>
                                    <div style="margin: 0 10px 0 10px; ">${sessionScope.comment_orders.tel}</div>
                                    <div style="margin: 0 10px 0 10px; ">${sessionScope.comment_orders.addr}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form class="layui-form" action="addcomment.action?uid=${sessionScope.comment_orders.uid}&pid=${sessionScope.comment_orders.pid}" method="post">
        <div>
            <label class="layui-form-label">评分：</label>
            <div id="score"></div>
            <input id="getscore" name="score" style="display: none;">
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">评论：</label>
            <div class="layui-input-block">
                <textarea id="comm" name="comm" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>
<script>
    function fun(){
        var score = document.getElementById("score").value;
        console.log(score);
    }
    layui.use(['rate', 'form', 'layedit', 'laydate'], function(){
        var rate = layui.rate;
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        rate.render({
            elem: '#score'
            ,value: 0
            ,half: true
            ,text: true
            ,choose:function (value) {
                document.getElementById("getscore").value = value;
            }
        })

        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
</body>
</html>
