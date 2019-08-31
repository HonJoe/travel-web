<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>后台登录</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
        body{height:100%;background:#16a085;overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
    <script src="/js/jquery.js"></script>
    <script src="/js/Particleground.js"></script>

</head>
<body>
<dl class="admin_login">
    <dt>
        <strong>站点后台管理系统</strong>
        <em>Management System</em>
    </dt>
    <dd class="user_icon">
        <input type="text" placeholder="账号" id="username" class="login_txtbx"/>
    </dd>
    <dd class="pwd_icon">
        <input type="password" placeholder="密码" id="password" class="login_txtbx"/>
    </dd>

    <dd>
        <input type="button" value="立即登录" class="submit_btn"/>
    </dd>

</dl>
</body>
<script>
    $(document).ready(function() {
        //粒子背景特效
        $('body').particleground({
            dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'
        });
        //测试提交，对接程序删除即可
        $(".submit_btn").click(function(){
            var username = $("#username").val();//取值
            var password = $("#password").val();
            var param = {"username":username,"password":password};
            $.post("http://localhost:8080/user/admin/login",param,function(result){
                if(result.success){
                    console.log(result);

                    alert("登录成功");
                    window.location.href="http://localhost:8080/admin/index";

                }else{
                    alert("用户名或密码错误");
                }

            });
        });
    });
</script>
</html>


