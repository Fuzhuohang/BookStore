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
                <li class="layui-nav-item layui-nav-itemed">
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

                <li class="layui-nav-item layui-nav-itemed">
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
                <li class="layui-nav-item">
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
                <input id="res_id" type="text" placeholder="--编号--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="res_name" type="text" placeholder="--姓名--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="sex" type="text" placeholder="--性别--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="age" type="text" placeholder="--年龄--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="weight" type="text" placeholder="--体重--" class="layui-input" style="width: 100px">
            </div>
            <div class="layui-inline">
                <input id="height" type="text" placeholder="--身高--" class="layui-input" style="width: 100px">
            </div>

            <%--            <div class="layui-inline">--%>
            <%--                <input id="phone" type="text" placeholder="--电话号码--" class="layui-input" style="width: 100px">--%>
            <%--            </div>--%>

            <%--            <div class="layui-inline">--%>
            <%--                <input id="mail" type="text" placeholder="--邮箱--" class="layui-input" style="width: 100px">--%>
            <%--            </div>--%>

            <%--            <div class="layui-inline">--%>
            <%--                <input id="address" type="text" placeholder="--地址--" class="layui-input" style="width: 100px">--%>
            <%--            </div>--%>

            <div class="layui-inline">
                <input id="resigned_time"  type="text" placeholder="--离职时间--" class="layui-input" style="width: 200px">
            </div>

            <button id="btn_search" class="layui-btn layui-btn-normal" >查询</button>
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

<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#resigned_time' //指定元素
        });
    });
</script>

<script type="text/html" id="mytoolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</button>
    </div>
</script>

<script>
    layui.use(['jquery', 'table'], function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem:"#tb",
            limit:10,
            url:"${pageContext.request.contextPath}/getResEmpList.action",
            cols:[[
                {field:'res_id', title:'编号', width:'100'},
                {field:'res_name', title:'姓名', width:'80'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'120'},
                {field:'resigned_time', title:'离职时间', width:'120'},
                {field:'resigned_reason', title:'离职原因', width:'200'},
                {title:'操作',toolbar:'#mytoolbar',width:60}
            ]],
            page:true
        });

        $("#btn_search").on("click",function(){
            reload();
        })


        //表格重载
        function reload(){
            if($("#resigned_time").val()==""){
                table.reload("tb",{
                    page:{
                        curr:1//重新从第一页开始显示
                    },
                    url: "${pageContext.request.contextPath}/getResEmpList.action",
                    where:{
                        res_id:function(){
                            if($("#res_id").val()=="")
                                return 0;
                            else
                                return $("#res_id").val();
                        },
                        res_name:$("#res_name").val(),
                        sex:$("#sex").val(),
                        age:function(){
                            if($("#age").val()=="")
                                return 0;
                            else
                                return $("#age").val();
                        },
                        weight:function () {
                            if($("#weight").val()=="")
                                return 0;
                            else
                                return $("#weight").val();
                        },
                        height:function () {
                            if($("#height").val()=="")
                                return 0;
                            else
                                return $("#height").val();
                        }
                    }
                },'data');
            }
            else{
                table.reload("tb",{
                    page:{
                        curr:1//重新从第一页开始显示
                    },
                    url: "${pageContext.request.contextPath}/getResList.action",
                    where:{
                        res_id:function(){
                            if($("#res_id").val()=="")
                                return 0;
                            else
                                return $("#res_id").val();
                        },
                        pro_name:$("#res_name").val(),
                        sex:$("#sex").val(),
                        age:function(){
                            if($("#age").val()=="")
                                return 0;
                            else
                                return $("#age").val();
                        },
                        weight:function () {
                            if($("#weight").val()=="")
                                return 0;
                            else
                                return $("#weight").val();
                        },
                        height:function () {
                            if($("#height").val()=="")
                                return 0;
                            else
                                return $("#height").val();
                        },
                        end_time:$("#resigned_time")                    }
                },'data');
            }
        }

        table.on('tool(tb)',function (obj) {
            var data = obj.data;
            del(data.res_id);
        });

        function del(id){
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteResEmp.action",
                type:"POST",
                data:{'res_id':id},
                dataType:'JSON',
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("删除成功!");
                        //重载表格
                        reload();
                    }else{
                        alert(data.msg);
                    }
                } ,
                error:function () {
                    alert("删除失败.");
                }
            });
        }

    });
</script>
</html>
