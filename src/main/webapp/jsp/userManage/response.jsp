<%--
  Created by IntelliJ IDEA.
  User: Ai
  Date: 2020/6/13
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>人事管理系统v1.0</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">PSM 人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <font>${current_user.user_name}</font>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/baseMessage.jsp">基本资料</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/changePassword.jsp">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}//logout.action">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" lay-shrink="all">

                <!--组织结构管理模块-->
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">组织结构管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/jsp/orgManagement/dept.jsp">部门信息管理</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/jsp/orgManagement/job.jsp">岗位信息管理</a></dd>
                    </dl>
                </li>

                <!--人事信息管理模块-->
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">人事信息管理</a>
                    <dl class="layui-nav-child">

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/personManage/talMain.jsp">人才库管理</a></li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:">试用期管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/jsp/personManage/proMain.jsp">试用期员工列表</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/jsp/personManage/proTurn.jsp">查询已转正员工</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a class="" href="javascript:;">员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/jsp/personManage/empMain.jsp">操作</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/jsp/personManage/empHavingChanged.jsp">已调动岗位员工查询</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/jsp/personManage/resMain.jsp">已离职员工查询</a></dd>
                    </dl>
                </li>

                </dl>
                </li>

                <!--员工信息管理模块-->
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">员工信息管理</a>
                    <dl class="layui-nav-child">

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/empInfoManage/careerlistpageM.jsp">职业生涯信息维护</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/empInfoManage/languageinfolistpageM.jsp">外语能力信息维护</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/empInfoManage/memberlistpageM.jsp">家庭成员维护</a></li>

                </dl>
                </li>

                <!--报表管理模块-->
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">报表管理</a>
                    <dl class="layui-nav-child">

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/formManagement/empList_deptRedeployed.jsp">部门调动员工</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/formManagement/empList_jobRedeployed.jsp">岗位调动员工</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/formManagement/personnelReport.jsp">人事月报</a></li>

                </dl>
                </li>

                <!--用户管理-->
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">

                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/userManage/userMain.jsp">用户列表</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/userManage/response.jsp">待办事项</a></li>

                </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-form-item" style="margin-top: 10px">
            <div class="layui-inline">
                <input id="request_id" type="text" placeholder="--编号--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="user_name" type="text" placeholder="--用户名--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="account" type="text" placeholder="--账号--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="password" type="text" placeholder="--密码--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="request_type" type="text" placeholder="--请求类型--" class="layui-input" style="width: 100px">
            </div>

            <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>

        </div>
        <table id="tb"  lay-filter="tb"></table>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function() {
        var element = layui.element;

    });

</script>

<script type="text/html" id="mytoolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="agree">同意</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="disagree">驳回并删除</button>
    </div>
</script>

<script>
    layui.use(['jquery', 'table'], function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem:"#tb",
            limit:10,
            url:"${pageContext.request.contextPath}/response.action",
            cols:[[
                {field:'request_id', title:'编号', width:'80'},
                {field:'user_name', title:'用户名', width:'80'},
                {field:'account', title:'账号', width:'180'},
                {field:'password', title:'密码', width:'180'},
                {field:'authority', title:'权限', width:'180'},
                {field:'request_type', title:'请求类型', width:'120'},
                {field:'request_time', title:'请求时间', width:'120'},
                {title:'操作',toolbar:'#mytoolbar',width:180}
            ]],
            page:true
        });

        $("#btn_search").on("click",function(){
            reload();
        })

        //表格重载
        function reload(){
            table.reload("tb",{
                page:{
                    curr:1//重新从第一页开始显示
                },
                url: "${pageContext.request.contextPath}/response.action",
                where:{
                    request_id:function(){
                        if($("#request_id").val()=="")
                            return 0;
                        else
                            return $("#request_id").val();
                    },
                    user_name:$("#user_name").val(),
                    password:$("#password").val(),
                    account:$("#account").val(),
                    request_type:$("#request_type").val()
                }
            },'data');
        }

        table.on('tool(tb)',function (obj) {

            var data = obj.data;
            if(obj.event == 'agree'){
                agree(data.request_id);
            }else if(obj.event == 'disagree'){
                disagree(data.request_id);
            }
        });

        function agree(id){
            $.ajax({
                url:"${pageContext.request.contextPath}/agree.action",
                type:"POST",
                data:{'id':id},
                dataType:'JSON',
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("请求处理成功!");
                        //重载表格
                        reload();
                    }else{
                        alert(data.msg);
                    }
                } ,
                error:function () {
                    alert("请求处理失败.");
                }
            });
        }

        function disagree(id){
            $.ajax({
                url:"${pageContext.request.contextPath}/disagree.action",
                type:"POST",
                data:{'id':id},
                dataType:'JSON',
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("驳回请求成功!");
                        //重载表格
                        reload();
                    }else{
                        alert(data.msg);
                    }
                } ,
                error:function () {
                    alert("驳回请求失败.");
                }
            });
        }

    });
</script>
</html>

