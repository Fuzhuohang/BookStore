<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2020/6/13
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>家庭成员信息</title>
    <!--引入layui的样式-->
    <link href="layui/css/layui.css" rel="stylesheet">
</head>
<body>
<%--<div class="layui-form-item">--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="employee_num" type="text" placeholder="--员工编号--" class="layui-input">--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="member_name" type="text" placeholder="--成员姓名--" class="layui-input">--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="age" type="text" placeholder="--年龄--" class="layui-input" >--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="sex" type="text" placeholder="--性别--" class="layui-input" >--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="relation" type="text" placeholder="--关系--" class="layui-input">--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="health_status" type="text" placeholder="--健康状况--" class="layui-input">--%>
<%--    </div>--%>
<%--    <div class="layui-inline">--%>
<%--        <input id="work_status" type="text" placeholder="--工作状况--" class="layui-input">--%>
<%--    </div>--%>
<%--        <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>--%>
<%--</div>--%>
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
    <table id="tb_member" lay-filter="tb_member">
    </table>
</body>
<!--引入layui.js-->
<script src="layui/layui.js"></script>
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
            url:"getMemberListByPage.action",//请求的后台接口
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
                alert("添加成功");
            }
            if(obj.event=='member_del'){
                delMember(data.employee_id,data.member_name);
            }
        })

        //删除家庭成员信息
        function delMember(employee_id,member_name){
            $.ajax({
                url:'delMember.action',
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
</html>
