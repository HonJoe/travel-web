<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/6
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>定制列表</title>

    <link rel="stylesheet" href="/css/allstyle.css" />

</head>
<body>
<style>
    body{ background:#f4f3f1;}
</style>
<jsp:include page="navigation.jsp" flush="true" />


<div class="user_info">
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
            <li  ><span class="icon_user"></span><a href="http://localhost:8080/user/updateView">个人信息</a></li>
            <!--<li  ><span class="icon_msg"></span><a href="/User/message">我的消息</a></li>-->
            <li  ><span class="icon_order"></span><a href="http://localhost:8080/productOrder/orderView">我的订单</a></li>
            <li  class="active" ><span class="icon_custom "></span><a href="http://localhost:8080/customization/listView">我的定制</a></li>

        </ul>
        <!--用户中心左侧菜单 end-->

        <div class="userinfo_right fr usercustom">
            <ul class="user_right_nav">
                <li class="user_right_tab n_btn_publish"></li>
            </ul>
            <c:forEach items="${customizations}" var="item" >
                <div class="n_order_info clear">

                    <div class="n_order_info_tips">
                        <a href="javascript:;" class="n_order_title ellipsis"><span class="icon_location"></span>
                            ${item.startAreaname}出发，去${item.endAreaname}	                    </a>
                        <p class="n_publish_time">出发日期：<fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/></p>
                    </div>
                    <div class="n_usercustom_tips">
                        <p class="n_order_price">预算：&yen;${item.percapitaConsumption}/人</p>
                        <p>游玩：${item.days}天，共${item.number}人</p>
                    </div>
                    <div class="n_user_operation">
                        <p class="n_publish_time">

                        </p>
                        <a  target="_blank" href="http://localhost:8080/customization/detailView/${item.id}" class="n_btn_normal n_btn_warn">查看详情</a>
                    </div>
                </div>

            </c:forEach>




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
</body>
</html>
