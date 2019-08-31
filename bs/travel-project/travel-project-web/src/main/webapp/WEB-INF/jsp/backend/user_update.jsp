<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
    <title>用户信息修改</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
<%@ include file="nav.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">会员列表</h2>
            <a href="user_detail.html" class="fr top_rt_btn add_icon">添加新会员</a>
        </div>
        <form class="form-horizontal" id="form1">
            <div class="form-group">
                <label  class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="username" name="username" placeholder="username" value="${user.username}">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" name="password" placeholder="Password" value="${user.password}">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" name="email" id="inputEmail" placeholder="Email" value="${user.email}">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">手机号码</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="phone" id="inputEmail3" placeholder="phone" value="${user.phone}">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-4">
                    <label class="radio-inline">
                        <input type="radio" name="sex" id="inlineRadio1" value="男" ${user.sex=='男' ? 'checked' : ''}> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="sex" id="inlineRadio2" value="女" ${user.sex=='女'?'checked' : ''}> 女
                    </label>
                </div>
            </div>
                <input type="hidden" name="id" value="${user.id}">
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" onclick="update()">修改</button>
                </div>
            </div>
        </form>
    </div>
</section>
<script>
    function update() {
        var data = $("#form1").serialize();
        var targetUrl ="http://localhost:8080/manager/user/update";
        $.ajax({
            type:'post',
            url:targetUrl,
            cache: false,
            data:data,
            dataType:'json',
            success:function(result){
                if(result.status==200){
                    alert("修改成功");
                    window.location.href="http://localhost:8080/admin/userlist";
                }

            },
            error:function(error){
                console.log(error);

            }
        })
    }
</script>
</body>
</html>
