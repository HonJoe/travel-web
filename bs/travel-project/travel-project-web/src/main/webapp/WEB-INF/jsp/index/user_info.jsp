<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>
<body>
<c:if test="${ sessionScope.currentUser==null }">
    <script>
        alert("未登录，请先登录");
        window.location.href="http://localhost:8080/indexView";
    </script>

</c:if>
<style>
    body{ background:#f4f3f1;}
    .subbtn{
        width: 280px;
        padding: 12px;
        border-radius: 4px;
        margin: 30px 0 0 100px;
        color: #fff;
        background-color: #80c269;
        cursor: pointer;
    }
</style>

<jsp:include page="navigation.jsp" flush="true" />

<div class="user_info" style="margin-top: 10px">
    <!--顶部用户资料显示-->
    <div class="user_info_bg">
        <div class="user_info_portrait">
            <p class="user_info_name">${user.username}</p>
        </div>
        <div class="user_info_msg">
	        <span>性别：
	            ${user.sex}       </span>
            <span>手机号：${user.phone}</span>
            <span>邮箱：${user.email}</span>
        </div>
    </div>

    <!--顶部用户资料显示 end-->

    <div class="user_info_cont clear">
        <!--用户中心左侧菜单-->
        <ul class="userinfo_left fl">
            <li class="active" ><span class="icon_user"></span><a href="http://localhost:8080/user/updateView">个人信息</a></li>
            <!--<li  ><span class="icon_msg"></span><a href="/User/message">我的消息</a></li>-->
            <li  ><span class="icon_order"></span><a href="http://localhost:8080/productOrder/orderView">我的订单</a></li>
            <li  ><span class="icon_custom"></span><a href="http://localhost:8080/customization/listView">我的定制</a></li>

        </ul>
        <!--用户中心左侧菜单 end-->

        <div class="userinfo_right fr">
            <ul class="user_right_nav">
                <li class="user_right_tab active"><a href="/User/index">个人资料</a></li>
                <!-- <li class="user_right_tab"><a href="/User/binding">账号绑定</a></li> -->
             <%--   <li class="user_right_tab"><a href="/User/editpass">密码修改</a></li>--%>
            </ul>

            <form id="form1"  method="post" onsubmit=" false" class="user_information">
                <input type="hidden" name="id" value="${user.id}" />
                <div class="user_form_list">
                    <label  class="label_txt">我的昵称：</label>
                    <input type="text" name="username" value="${user.username}" class="user_inputxt" />
                </div>
                <div class="user_form_list">
                    <label  class="label_txt">性别：</label>
                   <%-- <label class="mm-radio <c:if test="${user.sex =='女'}">active</c:if>">
                        <input name="sex" type="radio" value="女"  class="hidden"  />
                        女${user.sex =='女'? "" : checked}
                    </label>
                    <label class="mm-radio <c:if test="${user.sex =='男'}">active</c:if>">
                        <input name="sex" type="radio" value="男" class="hidden"  />
                        男
                    </label>--%>
                    <input name="sex" type="radio" value="女"  ${user.sex =='女'? 'checked' : ""}  />女
                    <input name="sex" type="radio" value="男" ${user.sex =='男'? 'checked':"" }  />
                    男
                </div>

                <div class="user_form_list">
                    <label  class="label_txt">手机号：</label>
                    <input type="text" name="phone" value="${user.phone}" class="user_inputxt" />
                </div>
                <div class="user_form_list">
                    <label  class="label_txt">电子邮箱：</label>
                    <input type="email" name="email" value="${user.email}" class="user_inputxt" />
                </div>


                <input type="button"  value="保存" class="userinfo_form_btn subbtn" onclick="updta()">
            </form>
        </div>
    </div>

</div>


<style>
    /*字体图标*/
    @font-face {
        font-family: 'iconfont';  /* project id 258222 */
        src: url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.eot');
        src: url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.eot?#iefix') format('embedded-opentype'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.woff') format('woff'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.ttf') format('truetype'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.svg#iconfont') format('svg');
    }
    .iconfont{
        font-family:"iconfont";
        font-size:16px;
        font-style:normal;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        padding-left:20px
    }
</style>


<%@ include file="foot.jsp"%>


<script>
    function updta() {
        var reg=/^1[3|4|5|8|7][0-9]\d{4,8}$/;
        var reges=/^0\d{2,3}-?\d{7,8}$/;
        var username=$('input[name="username"]').val();
        var phone=$('input[name="phone"]').val();
        var email=$('input[name="email"]').val();
        if(username == ""){
            alert("用户名不能为空");
            return false;
        }
        if(phone == ""){
            alert("手机号码不能为空");
            return false;
        }
        if(email == ""){
            alert("邮箱不能为空");
            return false;
        }
        if(!reg.test(phone)&&!reges.test(phone)){
            alert("输入的号码不正确");
            return false;
        }
        var param = $("#form1").serialize();;
        console.log(param);
        $.post("http://localhost:8080/user/update",param,function(result){
            if(result.success){
                alert("更新成功");
            }

        });

    }
</script>


</body>
</html>
