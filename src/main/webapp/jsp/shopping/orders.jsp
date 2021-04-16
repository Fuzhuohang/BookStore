<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LX
  Date: 2021/4/12
  Time: 15:12
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
    <script type="text/javascript">
        function url(uid,oid){
            if(confirm('警告：取消订单将不可逆，请慎重考虑！！！请确认是否取消订单')){
                window.location.href="deleteorders.action?uid="+uid+"&oid="+oid;
            }
        }
        layui.use('element', function(){
            var $ = layui.jquery
                ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

            //触发事件
            var active = {
                tabAdd: function(){
                    //新增一个Tab项
                    element.tabAdd('demo', {
                        title: '新选项'+ (Math.random()*1000|0) //用于演示
                        ,content: '内容'+ (Math.random()*1000|0)
                        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                }
                ,tabDelete: function(othis){
                    //删除指定Tab项
                    element.tabDelete('demo', '44'); //删除：“商品管理”


                    othis.addClass('layui-btn-disabled');
                }
                ,tabChange: function(){
                    //切换到指定Tab项
                    element.tabChange('demo', '22'); //切换到：用户管理
                }
            };

            $('.site-demo-active').on('click', function(){
                var othis = $(this), type = othis.data('type');
                active[type] ? active[type].call(this, othis) : '';
            });

            //Hash地址的定位
            var layid = location.hash.replace(/^#test=/, '');
            element.tabChange('test', layid);

            element.on('tab(test)', function(elem){
                location.hash = 'test='+ $(this).attr('lay-id');
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
                <a class="navbar-brand" href="gotoindex.action">悦读书城</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/jsp/personalspace/personalspace.jsp">欢迎！${sessionScope.current_user.username}</a></li>
                    <li><a href="logout.action">退出登录</a></li>
<%--                    <li><a href="#about">收藏夹</a></li>--%>
                    <li><a href="getshoppingcart.action?uid=${sessionScope.current_user.uid}">购物车</a></li>
                    <li class="active"><a href="getuserorders.action?uid=${sessionScope.current_user.uid}">订单</a></li>
                    <li><a href="entermybusiness.action?userId=${sessionScope.current_user.uid}">我的店铺</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</nav>
<div class="layui-row container">
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">待发货 <span class="layui-badge">${sessionScope.orders_count_user_state01}</span></li>
            <li>待收货 <span class="layui-badge">${sessionScope.orders_count_user_state02}</span></li>
            <li>已完成</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show">
                <div class="layui-bg-gray" style="padding: 30px;">
                    <div class="layui-row layui-col-space15">
                        <c:forEach items="${sessionScope.orders_list_user_state01}" var="orders">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <div style="display: flex; ">
                                            <div style="margin: 5px 10px 5px 5px; ">${orders.bname}</div>
                                            <div style="margin: 5px 5px 5px 10px; ">状态更新时间：${orders.time}</div>
                                        </div>
                                    </div>
                                    <div class="layui-card-body">
                                        <div style="display: flex; ">
                                            <div>
                                                <div style="margin: 5px 10px 5px 10px; "><h3>${orders.pname}</h3></div>
                                                <div style="margin: 5px 10px 5px 10px; ">商品数量：${orders.pnum}</div>
                                                <div style="margin: 5px 10px 5px 10px; ">订单总价：${orders.total}</div>
                                                <div style="margin: 5px 10px 5px 10px; display: flex; ">
                                                    <div>收货人信息：</div>
                                                    <div style="margin: 0 10px 0 0; ">${orders.name}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.tel}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.addr}</div>
                                                </div>
                                            </div>
                                            <div style="position: absolute; right: 0; padding:20px 50px; ">
                                                <button class="layui-btn layui-btn-primary layui-border-green" onclick="">提醒发货</button>
                                                <button class="layui-btn layui-btn-primary layui-border-green" onclick="url(${sessionScope.current_user.uid},${orders.oid})">取消订单</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-bg-gray" style="padding: 30px;">
                    <div class="layui-row layui-col-space15">
                        <c:forEach items="${sessionScope.orders_list_user_state02}" var="orders">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <div style="display: flex; ">
                                            <div style="margin: 5px 10px 5px 5px; ">${orders.bname}</div>
                                            <div style="margin: 5px 5px 5px 10px; ">状态更新时间：${orders.time}</div>
                                        </div>
                                    </div>
                                    <div class="layui-card-body">
                                        <div style="display: flex; ">
                                            <div>
                                                <div style="margin: 5px 10px 5px 10px; "><h3>${orders.pname}</h3></div>
                                                <div style="margin: 5px 10px 5px 10px; ">商品数量：${orders.pnum}</div>
                                                <div style="margin: 5px 10px 5px 10px; ">订单总价：${orders.total}</div>
                                                <div style="margin: 5px 10px 5px 10px; display: flex; ">
                                                    <div>收货人信息：</div>
                                                    <div style="margin: 0 10px 0 0; ">${orders.name}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.tel}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.addr}</div>
                                                </div>
                                            </div>
                                            <div style="position: absolute; right: 0; padding:20px 50px; ">
                                                <button class="layui-btn layui-btn-primary layui-border-green" onclick="window.location.href='upstateorderstateuser.action?uid=${sessionScope.current_user.uid}&oid=${orders.oid}&ostate=3'">确认收货</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="layui-bg-gray" style="padding: 30px;">
                    <div class="layui-row layui-col-space15">
                        <c:forEach items="${sessionScope.orders_list_user_state03}" var="orders">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <div style="display: flex; ">
                                            <div style="margin: 5px 10px 5px 5px; ">${orders.bname}</div>
                                            <div style="margin: 5px 5px 5px 10px; ">状态更新时间：${orders.time}</div>
                                        </div>
                                    </div>
                                    <div class="layui-card-body">
                                        <div style="display: flex; ">
                                            <div>
                                                <div style="margin: 5px 10px 5px 10px; "><h3>${orders.pname}</h3></div>
                                                <div style="margin: 5px 10px 5px 10px; ">商品数量：${orders.pnum}</div>
                                                <div style="margin: 5px 10px 5px 10px; ">订单总价：${orders.total}</div>
                                                <div style="margin: 5px 10px 5px 10px; display: flex; ">
                                                    <div>收货人信息：</div>
                                                    <div style="margin: 0 10px 0 0; ">${orders.name}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.tel}</div>
                                                    <div style="margin: 0 10px 0 10px; ">${orders.addr}</div>
                                                </div>
                                            </div>
                                            <div style="position: absolute; right: 0; padding:20px 50px; ">
                                                <button class="layui-btn layui-btn-primary layui-border-green" onclick="window.location.href='tocreatecomment.action?oid=${orders.oid}'">前往评价</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
