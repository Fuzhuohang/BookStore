<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>成员管理主页</title>
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
                <li class="layui-nav-item layui-nav-itemed">
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
        <form id="myform" class="layui-form ">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <input id="employee_num" type="text" placeholder="--员工编号--" class="layui-input">
                </div>
                <div class="layui-inline">
                    <input id="member_name" type="text" placeholder="--成员姓名--" class="layui-input">
                </div>
                <div class="layui-inline">
                    <input id="age" type="text" placeholder="--年龄--" class="layui-input" >
                </div>
                <div class="layui-inline">
                    <select id="sex">
                        <option value="">请选择性别</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="layui-inline">
                    <input id="relation" type="text" placeholder="--关系--" class="layui-input">
                </div>
                <div class="layui-inline">
                    <select id="health_status">
                        <option value="">请选择健康状况</option>
                        <option value="健康">健康</option>
                        <option value="亚健康">亚健康</option>
                        <option value="小病">小病</option>
                        <option value="大病">大病</option>
                    </select>
                </div>
                <div class="layui-inline">
                    <select id="work_status">
                        <option value="">请选择工作状况</option>
                        <option value="工作中">工作中</option>
                        <option value="未工作">未工作</option>
                    </select>
                </div>
            </div>
        </form>
        <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>
        <button id="btn_add" class="layui-btn layui-btn-normal">增加</button>
        <table id="tb_member" lay-filter="tb_member">
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 真岛建设 人事管理系统
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
<!--工具栏-->
<script type="text/html" id="mytoolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="member_edit">编辑</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="member_del">删除</button>
    </div>
</script>
<script>
    layui.use(['jquery','table'],function () {
        var table=layui.table;
        var $=layui.jquery;
        //渲染表格
        table.render({
            elem:"#tb_member",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getMemberListByPage.action",//请求的后台接口
            cols:[[//表头
                {field:'employee_id',title:'员工编号',width:120},
                {field:'member_name',title:'成员姓名',width:180},
                {field:'age',title:'年龄',width:180},
                {field:'sex',title:'性别',width:180},
                {field:'relation',title:'关系',width:180},
                {field:'health_status',title:'健康状况',width:180},
                {field:'work_status',title:'工作状况',width:180},
                {title:'操作',toolbar:'#mytoolbar',width:180}
            ]],
            page:true,//是否开启分页
        })
        $("#btn_search").on("click",function(){
            reloadMember();
        })

        $("#btn_add").on("click",function(){
            window.location.href="addmember.jsp";
        })
        //表格重载
        function reloadMember(){
            table.reload("tb_member",{
                page:{
                    curr:1//重新从第一页开始显示
                },
                where:{
                    employee_id:$("#employee_num").val(),
                    member_name:$("#member_name").val(),
                    age:$("#age").val(),
                    sex:$("#sex").val(),
                    relation:$("#relation").val(),
                    health_status:$("#health_status").val(),
                    work_status:$("#work_status").val()
                }
            },'data');
        }

        //监听表格的工具栏事件
        table.on("tool(tb_member)",function (obj) {
            var data=obj.data;
            if(obj.event=='member_edit'){
                modifyMember(data.employee_id,data.member_name,data.age,data.sex,data.relation,data.health_status,data.work_status);
            }
            if(obj.event=='member_del'){
                delMember(data.employee_id,data.member_name);
            }
        })

        //修改家庭成员信息
        function modifyMember(employee_id,member_name,age,sex,relation,health_status,work_status){
            url="modifymember.jsp?employee_id="+employee_id+"&member_name="+member_name+"&age="+age+"&sex="+sex+"&relation="+relation+"&health_status="+health_status+"&work_status="+work_status;
            window.location.href=url;
        }
        //删除家庭成员信息
        function delMember(employee_id,member_name){
            $.ajax({
                url:'${pageContext.request.contextPath}/delMember.action',
                type:'POST',
                data:{'employee_id':employee_id,'member_name':member_name},
                dataType:"JSON",
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("删除成功");
                        reloadMember();
                    }else {
                        alert(data.msg);
                    }
                },
                error:function(){
                    alert("hhh删除失败");
                }
            })
        }
    });
</script>
</body>
</html>
