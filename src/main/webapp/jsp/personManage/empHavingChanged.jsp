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
        <table id="tb_emp"  lay-filter="tb_emp"></table>
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
            elem: '#update_time' //指定元素
        });
    });
</script>


<script>
    layui.use(['jquery', 'table'], function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem:"#tb_emp",
            limit:10,
            url:"${pageContext.request.contextPath}/getJobChanged.action",
            cols:[[
                {field:'employee_id', title:'编号', width:'60'},
                {field:'employee_name', title:'姓名', width:'120'},
                {field:'sex', title:'性别', width:'60'},
                {field:'age', title:'年龄', width:'60'},
                {field:'weight', title:'体重', width:'60'},
                {field:'height', title:'身高', width:'60'},
                {field:'phone', title:'电话', width:'120'},
                {field:'mail', title:'邮箱', width:'180'},
                {field:'address', title:'地址', width:'160'},
                {title:'起始职位', width: '120', templet: '#job_before_tpl'},
                {title:'调动后职位', width: '120', templet: '#job_tpl'},
                {field: 'reason', title: '调动原因', width: '120'},
                {field: 'update_time', title: '入职时间', width: '120'},
                {field: 'time', title: '调动时间', width: '120'},
            ]],
            page:true
        });

    });
</script>

<script type="text/html" id="job_tpl">
    {{#  if(d.job_id == 1){ }}
    研发经理
    {{#  } else if(d.job_id==2){ }}
    研发人员
    {{#  } else if(d.job_id==3){ }}
    研发总监
    {{#  } else if(d.job_id==4){ }}
    测试工程师
    {{#  } else if(d.job_id==5){ }}
    测试人员
    {{#  } else if(d.job_id==6){ }}
    系统工程师
    {{#  } else if(d.job_id==7){ }}
    网络工程师
    {{#  } else if(d.job_id==8){ }}
    数据库管理员
    {{#  } else if(d.job_id==9){ }}
    营销主管
    {{#  } else if(d.job_id==10){ }}
    销售內监
    {{#  } else if(d.job_id==11){ }}
    财务总监
    {{#  } else if(d.job_id==12){ }}
    投资主管
    {{#  } else if(d.job_id==13){ }}
    产品经理
    {{#  } else if(d.job_id==14){ }}
    产品经理助理
    {{#  } else if(d.job_id==15){ }}
    企业保安
    {{#  } else if(d.job_id==16){ }}
    门卫内保
    {{# }}}
</script>

<script type="text/html" id="job_before_tpl">
    {{#  if(d.job_before_id == 1){ }}
    研发经理
    {{#  } else if(d.job_before_id==2){ }}
    研发人员
    {{#  } else if(d.job_before_id==3){ }}
    研发总监
    {{#  } else if(d.job_before_id==4){ }}
    测试工程师
    {{#  } else if(d.job_before_id==5){ }}
    测试人员
    {{#  } else if(d.job_before_id==6){ }}
    系统工程师
    {{#  } else if(d.job_before_id==7){ }}
    网络工程师
    {{#  } else if(d.job_before_id==8){ }}
    数据库管理员
    {{#  } else if(d.job_before_id==9){ }}
    营销主管
    {{#  } else if(d.job_before_id==10){ }}
    销售內监
    {{#  } else if(d.job_before_id==11){ }}
    财务总监
    {{#  } else if(d.job_before_id==12){ }}
    投资主管
    {{#  } else if(d.job_before_id==13){ }}
    产品经理
    {{#  } else if(d.job_before_id==14){ }}
    产品经理助理
    {{#  } else if(d.job_before_id==15){ }}
    企业保安
    {{#  } else if(d.job_before_id==16){ }}
    门卫内保
    {{# }}}
</script>
</html>

