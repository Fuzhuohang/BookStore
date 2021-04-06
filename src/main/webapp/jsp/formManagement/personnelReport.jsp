<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset="utf-8">
    <title>人事月报界面</title>
    <script src="../../js/jquery-3.5.1.min.js"></script>
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
                <li class="layui-nav-item layui-nav-itemed">
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
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/jsp/formManagement/personnelReport.jsp">人事月报</a></li>

                </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div id="d" class="app"></div><%--网页上方大字的位置--%>
        <script>
            document.getElementById("d").innerHTML=" 人事月报：";/*写入网页上方大字*/
        </script>
        <div id="tmp" class="app1"></div>
        <script>
            document.getElementById("tmp").innerHTML="       请输入月份，以查询当月的人事月报";
        </script>
        <div class="layui-form-item">
            <div class="layui-inline">
                <input id="month" type="text" placeholder="--查询的月份--" class="layui-input" >
            </div>
            <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>
            <button type="button" lay-submit="" class="layui-btn layui-btn-warm" id="exportExcel" name="exportExcel">
                <i class="layui-icon"></i>导出Excel</button>
        </div><br>

        <div id="rdp" class="app2"></div>
        <script>
            document.getElementById("rdp").innerHTML="  员工调动信息：";
        </script>
        <table id="tb_rdp" lay-filter="tb_rdp">
        </table><br><br>

        <div id="sj" class="app2"></div>
        <script>
            document.getElementById("sj").innerHTML="  员工入职信息：";
        </script>
        <table id="tb_sj" lay-filter="tb_sj">
        </table><br><br>

        <div id="res" class="app2"></div>
        <script>
            document.getElementById("res").innerHTML="  员工离职信息：";
        </script>
        <table id="tb_res" lay-filter="tb_res">
        </table><br><br>


        <a href="#" class="layui-btn layui-btn-primary" onClick="history.go(-1);">
            返回上一页</a>
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

<script>
    layui.use(['form','laydate'], function(){
        var form = layui.form ;
        $ = layui.jquery ;
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#month'
            ,type: 'month'
            ,theme: 'grid'
        });
    });
</script>
<script>
    layui.use(['jquery','table'],function(){

        var table = layui.table;
        var $ = layui.jquery;

        //渲染表格
        table.render({
            elem:"#tb_rdp",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getPersonnel_redplyInfo.action",//请求后台的接口
            cols:[[//表头
                {field:'employee_id', title:'员工编号', width:'130'},
                {field:'employee_name', title:'姓名', width:'120'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'200'},
                {field:'address', title:'地址', width:'120'},
                {field:'job_id', title:'所属岗位编号', width:'140'},
                {field: 'update_time', title: '入职时间', width: '120'},
                {field: 'description', title: '调动信息描述', width: '370'},
                {field: 'reason', title: '调动原因', width: '185'}
            ]],
            page:false//是否开启分页
        });
        table.render({
            elem:"#tb_sj",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getPersonnel_startJobInfo.action",//请求后台的接口
            cols:[[//表头
                {field:'employee_id', title:'员工编号', width:'130'},
                {field:'employee_name', title:'姓名', width:'120'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'200'},
                {field:'address', title:'地址', width:'120'},
                {field:'job_id', title:'所属岗位编号', width:'140'},
                {field:'time', title: '入职时间', width: '120'},
                {field:'reason', title: '入职原因', width:'560'}
            ]],
            page:false//是否开启分页
        });
        table.render({
            elem:"#tb_res",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getPersonnel_resInfo.action",//请求后台的接口
            cols:[[//表头
                {field:'res_id', title:'离职员工原编号', width:'130'},
                {field:'res_name', title:'离职员工姓名', width:'120'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'200'},
                {field:'address', title:'地址', width:'120'},
                {field:'job_before_id', title:'离职前岗位', width:'140'},
                {field:'time', title: '离职时间', width: '120'},
                {field:'description', title: '离职信息描述', width: '340'},
                {field:'reason', title: '离职原因', width: '220'}
            ]],
            page:false//是否开启分页
        });

        $("#btn_search").on("click",function(){
            reload();
        })
        //表格重载
        function reload(){
            table.reload("tb_rdp", {
                where: {
                    month:$("#month").val()
                }
            },'data');
            table.reload("tb_sj", {
                where: {
                    month:$("#month").val()
                }
            },'data');
            table.reload("tb_res", {
                where: {
                    month:$("#month").val()
                }
            },'data');
        }
    });

</script>

</html>
