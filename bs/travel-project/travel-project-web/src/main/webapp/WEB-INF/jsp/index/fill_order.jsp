<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/8
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>填写订单</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>

<body>

<jsp:include page="navigation.jsp" flush="true" />


<div id="content" class="make_content" >
    <div class="crumbs_menu">
        <span class="themecru_span">填写预定信息</span> &gt;&gt; <span>付款</span> &gt;&gt; <span>预定成功</span>
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
                                <span class="info_desc_price">&yen; <i id="ticket_price">${productSell.pPrice}</i></span>/人
                            </li>
                            <li>
                                <span class="info_attr_txt">出发地</span>
                                <span class="info_attr_val">${product.startAreaname}</span>
                            </li>
                            <li>
                                <span class="info_attr_txt">目的地</span>
                                <span class="info_attr_val">${product.endAreaname}</span>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
            <!--上面部分-->
            <!--form 表单-->
            <form id="form1">
                <input type="hidden" name="pruductNum" value="${num}" id="input_num" />
                <input type="hidden" name="psid" value="${productSell.id}">
                <div class="order_bottom">
                    <h2 class="order_theme_title">订购信息</h2>
                    <div class="order_myinfo">
                        <table>
                            <tbody>

                            <tr>
                                <td class="theme_td_txt">
                                    <span class="need">*</span>
                                    出发时间：
                                </td>
                                <td>
                                    <input type="text"  class="user_inputxt" datatype="*" nullmsg="请选择时间！" errormsg="时间不能为空！" placeholder="<fmt:formatDate value="${productSell.startDate}" pattern="yyyy-MM-dd"/>" readonly/>
                                </td>
                                <td>
                                    <div class="Validform_checktip"></div>
                                    <div class="info">入住时间必须选择<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="theme_td_txt">
                                    <span class="need">*</span>
                                    联系人：
                                </td>
                                <td>
                                    <input type="text" name="username" class="user_inputxt" id="real_input" datatype="*2-16" nullmsg="请输入联系人！" errormsg="联系人至少2个字符,最多16个字符" placeholder="例如：张三" />
                                    <!-- <select name="">
                                        <option value="">使用信息记录</option>
                                    </select> -->
                                </td>
                                <td>
                                    <div class="Validform_checktip"></div>
                                    <div class="info">联系人至少2个字符,最多16个字符<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="theme_td_txt">
                                    <span class="need">*</span>
                                    手机号：
                                </td>
                                <td>
                                    <input type="text" class="user_inputxt" name="phone" datatype="m" nullmsg="请输入您的手机号码！" errormsg="手机号码格式不正确！" placeholder="例如：18311251523">
                                </td>
                                <td>
                                    <div class="Validform_checktip"></div>
                                    <div class="info">请输入手机号码<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                                </td>
                            </tr>

                            <tr>
                                <td class="theme_td_txt">备注：</td>
                                <td>
                                    <textarea class="textarea" name="remarks"></textarea>
                                </td>
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
                <h4 class="order_theme_title">结算信息</h4>
                <div class="order_pay_info">
                    <div class="order_item">
                        <div class="order_item_title">费用</div>
                        <div class="order_item_info">
                            <span class="theme_order_num">${num}</span>x<span class="theme_order_price">&yen;<span>${productSell.pPrice}</span></span>
                            <span class="theme_all_price fr">${sum}</span>
                        </div>
                    </div>
                    <div class="theme_r_wrap" style="margin-top:18px;">
                        <div class="theme_r_info">
                            <span class="theme_r_txt">订单金额：</span>
                            <span class="theme_r_allprice">&yen;<span>${sum}</span></span>
                        </div>
                        <a href="javascript:;" url="/VillaSale/create/id/35" class="theme_r_btn">订购</a>
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

<script>
    $(".theme_r_btn").click(function(){
        var username=$("input[name='username']").val();
        var phone=$("input[name='phone']").val();
        if (username==""){
            alert("请填写联系人");
            return ;
        }
        if (phone==""){
            alert("请填写手机号码");
            return ;
        }
        var data = $("#form1").serialize();
        data= decodeURIComponent(data,true);
        console.log(data);
        $.ajax({
                type: 'POST',
                url: "http://localhost:8080/productOrder/create",
                data : data,
                success : function(result) {//返回数据根据结果进行相应的处理
                    if ( result.success ) {
                        alert('购买成功');
                        window.location.href="http://localhost:8080/productOrder/orderView";
                    } else {
                        alert(result.msg);
                    }
                }
            });
    });
</script>
</body>
</html>
