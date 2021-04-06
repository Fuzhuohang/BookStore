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
    <title>编辑此部门的信息</title>
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
            document.getElementById("d").innerHTML=" 编辑此部门的信息：";/*写入网页上方大字*/
        </script> <br>
        <form id="myform" class="layui-form " lay-filter="myform">
            <div class="layui-form-item">
                <label class="layui-form-label">部门编号</label>
                <div class="layui-input-block">
                    <input name="dept_id" id="dept_id" type="text" readonly="readonly" placeholder="--部门编号--" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门名</label>
                <div class="layui-input-block">
                    <input name="dept_name" id="dept_name" type="text" placeholder="--部门名--" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门所在地</label>
                <div class="layui-input-block">
                    <input name="dept_loc" id="dept_loc" type="text" placeholder="--部门所在地--" class="layui-input">
                </div>
            </div>
        </form>
        <button id="btn" class="layui-btn layui-btn-normal">提交更改信息</button>
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

<script>
    layui.use('form',function(){
        var form=layui.form;
        var dept_id_var = GetQueryValue("dept_id");
        var dept_name_var=GetQueryValue("dept_name");
        var dept_loc_var=GetQueryValue("dept_loc");
        form.render();
        form.val("myform",{
            "dept_id":dept_id_var,
            "dept_name":dept_name_var,
            "dept_loc":dept_loc_var
        })
    })
    function GetQueryValue(queryName) {
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
<script>
    $("#btn").on("click",function(){
        var formData = new FormData($("#myform")[0]);
        //执行ajax请求
        $.ajax({
            url:"${pageContext.request.contextPath}/modifyDept.action",
            type:"POST",
            dataType:"JSON",
            data:formData,//提交的请求参数
            processData:false,//必须要设置
            contentType:false,//必须要设置
            cache:false,
            success:function(data){
                console.log(data);
                if(data.code==0){
                    alert("修改成功！");
                }else{
                    alert(data.msg);
                }
            },
            error:function(){
                alert("请求失败，请稍后重试！");
            }

        })
    });
</script>

</html>
