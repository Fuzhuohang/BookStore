<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2020/6/12
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>语言能力信息分页显示</title>
    <!--引入layui的样式-->
    <link href="layui/css/layui.css" rel="stylesheet">
</head>
<body>
<form id="myform" class="layui-form ">
    <div class="layui-form-item">
        <div class="layui-inline">
            <input id="employee_num"  type="text" placeholder="--员工编号--" class="layui-input">
         </div>

        <div class="layui-inline">
            <select id="language">
                    <option value="">请选择外语种</option>
                    <option value="英语">英语</option>
                    <option value="俄语">俄语</option>
                    <option value="日语">日语</option>
                    <option value="法语">法语</option>
                    <option value="韩文">韩文</option>
            </select>
        </div>

        <div class="layui-inline">
            <select id="level">
                <option value="">请选择熟练程度</option>
                <option value="低">低</option>
                <option value="中">中</option>
                <option value="高">高</option>
            </select>
        </div>

    </div>
</form>
    <button id="btn_search" class="layui-btn layui-btn-normal">查询</button>


<table id="tb_languageinfo" lay-filter="tb_languageinfo">
</table>
</body>
<!--引入layui.js-->
<script src="layui/layui.js"></script>
<script>
    layui.use(['jquery','table'],function () {
        var table=layui.table;
        var $=layui.jquery;
        //渲染表格
        table.render({
            elem:"#tb_languageinfo",//渲染的表格的id
            url:"getLanguageInfoListByPage.action",//请求的后台接口
            cols:[[//表头
                {field:'employee_id',title:'员工编号',width:120},
                {field:'language',title:'外语种',width:180},
                {field:'level',title:'熟练程度',width:180}
            ]],
            page:true,//是否开启分页
        })
        $("#btn_search").on("click",function(){
            reloadLanguageinfo();
        })

        //表格重载
        function reloadLanguageinfo(){
            table.reload("tb_languageinfo",{
                page:{
                    curr:1//重新从第一页开始显示
                },
                where:{
                    employee_id:$("#employee_num").val(),
                    language:$("#language").val(),
                    level:$("#level").val()
                }
            },'data');
        }
    });
</script>
</html>