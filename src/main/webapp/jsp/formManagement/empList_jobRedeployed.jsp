<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>查看发生过岗位调动的员工</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <style>
        .app{
            font-size:30px;
            font-family:"微软雅黑";
        }
        .app1{
            font-size:20px;
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

                </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div id="d" class="app"></div><%--网页上方大字的位置--%>
        <script>
            document.getElementById("d").innerHTML=" 发生过岗位调动的员工信息：";/*写入网页上方大字*/
        </script>
        <div id="tmp" class="app1"></div>
        <script>
            document.getElementById("tmp").innerHTML="       请输入调动的时间范围进行查询";
        </script>
        <div class="layui-form-item">
            <div class="layui-inline">
                <input id="stime" type="text" placeholder="--查询的开始日期--" class="layui-input" >
            </div>
            <div class="layui-inline">
                <input id="etime" type="text" placeholder="--查询的结束日期--" class="layui-input" >
            </div>
            <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>
            <button type="button" lay-submit="" class="layui-btn layui-btn-warm" id="exportExcel" name="exportExcel">
                <i class="layui-icon"></i>导出Excel</button>
        </div>

        <table id="tb_ejr" lay-filter="tb_ejr">
        </table>

        <a href="#" class="layui-btn layui-btn-primary" onClick="history.go(-1);">
            返回报表选择界面</a>
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
            elem: '#stime'
        });
        laydate.render({
            elem: '#etime'
        });
    });
</script>
<script>
    layui.use(['jquery','table'],function(){

        var table = layui.table;
        var $ = layui.jquery;

        //渲染表格
        table.render({
            elem:"#tb_ejr",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getJobRedeployedEList.action",//请求后台的接口
            cols:[[//表头
                {field:'employee_id', title:'员工编号', width:'100'},
                {field:'employee_name', title:'姓名', width:'90'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'200'},
                {field:'address', title:'地址', width:'120'},
                {field:'job_id', title:'所属岗位编号', width:'140'},
                {field: 'update_time', title: '入职时间', width: '120'},
                {field: 'deptOrJobNow', title: '当前岗位名', width: '120'},
                {field: 'deptOrJobBefore', title: '先前岗位名', width: '120'},
                {field: 'reason', title: '岗位调动原因', width: '180'}
            ]],
            page:false//是否开启分页
        });

        $("#btn_search").on("click",function(){
            reloadEmp();
        })

        //表格重载
        function reloadEmp(){
            table.reload("tb_ejr", {
                where: {
                    start_time:$("#stime").val(),
                    end_time: $("#etime").val()
                }
            },'data');
        }
    });

</script>
<script>
    layui.config({
        base: '../../layui/layui_exts/',
    }).extend({
        excel: 'excel',
    });
    layui.use(['jquery', 'excel', 'layer'], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var excel = layui.excel;
        $('#exportExcel').on('click', function() {
            // 模拟从后端接口读取需要导出的数据
            $.ajax({
                url: "${pageContext.request.contextPath}/getDeptRedeployedEList.action"
                , dataType: 'json'
                , success(res) {
                    var data = res.data;
                    // 重点！！！如果后端给的数据顺序和映射关系不对，请执行梳理函数后导出
                    data = excel.filterExportData(data, [
                        'employee_id'
                        , 'employee_name'
                        , 'sex'
                        , 'age'
                        , 'weight'
                        , 'height'
                        , 'phone'
                        , 'mail'
                        , 'address'
                        , 'job_id'
                        , 'update_time'
                        , 'deptOrJobBefore'
                        , 'deptOrJobBefore'
                        , 'reason'
                    ]);
                    // 重点2！！！一般都需要加一个表头，表头的键名顺序需要与最终导出的数据一致
                    data.unshift({
                        employee_id: "员工ID",
                        employee_name: "员工姓名",
                        sex: '性别',
                        age: '年龄',
                        weight: '体重',
                        height: '身高',
                        phone: '联系电话',
                        mail: '邮箱',
                        address: '住址',
                        job_id: '岗位编号',
                        update_time: '入职时间',
                        deptOrJobBefore: '现任岗位',
                        deptOrJobBefore: '原岗位名',
                        reason: '调动原因'
                    });

                    var timestart = Date.now();
                    excel.exportExcel(data, '岗位调动员工名单.xlsx', 'xlsx');
                    var timeend = Date.now();

                    var spent = (timeend - timestart) / 1000;
                    layer.alert('导出耗时 ' + spent + ' s');
                }
                , error() {
                    layer.alert('获取数据失败，请检查是否部署在本地服务器环境下');
                }
            });
        });
    });
</script>
</html>
