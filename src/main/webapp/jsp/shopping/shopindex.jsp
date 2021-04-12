<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/8
  Time: 9:04
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
    <script>
        function fun(){
            window.location.href = "getCategory.action";
        }
        layui.use(['dropdown', 'util'], function(){
            var dropdown = layui.dropdown
                ,util = layui.util
                ,$ = layui.jquery;

            //菜单点击事件
            dropdown.on('click(demo1)', function(options){
                var thisElem = $(this);
                console.log(thisElem, options);
            });


            util.event('lay-active', {
                normal: function(){
                    $('#demo-box').children().addClass('layui-col-md3').removeClass('layui-col-md4');
                    $('#demo-box').find('.layui-menu').removeClass('layui-menu-lg');
                }
                ,lg: function(){
                    $('#demo-box').children().addClass('layui-col-md4').removeClass('layui-col-md3')
                    $('#demo-box').find('.layui-menu').addClass('layui-menu-lg');
                }
            });
        });
        layui.use(['carousel', 'form'], function(){
            var carousel = layui.carousel
                ,form = layui.form;

            //常规轮播
            carousel.render({
                elem: '#test1'
                ,arrow: 'always'
            });

            //改变下时间间隔、动画类型、高度
            carousel.render({
                elem: '#test2'
                ,interval: 1800
                ,anim: 'fade'
                ,height: '120px'
            });

            //设定各种参数
            var ins3 = carousel.render({
                elem: '#test3'
            });
            //图片轮播
            carousel.render({
                elem: '#test10'
                ,width: '778px'
                ,height: '440px'
                ,interval: 5000
            });

            //事件
            carousel.on('change(test4)', function(res){
                console.log(res)
            });

            var $ = layui.$, active = {
                set: function(othis){
                    var THIS = 'layui-bg-normal'
                        ,key = othis.data('key')
                        ,options = {};

                    othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                    options[key] = othis.data('value');
                    ins3.reload(options);
                }
            };

            //监听开关
            form.on('switch(autoplay)', function(){
                ins3.reload({
                    autoplay: this.checked
                });
            });

            $('.demoSet').on('keyup', function(){
                var value = this.value
                    ,options = {};
                if(!/^\d+$/.test(value)) return;

                options[this.name] = value;
                ins3.reload(options);
            });

            //其它示例
            $('.demoTest .layui-btn').on('click', function(){
                var othis = $(this), type = othis.data('type');
                active[type] ? active[type].call(this, othis) : '';
            });
        });
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/login.jsp">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/register.jsp">注册</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/login.jsp">收藏夹</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/login.jsp">购物车</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/login.jsp">订单</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/useraccount/login.jsp">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
    <div class="layui-row container" style="display: flex;margin-bottom: 10px">
        <div class="layui-col-xs3">&nbsp;</div>
        <div class="layui-col-xs6" style="display: flex">
            <input type="text" id="search" name="search" class="form-control" style="height: 38px">
            <button type="button" class="layui-btn" style="float:right;">搜索</button>
        </div>
        <div class="layui-col-xs3">&nbsp;</div>
    </div>
</nav>
<div>
    <div class="layui-row layui-col-space30" id="demo-box" style="margin: 0 auto; max-width: 970px;">
        <div class="layui-col-xs9 layui-col-md3">
            <div class="layui-panel">
                <ul class="layui-menu" id="demo1">
                    <c:forEach items="${sessionScope.current_category}" var="category">
                        <li class="layui-menu-item-parent" lay-options="{type: 'parent'}">
                            <div class="layui-menu-body-title" style="font-size: 5px">
                                ${category.cname}
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="layui-carousel" id="test1" lay-filter="test1">
        <div carousel-item="">
            <div>条目1</div>
            <div>条目2</div>
            <div>条目3</div>
            <div>条目4</div>
            <div>条目5</div>
        </div>
    </div>
</div>

</body>
</html>
