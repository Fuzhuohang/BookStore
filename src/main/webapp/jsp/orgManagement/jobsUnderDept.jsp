<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<script>
    function GetQueryValue(queryName) {//提取url中对应字段值的函数
        var query = decodeURI(window.location.search.substring(1));
        var vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == queryName) {
                return pair[1];
            }
        }
        return null;
    }
</script>
<head>
    <meta charset="utf-8">
    <title>查看此部门的下属岗位</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <style>
        .app{
            font-size:30px;
            font-family:"微软雅黑";
        }
    </style>
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
            var d =GetQueryValue("dept_name");
            document.getElementById("d").innerHTML=d+" 部门下的所有岗位信息：";/*写入网页上方大字*/
        </script>
        <table id="tb_jobsUnderD" lay-filter="tb_jobsUnderD">
        </table>
        <a href="#" class="layui-btn layui-btn-primary" onClick="history.go(-1);">
            返回部门信息列表</a>
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

<script type="text/html" id="mytoolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="empsUnderJob">查看下属员工</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="job_edit">编辑</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="job_del">删除</button>
    </div>
</script>

<script>
    layui.use(['jquery','table'],function(){

        var table = layui.table;
        var $ = layui.jquery;

        //渲染表格
        table.render({
            elem:"#tb_jobsUnderD",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getJobsOfOneDept.action?dept_id="+ GetQueryValue("dept_id"),//请求后台的接口
            cols:[[//表头
                {field:'job_id',title:'岗位编号',width:120},
                {field:'job_name',title:'岗位名',width:150},
                {field:'content',title:'工作内容描述',width:450},
                {field:'dept_id',title:'所属部门编号',width:120},
                {field:'salary',title:'岗位月薪',width:100},
                {title:'操作',toolbar:'#mytoolbar',width:270}
            ]],
            page:true//是否开启分页
        });

        /*        $("#btn_search").on("click",function () {
                    reloadJob();
                });*/

        //表格的重载
        function reloadJob(){
            table.reload("tb_jobsUnderD",{
                page:{
                    curr:1 //重新从第1页显示
                },
                where:{
                }
            },'data');
        }
        //监听表格的工具栏的事件
        table.on('tool(tb_jobsUnderD)',function (obj) {
            var data = obj.data;
            if(obj.event == 'job_edit'){
                modifyJob(data.job_id,data.job_name,data.content,data.dept_id,data.salary);
            }else if(obj.event == 'job_del'){
                delJob(data.job_id);
            }else if(obj.event =='empsUnderJob'){
                empsUnderJob(data.job_id,data.job_name);
            }
        });

        //编辑岗位信息
        function modifyJob(job_id, job_name, content, dept_id, salary) {
            url="${pageContext.request.contextPath}/jsp/orgManagement/modifyJob.jsp?job_id="+ job_id
                +"&job_name="+job_name+"&content="+content+"&dept_id="+dept_id+"&salary="+salary;
            window.location.href=url;
        }

        //删除岗位信息
        function delJob(job_id){
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteJob.action",
                type:"POST",
                data:{'job_id_param':job_id},
                dataType:'JSON',
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("删除成功!");
                        //重载表格
                        reloadJob();
                    }else{
                        alert(data.msg);
                    }
                } ,
                error:function () {
                    alert("删除失败.")
                }
            });
        }

        //前往查看一个岗位下属员工列表的界面
        function empsUnderJob(job_id, job_name) {
            url="${pageContext.request.contextPath}/jsp/orgManagement/empsUnderJob.jsp?job_id="+ job_id
                +"&job_name="+job_name;
            window.location.href=url;
        }
    });

</script>

</html>
