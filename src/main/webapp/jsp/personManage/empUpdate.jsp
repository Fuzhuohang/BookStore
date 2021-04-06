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

        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-md12" style="text-align: center;color: #ff5722">
                    请在需要更改的字段对应的框内输入目标数据
                </div>
            </div>
        </div>
        <form class="layui-form layui-form-pane" lay-falter="updateForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="employee_name" placeholder="更改姓名" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-inline">
                    <div class="layui-input-block">
                        <input type="hidden" name="employee_id" id="emp_id" autocomplete="off" class="layui-input" >
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="nan" title="男">
                    <input type="radio" name="sex" value="nv" title="女">
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input type="number" name="age" id="age" placeholder="更改年龄" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">身高</label>
                    <div class="layui-input-block">
                        <input type="number" name="height" id="height" placeholder="更改身高" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">体重</label>
                    <div class="layui-input-block">
                        <input type="number" name="weight" id="weight" placeholder="更改体重" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="email" name="mail" placeholder="更改邮箱"  autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">电话号码</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" placeholder="更改电话号码" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" placeholder="更改地址" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>
            </div>

            <div class="layui-form-item" style="width: 310px">
                <label class="layui-form-label">工作岗位</label>
                <div class="layui-input-block">
                    <select name="job_id" id="job_id">
                        <option value="0" selected>请选择一个岗位</option>
                        <option value="1">研发经理</option>
                        <option value="2">研发人员</option>
                        <option value="3">研发总监</option>
                        <option value="4">测试工程师</option>
                        <option value="5">测试人员</option>
                        <option value="6">系统工程师</option>
                        <option value="7">网络工程师</option>
                        <option value="8">数据库管理员</option>
                        <option value="9">营销主管</option>
                        <option value="10">销售内勤</option>
                        <option value="11">财务总监</option>
                        <option value="12">投资主管</option>
                        <option value="13">产品经理</option>
                        <option value="14">产品经理助理</option>
                        <option value="15">企业保安</option>
                        <option value="16">门卫内保</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateEmpSubmit">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

        </form>
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
    //Demo
    layui.use(['form', 'jquery'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        //监听提交
        var temp = sessionStorage.getItem("employee_id");
        $("#emp_id").attr("value", temp);

        form.on('submit(updateEmpSubmit)', function(data){

            if($("#age").val() == "")
                $("#age").attr("value", 0);
            if($("#height").val() == "")
                $("#height").attr("value", 0);
            if($("#weight").val() == "")
                $("#weight").attr("value", 0);
            if($("#job_id").val() == "")
                $("#job_id").attr("value", 0);

            var field=$(data.form).serialize();


            $.ajax({
                url: "${pageContext.request.contextPath}/updateEmp.action",
                type: "POST",
                data: field,
                dataType: 'JSON',
                cache: false,
                success:function (data) {
                    if(data.code==0){
                        alert("修改员工信息成功");
                        sessionStorage.removeItem("employee_id");
                        window.location.href='empMain.jsp';
                    }else{
                        alert(data.msg);
                    }
                },
                error:function () {
                    alert("修改失败");
                }
            });
            return false;
        });

    });
</script>

</html>
