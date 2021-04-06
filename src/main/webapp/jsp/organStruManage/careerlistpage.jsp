<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2020/6/12
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>职业生涯信息分页显示</title>
    <!--引入layui的样式-->
    <link href="layui/css/layui.css" rel="stylesheet">
</head>
<body>
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
            </div>
    <table id="tb_career" lay-filter="tb_career">
    </table>
</body>
<!--引入layui.js-->
<script src="layui/layui.js"></script>
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
            url:"getCareerListByPage.action",//请求的后台接口
            cols:[[//表头
                {field:'employee_id',title:'员工编号',width:120},
                {field:'position',title:'职位名称',width:180},
                {field:'stime',title:'入职时间',width:180},
                {field:'ftime',title:'离职时间',width:180},
                {field:'resigned_reason',title:'离职原因',width:180},
                {field:'salary',title:'薪资',width:180},
                {field:'company',title:'公司',width:180}
            ]],
            page:true,//是否开启分页
        })
        $("#btn_search").on("click",function(){
            reloadCareer();
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
    });

</script>
</html>
