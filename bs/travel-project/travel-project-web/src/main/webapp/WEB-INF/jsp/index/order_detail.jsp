<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/8
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>
<body>
<jsp:include page="navigation.jsp" flush="true" />

<div id="content" class="make_content">
    <div class="crumbs_menu">
        <span>填写预定信息</span> &gt;&gt; <span class="themecru_span">付款</span> &gt;&gt; <span>预定成功</span>
    </div>
    <div class="clear">
        <div class="order_con fl">
            <!--上面部分-->
            <div class="order_top">
                <h2>${product.title}</h2>
                <div class="clear theme_s_wrap">
                    <div class="info_list_img">
                        <img src="${product.mainImage}">
                    </div>
                    <!--文字说明-->
                    <div class="info_desc_txt">
                        <ul class="info_list_attr">
                            <li>
                                <span class="info_desc_price">&yen;${productSell.pPrice}</span>/人起
                            </li>
                            <li>
                                <span class="info_attr_txt">旅游天数</span>
                                <span class="info_attr_val">${product.activeDays}</span>
                            </li>
                            <li>
                                <span class="info_attr_txt">出发城市</span>
                                <span class="info_attr_val">${product.startAreaname}</span>
                            </li>
                            <li>
                                <span class="info_attr_txt">目的城市</span>
                                <span class="info_attr_val">${product.endAreaname}</span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <!--上面部分-->
            <!--form 表单-->
            <form action="/Order/create/id/3511" method="post" id="theme_form">
                <div class="order_bottom">
                    <h2 class="order_theme_title">订购信息</h2>
                    <div class="order_myinfo">
                        <table class="payment_table" cellspacing="0">
                            <thead>
                            <tr>
                                <th>出发时间</th>
                                <th>订购数量</th>
                                <th>联系人</th>
                                <th>手机号</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><fmt:formatDate value="${productSell.startDate}" pattern="yyyy-MM-dd"/></td>
                                <td>${productOrder.pruductNum}</td>
                                <td>${productOrder.username}</td>
                                <td>${productOrder.phone}</td>
                                <td>${productOrder.remarks}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="book_note">
                        <h3>预定须知</h3>
                        <p>付款完成后，如需取消如需取消或修改订单，请尽快通知美旅旅行，否则我们将扣除您全额或部分房费。</p>
                        <p>退款金额说明</p>
                        <p>若您所预定的套餐产品内含优惠，当您退订其中任何一项保险以外的项目（酒店或门票）我们将从退款金额中扣除优惠部分，敬请见谅</p>
                    </div>
                </div>
            </form>

            <!--form 表单 end-->

        </div>
        <!--order_con end-->
        <!--订单信息及支付按钮-->
        <div class="order_info fr">
            <div class="order_r_posi">
                <h4 class="order_theme_title">金额信息</h4>
                <div class="order_pay_info">

                    <div class="theme_r_wrap">
                        <div class="theme_r_info">
                            <span class="theme_r_txt">订单金额：</span>
                            <span class="theme_r_allprice">&yen;${productOrder.payment}</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--订单信息及支付按钮 end-->
    </div>
</div>
<!--footer-->
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
