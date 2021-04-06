<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>部门管理</title>
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
                <li class="layui-nav-item layui-nav-itemed">
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
        <div id="d" class="app"></div><%--网页上方大字的位置--%>
        <script>
            document.getElementById("d").innerHTML=" 部门信息列表：";/*写入网页上方大字*/
        </script> <br>
        <div class="layui-form-item">
            <div class="layui-inline">
                <input id="dept_id_input" type="text" placeholder="--部门编号--" class="layui-input">
            </div>

            <div class="layui-inline">
                <input id="dept_name_input" type="text" placeholder="--部门名称--" class="layui-input">
            </div>

            <div class="layui-inline">
                <input id="dept_loc_input" type="text" placeholder="--所在地--" class="layui-input">
            </div>
            <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>
        </div>

        <table id="tb_dept" lay-filter="tb_dept"></table>

        <a href="${pageContext.request.contextPath}/jsp/orgManagement/addDept.jsp" class="layui-btn  layui-btn-lg layui-btn-primary">添加新部门</a>

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

<script type="text/html" id="deptstatus_tpl">
    {{#  if(d.dept_id <= 6){ }}
    核心部门
    {{#  } else { }}
    一般部门
    {{#  } }}
</script>
<script type="text/html" id="toolbar1">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="jobsUnderDept">查看下属岗位</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="dept_edit">编辑</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="dept_del">删除</button>
    </div>
</script>
<script type="text/html" id="toolbar2">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn layui-btn-radius" lay-event="newEmp">查询本部门新入职员工</button>
        <button class="layui-btn layui-btn-sm layui-btn layui-btn-radius" lay-event="resEmp">查询本部门离职员工</button>
    </div>
</script>
<script>
    layui.use(['jquery','table'],function(){

        var table = layui.table;
        var $ = layui.jquery;
        //渲染表格
        table.render({
            elem:"#tb_dept",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getDeptListByPage.action",//请求后台的接口
            cols:[[//表头
                {field:'dept_id',title:'部门编号',width:120},
                {field:'dept_name',title:'部门名',width:180},
                {field:'dept_loc',title:'所在地',width:180},
                {field:'dept_id',title:'部门属性',templet:"#deptstatus_tpl",width:180},
                {title:'操作',toolbar:'#toolbar1',width:250},
                {title:'本部门员工入离职情况查询',toolbar:'#toolbar2',width:320}
            ]],
            page:true//是否开启分页
        });

        $("#btn_search").on("click",function () {
            reloadDept();
        });

        //表格的重载
        function reloadDept(){
            table.reload("tb_dept",{
                page:{
                    curr:1 //重新从第1页显示
                },
                where:{
                    dept_id:$("#dept_id_input").val(),
                    dept_name:$("#dept_name_input").val(),
                    dept_loc:$("#dept_loc_input").val()
                }
            },'data');
        }
        //监听表格的工具栏的事件
        table.on('tool(tb_dept)',function (obj) {

            var data = obj.data;
            if(obj.event == 'dept_edit'){
                modifyDept(data.dept_id,data.dept_name,data.dept_loc);
            }else if(obj.event == 'dept_del'){
                delDept(data.dept_id);
            }else if(obj.event== 'jobsUnderDept'){
                jobsUnderDept(data.dept_id,data.dept_name);
            }else if(obj.event== 'newEmp'){
                newEmp(data.dept_id, data.dept_name);
            }else if(obj.event== 'resEmp'){
                resEmp(data.dept_id, data.dept_name);
            }
        });

        //前往编辑部门信息界面
        function modifyDept(dept_id, dept_name, dept_loc) {
            url="${pageContext.request.contextPath}/jsp/orgManagement/modifyDept.jsp?dept_id="+ dept_id
                +"&dept_name="+dept_name+"&dept_loc="+dept_loc;
            window.location.href=url;
        }

        //删除部门信息
        function delDept(dept_id){
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteDept.action",
                type:"POST",
                data:{'dept_id_param':dept_id},
                dataType:'JSON',
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("删除成功!");
                        //重载表格
                        reloadDept();
                    }else{
                        alert(data.msg);
                    }
                } ,
                error:function () {
                    alert("删除失败.")
                }
            });
        }

        //前往查看一个部门下属岗位列表的界面
        function jobsUnderDept(dept_id, dept_name) {
            url="${pageContext.request.contextPath}/jsp/orgManagement/jobsUnderDept.jsp?dept_id="+ dept_id
                +"&dept_name="+dept_name;
            window.location.href=url;
        }
        //前往查看一个部门一定时间段内新入职员工的界面
        function newEmp(dept_id, dept_name) {
            url="${pageContext.request.contextPath}/jsp/formManagement/empListInOneDept_new.jsp?dept_id="+ dept_id
                +"&dept_name="+dept_name;
            window.location.href=url;
        }
        //前往查看一个部门一定时间段内离职员工的界面
        function resEmp(dept_id, dept_name) {
            url="${pageContext.request.contextPath}/jsp/formManagement/empListInOneDept_resigned.jsp?dept_id="+ dept_id
                +"&dept_name="+dept_name;
            window.location.href=url;
        }
    });
</script>
</html>
