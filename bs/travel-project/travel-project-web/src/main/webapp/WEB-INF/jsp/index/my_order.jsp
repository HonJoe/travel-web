<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人订单</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>
<style>
    body{ background:#f4f3f1;}
</style>
<body>
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
            <li ><span class="icon_user"></span><a href="http://localhost:8080/user/updateView">个人信息</a></li>
            <!--<li  ><span class="icon_msg"></span><a href="/User/message">我的消息</a></li>-->
            <li class="active"  ><span class="icon_order"></span><a href="http://localhost:8080/productOrder/orderView">我的订单</a></li>
            <li  ><span class="icon_custom"></span><a href="http://localhost:8080/customization/listView">我的定制</a></li>

        </ul>
        <!--用户中心左侧菜单 end-->

        <div class="userinfo_right fr userorder">
            <ul class="user_right_nav">
                <li class="user_right_tab tab_l">订单信息</li>
                <li class="user_right_tab tab_m">出发时间</li>
                <li class="user_right_tab tab_m">金额</li>
                <li class="user_right_tab">数量</li>
            </ul>
            <c:forEach items="${orderLists}" var="item" >
                <div class="n_userorder_list">
                    <p class="n_userorder_tips">
                        <span>下单时间：<fmt:formatDate value="${item.payment}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <span class="userorder_id">订单编号：${item.orderNum}1</span>
                        <a href="http://localhost:8080/productOrder/detailView?pid=${item.pid}&oid=${item.oid}" class="userorder_view">查看详情</a>
                    </p>
                    <div class="n_order_info clear">
                        <div class="n_order_info_tips">
                            <a href="/Activity/detail/id/26" class="n_order_info_img">
                                <img src="${item.picUrl}" alt="${item.title}" width="90" height="62">
                            </a>
                            <a href="http://localhost:8080/product/detailView/${item.pid}" class="n_order_title ellipsis_2">${item.title}</a>
                            <p class="n_order_price_s"></p>
                        </div>
                        <p class="n_order_time"><fmt:formatDate value="${item.stratDate}" pattern="yyyy-MM-dd"/></p>
                        <p class="n_order_price">${item.price}</p>
                        <div class="n_order_operation">
                            <!--订单状态-->
                            <p class="order_status2">${item.pruductNum}</p>
                            <!--订单操作-->

                        </div>
                    </div>

                </div>

            </c:forEach>


            <!--分页-->
            <div class="page">
                <div>   <span class="omit">...</span>  </div>				</div>
            <!--分页 end-->
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
