<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/login.css">

    <link href="/images/rabbit_in_the_hat_128px_1199655_easyicon.net.ico" rel="icon" >
    <script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/index.js"></script>
    <script type="text/javascript" src="/js/external.js"></script>
</head>
<body>
<style>
    a:hover{
        text-decoration:none;
    }
</style>
<script>
    function openUrl() {
        window.open("http://wpa.qq.com/msgrd?v=3&uin=852276920&site=qq&menu=yes","_blank");
    }

</script>
<!--导航栏-->
<div id="head" class="row">
    <div class="col-md-offset-1 col-xs-offset-1 col-md-1 col-xs-1 logo"><img src="/images/rabbit_in_the_hat_573px_1199655_easyicon.net.png" style="height: 45px;width: auto"></div>
    <div class="col-md-6 col-xs-6 navigation">
        <ul>
            <li class="navigation_item nav_item1">
                <a class="option_bottom" href="http://localhost:8080/indexView">首页</a>
            </li>
            <li class="navigation_item nav_item2"><a class="navigation_style" href="http://localhost:8080/plistView">旅游产品</a></li>
            <li class="navigation_item nav_item3"><a class="navigation_style" href="http://localhost:8080/customized">服务定制</a></li>
            <li class="navigation_item nav_item4"><a href="javascript:void(0);" class="navigation_style"   onclick="openUrl()">咨询</a></li>
        </ul>
    </div>
    <div class="col-md-2 col-xs-2 share">

        <c:if test="${ sessionScope.currentUser==null }">
            <span class="login">登录</span>
            <span class="reg"><a href="http://localhost:8080/register">注册</a> </span>
        </c:if>
        <c:if test="${ sessionScope.currentUser!=null }">
            <span class="reg"><a href="http://localhost:8080/user/updateView">个人中心</a></span>
        </c:if>
    </div>
    <!--登录框-->
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
         style="z-index: 10000">
        <div class="modal-dialog" >
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span>&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">登录</h4>
                </div>
                <div class="modal-body" >

                    <div class="form-group">
                        <input type="text" class="form-control" id="username" placeholder="请输入用户名">
                        <div class="messagebox">
                            <span></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        <div class="messagebox">
                            <span></span>
                        </div>
                    </div>
                    <div class="fpsd">
                        <a href="#">忘记密码</a>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>


</body>
<script type="text/javascript">
    $(function valid(){
        $('#password').keydown(function(event) {
            if (event.keyCode == 13) {
                var username = $("#username").val();//取值
                var password = $("#password").val();
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
                //var param = "username="+username+"&password="+password;
                var param = {"username":username,"password":password};
                console.log(param);
                $.post("http://localhost:8080/user/login",param,function(result){
                    if(result.status==200){
                        $("#myModal").modal("hide");
                        alert("登录成功");
                        window.location.href="http://localhost:8080/indexView";

                    }else{
                        alert("用户名或密码错误");
                    }

                });
            }
        });
    });
</script>
</html>
