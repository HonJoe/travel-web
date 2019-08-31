<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("path:"+path+"basePath:"+basePath);
%>
<html>
<head>
    <title>注册</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
</head>
<body>
<div id="contanier">
    <!--注册第一步-->
    <div id="logincontanier" class="loginbox">
        <div class="logincontainer">
            <!--脚本先不做验证-->
            <form role="form" method="post" id="form1" onsubmit="return toVaild()">
                <div class="form-group">
                    <input type="email" class="form-control" id="email" placeholder="输入用于注册的邮箱地址"  name="email">
                    <div class="messagebox">
                        <span ></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-group-contanier">
                        <div class="form-group yanzhen">
                            <input type="text" class="form-control " id="yzm" placeholder="输入邮件的验证码" name="registerCode">
                        </div>
                        <div class="form-group yanzhenoption">
                            <button class="btn btn-success" type="button" id="send">发送验证码</button>
                        </div>
                        <div class="messagebox">
                            <span ></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="请输入用户名(不超于8位)" name="username">
                    <div class="messagebox">
                        <span ></span>
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" placeholder="请输入6-12位密码" name="password">
                    <div class="messagebox">
                        <span ></span>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" id="registerBtn" class="form-control btn btn-success" value="注册">
                </div>
                <div class="form-groupl">
                    <p>已有**账号<a href=""> 登录</a> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<a href="">同意会员条款和免责声明</a> </p>
                </div>
            </form>
        </div>

    </div>


</div>
</body>
<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#send").click(function(){
            var data = $("#form1").serialize();
            console.log(data);
            var email=$("#email").val();
            if(email.length<=0){
                alert("请输入邮箱");
                return;
            }
            var url="http://localhost:8080/emailValidate?email="+email;
            $.get(url);
            $(this).attr('disabled',"true");
            $(this).text("已发送")
        });
    });
    $(function toVaild(){
        $("#registerBtn").click(function(){
            var username = $("#username").val();//取值
            var password = $("#password").val();
            var email=$("#email").val();
            var yzm=$("#yzm").val();

            if(!username){
                alert("用户名必填!");
                $("#username").focus();//获取焦点
                return false;
            }
            if(!password){
                alert("密码必填!");
                $("#password").focus();//获取焦点
                return false;
            }
            if(!email){
                alert("邮箱必填!");
                $("#email").focus();//获取焦点
                return false;
            }if(!yzm){
                alert("请填写验证码!");
                $("#yzm").focus();//获取焦点
                return false;
            }
            //var param = {"username":username,"password":password};
            var data = $("#form1").serialize();
            console.log(data);
            var targetUrl ="http://localhost:8080/user/register";

            $.ajax({
                type:'post',
                url:targetUrl,
                cache: false,
                data:data,
                dataType:'json',
                success:function(result){
                    if(result.status==200){
                        alert("注册成功");
                        window.location.href="http://localhost:8080/indexView";
                    }else{
                        alert("验证码错误");
                    }

                },
                error:function(error){
                    console.log(error);

                }
            })
            return false;
        });
    });

    function requesFail(xhr){
        var status = xhr.status;
        if (status) {
            showNotify("error", "网络错误", "发生网络错误，错误码为：" + xhr.status);
        } else {
            showNotify("error", "网络错误", "未知网络错误, 请确保设备处在联网状态");
        }
    }
</script>
</html>
