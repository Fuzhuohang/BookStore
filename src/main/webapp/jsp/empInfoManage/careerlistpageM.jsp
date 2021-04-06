<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>职业生涯信息管理主页</title>
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
        <div class="layui-form-item">
            <div class="layui-inline">
                <input id="employee_num" type="text" placeholder="--员工编号--" class="layui-input">
            </div>
            <div class="layui-inline">
                <input id="position" type="text" placeholder="--职位--" class="layui-input">
            </div>
            <div class="layui-inline">
                <input id="stime" type="text" placeholder="--入职时间--" class="layui-input" >
            </div>
            <div class="layui-inline">
                <input id="ftime" type="text" placeholder="--离职时间--" class="layui-input" >
            </div>
            <div class="layui-inline">
                <input id="resigned_reason" type="text" placeholder="--离职原因--" class="layui-input">
            </div>
            <div class="layui-inline">
                <input id="salary" type="text" placeholder="--薪资--" class="layui-input">
            </div>
            <div class="layui-inline">
                <input id="company" type="text" placeholder="--公司--" class="layui-input">
            </div>
            <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>
            <button id="btn_add" class="layui-btn layui-btn-normal">增加</button>

        </div>

        <table id="tb_career" lay-filter="tb_career">
        </table>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 真岛建设 人事管理系统
    </div>
</div>

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
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="career_edit">编辑</button>
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="career_del">删除</button>
    </div>
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#stime' //指定元素
        });
        laydate.render({
            elem: '#ftime' //指定元素
        });
    });
</script>
<script>
    layui.use(['jquery','table'],function () {
        var table=layui.table;
        var $=layui.jquery;
        //渲染表格
        table.render({
            elem:"#tb_career",//渲染的表格的id
            url:"${pageContext.request.contextPath}/getCareerListByPage.action",//请求的后台接口
            cols:[[//表头
                {field:'employee_id',title:'员工编号',width:120},
                {field:'position',title:'职位名称',width:180},
                {field:'stime',title:'入职时间',width:180},
                {field:'ftime',title:'离职时间',width:180},
                {field:'resigned_reason',title:'离职原因',width:180},
                {field:'salary',title:'薪资',width:180},
                {field:'company',title:'公司',width:180},
                {title:'操作',toolbar:'#mytoolbar',width:180}
            ]],
            page:true,//是否开启分页
        })
        $("#btn_search").on("click",function(){
            reloadCareer();
        })
        $("#btn_add").on("click",function(){
            window.location.href="addcareer.jsp";
        })
        //表格重载
        function reloadCareer(){
            table.reload("tb_career",{
                page:{
                    curr:1//重新从第一页开始显示
                },
                where:{
                    employee_id:$("#employee_num").val(),
                    position:$("#position").val(),
                    stime:$("#stime").val(),
                    ftime:$("#ftime").val(),
                    resigned_reason:$("#resigned_reason").val(),
                    salary:$("#salary").val(),
                    company:$("#company").val()
                }
            },'data');
        }
        layui.config({
            base: 'layui/layui_exts/',
        }).extend({
            excel: 'excel',
        });

        //监听表格的工具栏事件
        table.on("tool(tb_career)",function (obj) {
            var data=obj.data;
            if(obj.event=='career_edit'){
                modifyCareer(data.employee_id,data.position,data.stime,data.ftime,data.resigned_reason,data.salary,data.company);
            }
            if(obj.event=='career_del'){
                delCareer(data.employee_id,data.position,data.company);
            }
        })

        function modifyCareer(employee_id,position,stime,ftime,resigned_reason,salary,company){
            url="modifycareer.jsp?employee_id="+employee_id+"&position="+position+"&stime="+stime+"&ftime="+ftime+"&resigned_reason="+resigned_reason+"&salary="+salary+"&company="+company;
            window.location.href=url;
        }

        //删除职业生涯信息
        function delCareer(employee_id,position1,company){
            $.ajax({
                url:'${pageContext.request.contextPath}/delCareer.action',
                type:'POST',
                data:{'employee_id':employee_id,'position1':position1,'company':company},
                dataType:"JSON",
                cache:false,
                success:function (data) {
                    if(data.code==0){
                        alert("删除成功");
                        reloadCareer();
                    }else {
                        alert(data.msg);
                    }
                },
                error:function(){
                    alert("删除失败");
                }
            })
        }
    });
</script>
</body>
</html>
