<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2020/6/13
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加家庭成员</title>
    <script src="js/jquery-3.5.1.min.js"></script>
    <!--引入layui的样式-->
    <link href="layui/css/layui.css" rel="stylesheet">
</head>
<body>
    <form id="myform" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">员工编号</label>
            <div class="layui-input-block">
                <input type="text" name="employee_id" placeholder="--员工编号--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">成员姓名</label>
            <div class="layui-input-block">
                <input type="text" name="member_name" placeholder="--成员姓名--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="age" placeholder="--年龄--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">关系</label>
            <div class="layui-input-block">
                <input type="text" name="relation" placeholder="--关系--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身体状况</label>
            <div class="layui-input-block">
                <input type="text" name="health_status" placeholder="--身体状况--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">工作状况</label>
            <div class="layui-input-block">
                <input type="text" name="work_status" placeholder="--工作状况--" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女" checked>
            <input type="radio" name="sex" value="" title="中性" disabled>
        </div>
    </form>
    <br>
    <button id="btn">提交</button>
</body>
<script src="layui/layui.js"></script>
<script >
    layui.use('form',function(){
        var form=layui.form;
        form.render();
    })
</script>
<script>
    $("#btn").on("click",function(){
        var formData = new FormData($("#myform")[0]);
        //执行ajax请求
        $.ajax({
            url:"addMember.action",
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
    });
</script>
</html>
