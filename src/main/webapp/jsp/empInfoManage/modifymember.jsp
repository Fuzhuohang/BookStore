<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>修改家庭成员信息</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
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
        form id="myform" class="layui-form" lay-filter="myform">
        <div class="layui-form-item">
            <label class="layui-form-label">员工编号</label>
            <div class="layui-input-block">
                <input type="text" name="employee_id" placeholder="--员工编号--" readonly="readonly" autocomplete="off" style="color:#D3D3D3" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">成员姓名</label>
            <div class="layui-input-block">
                <input type="text" name="member_name" placeholder="--成员姓名--" readonly="readonly" autocomplete="off" style="color:#D3D3D3" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="age" placeholder="--年龄--" autocomplete="off" lay-verify="age_c|required"  class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">关系</label>
            <div class="layui-input-block">
                <input type="text" name="relation" placeholder="--关系--" autocomplete="off" lay-verify="relation_c|required" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身体状况</label>
            <div class="layui-input-block">
                <select name="health_status" lay-verify="required">
                    <option value="">请选择健康状况</option>
                    <option value="健康">健康</option>
                    <option value="亚健康">亚健康</option>
                    <option value="小病">小病</option>
                    <option value="大病">大病</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工作状况</label>
            <div class="layui-input-block">
                <select name="work_status" lay-verify="required">
                    <option value="">请选择工作状况</option>
                    <option value="工作中">工作中</option>
                    <option value="未工作">未工作</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="btn" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="btn">提交</button>
            </div>
        </div>
        </form>
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
        var employee_id = GetQueryValue("employee_id");
        var member_name=GetQueryValue("member_name");
        var sex=GetQueryValue("sex");
        var age = GetQueryValue("age");
        var relation=GetQueryValue("relation")
        var health_status=GetQueryValue("health_status");
        var work_status=GetQueryValue("work_status");
        form.render();
        form.val("myform",{
            "employee_id":employee_id,
            "member_name":member_name,
            "sex":sex,
            "age":age,
            "relation":relation,
            "health_status":health_status,
            "work_status":work_status
        });
        form.verify({
            emp_c:[
                /^[1-9][0-9]*$/
                ,'员工编号必须为正整数'
            ],
            name_c:[
                /^[\u4e00-\u9fa5]{0,10}$/
                ,'成员姓名必须为0-10个汉字'
            ],
            age_c:[
                /^[1-9][0-9]*$/
                ,'年龄必须为正整数'
            ],
            relation_c:[
                /^[\u4e00-\u9fa5]{0,4}$/
                ,'关系应为0-4个汉字'
            ]
        });
        form.on('submit(btn)',function(){
            var formData = new FormData($("#myform")[0]);
            window.location.href="memberlistpageM.jsp";
            //console.log(formData.get("employee_id"))
            //执行ajax请求
            $.ajax({
                url:"${pageContext.request.contextPath}/modifyMember.action",
                type:"POST",
                dataType:"JSON",
                data:formData,//提交的请求参数
                processData:false,//必须要设置
                contentType:false,//必须要设置
                cache:false,
                success:function(data){
                    console.log(data);
                    if(data.code==0){
                        alert("Success!");
                    }else{
                        alert(data.msg);
                    }
                },
                error:function(){
                    alert("请求失败，请稍后重试！");
                }

            })
            return false;
        });
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
</html>
