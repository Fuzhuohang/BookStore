<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/12
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>${sessionScope.current_business.bname}-悦读书城</title>
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
    <script type="text/javascript" language="JavaScript">
        function url(uid){
            if(confirm('警告：关停店铺将不可逆，请慎重考虑！！！请确认是否关停店铺')){
                window.location.href="deletebusiness.action?uid="+uid;
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
            <a class="navbar-brand" href="gotoindex.action">悦读书城</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                <li><a href="logout.action">退出登录</a></li>
<%--                <li><a href="#about">收藏夹</a></li>--%>
                <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
                <li><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                <li class="active"><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" >
            <ul class="nav nav-sidebar">
                <li><a href="mybusiness.jsp">店铺信息</a></li>
                <li><a href="changeBusinessInfo.jsp">修改信息</a></li>
                <li class="active"><a href="enterbusinessproduct.action?bid=${sessionScope.current_business.bid}">全部商品</a></li>
                <li><a href="getbusinessorders.action?bid=${sessionScope.current_business.bid}">订单详情</a></li>
                <li><a onclick="url(${sessionScope.current_business.uid})" href="javascript:void(0)">关停店铺</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" >
        <span class="layui-breadcrumb">
            <a href="${pageContext.request.contextPath}/jsp/business/businessProducts.jsp">我的店铺</a>
            <a><cite>修改商品信息</cite></a>
        </span>
        <form class="layui-form" style="margin-top: 15px;" action="editproduct02.action?bid=${sessionScope.current_business.bid}&pid=${sessionScope.product_info.pid}" method="post">
            <div class="layui-form-item">
                <label for="pname" class="layui-form-label">商品名称：</label>
                <div class="layui-input-block">
                    <input type="text" id="pname" name="pname" lay-verify="title" autocomplete="off" placeholder="请输入商品名称" value="${sessionScope.product_info.pname}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="price" class="layui-form-label">商品价格：</label>
                <div class="layui-input-block">
                    <input type="number" step="0.01" id="price" name="price" lay-verify="title" autocomplete="off" placeholder="请输入商品单价" value="${sessionScope.product_info.price}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="pnum" class="layui-form-label">商品库存：</label>
                <div class="layui-input-block">
                    <input type="number" id="pnum" name="pnum" lay-verify="title" autocomplete="off" placeholder="请输入商品库存" value="${sessionScope.product_info.pnum}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label for="pdesc" class="layui-form-label">商品描述：</label>
                <div class="layui-input-block">
                    <textarea id="pdesc" name="pdesc" placeholder="请具体描述商品信息" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">书籍分类：</label>
                <div class="layui-input-block">
                    <select name="csid">
                        <option value="0">------请选择------</option>
                        <c:forEach items="${sessionScope.current_categorysecond}" var="categorysecond">
                            <option value="${categorysecond.csid}">${categorysecond.csname}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    document.getElementById("pdesc").value=${sessionScope.product_info.pdesc};
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length == 0){
                    return '书名不能为空';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            <%--window.location.href="addproduct.action?bid=${sessionScope.current_business.bid}&pname="+pname+"&price="+price+"&pnum="+pnum+"&pdesc="+pdesc+"&csid="+csid;--%>
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            form.val('example', {
                "username": "贤心" // "name": "value"
                ,"password": "123456"
                ,"interest": 1
                ,"like[write]": true //复选框选中状态
                ,"close": true //开关状态
                ,"sex": "女"
                ,"desc": "我爱 layui"
            });
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</body>
