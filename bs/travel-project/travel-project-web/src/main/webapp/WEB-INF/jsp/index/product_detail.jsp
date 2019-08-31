<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>产品信息</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
    <link type="text/css" rel="stylesheet" href="/css/calendar-pro.css">
</head>
<body>


<style>
    body{ background-color: #f4f3f1;}
    #header{ margin-bottom: 0;}
    .info_left_top{overflow: initial;}
    #date{position: relative;}
    #date .info_attr_txt{margin-top: 4px;}
    #calendar {
        width: 430px;
        padding-top: 10px;
        background-color: #fff;
        border: 1px solid #eee;
    }
    .fc-toolbar {height: 29px;line-height: 29px;}
    .fc .fc-toolbar>*>:first-child {margin: auto .75em;}
    .fc-toolbar .fc-right {padding: 0 1em .75em; cursor: pointer;}
    .fc-scroller.fc-day-grid-container{overflow-y: hidden;}
    .fc-basic-view .fc-body .fc-row {min-height: 2em;}
    .fc-row.fc-widget-header {background-color: #eee; color: #444;}
    .fc-row .fc-content-skeleton { padding-bottom: 0;}
    .fc-day{cursor: pointer}
    .fc-day-top .fc-day-number { float: none; color: #666; }
    .fc-past .fc-day-number,.fc-today .fc-day-number{color: #ccc;}
    .fc-unthemed td {border: transparent;}
    .fc-row .fc-content-skeleton td{ text-align: center; }
    .fc-ltr .fc-basic-view .fc-day-top .fc-day-number {float: none;}
</style>

<jsp:include page="navigation.jsp" flush="true" />

<div id="content">


    <!--详情页主要内容-->
    <div class="info_con">
        <div class="clear">
            <div class="info_left">
                <div class="info_left_top clear">
                    <!--图片列表-->
                    <div class="info_list_img">
                        <div class="info_big_img">
                            <img src="${product.mainImage}" width="466" />
                        </div>


                    </div>
                    <!--图片列表 end-->

                    <!--文字说明-->
                    <div class="info_desc_txt">
                        <h2 class="info_desc_title ellipsis_2" style="width: 390px;">
                            ${product.title}							</h2>
                        <h3 class="info_subtitle ellipsis"></h3>
                        <ul class="info_list_attr">
                            <li class="price_section">
                                <span class="info_desc_yen">&yen; </span>
                                <span class="info_desc_price">${product.price}</span>/人起
                                <a href="javascript:;" onclick="getActive()" class="new_info_go">
                                    订购
                                </a>
                            </li>
                            <li>
                                <span class="info_attr_txt">出发城市</span>
                                <span class="info_attr_val">${product.startAreaname}</span>
                            </li>
                            <li>
                                <span class="info_attr_txt">旅游天数</span>
                                <span class="info_attr_val">${product.activeDays}</span>
                            </li>
                            <li>
                                <span class="info_attr_txt">订购数量</span>
                                <span class="info_attr_val"><input id="pnumber" name="pnumber" type="number" min="1" value="1"></span>
                            </li>
                            <li class="info_feature">
                                <span class="info_attr_txt">产品特色</span>
                                <c:forEach items="${themeProducts}" var="item" >
                                    <span class="target_txt">${item.themeName}</span>
                                </c:forEach>
                            </li>
                        </ul>

                        <!-- 容器布局 -->
                        <div class="calendar-box demo-box"></div>



                    </div>
                    <!--文字说明 end-->
                </div>

                <div class="info_left_bottom">
                    <div class="info_lb_menu">
                        <ul id="navigation">
                            <!--当前状态为 active-->
                            <li><a href="#box-1" class="active">景点介绍</a></li>
                            <li><a href="#box-2">行程安排</a></li>
                        </ul>

                        <a href="javascript:;" url="/Order/make/id/429" class="new_info_go">
                            我要订购
                        </a>
                    </div>
                    <!--主要内容-->
                    <div class="info_lb_list_con">

                        <div class="info_lb_itemcon info_lb_item_new" id="box-1">
                            ${productDesc.scenicDesc}
                        </div>

                        <div class="info_lb_itemcon info_lb_item_new" id="box-2">
                            ${productDesc.tripDesc}
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <!--详情页主要内容 end-->

</div>
<!--content end-->

<%@ include file="foot.jsp"%>





<script type="text/javascript" src="/js/calendar-pro.js"></script>

<script type="text/javascript">
    $('.calendar-box').calendar({
        ele : '.demo-box', //依附
        title : '选择预约时间',

        data : [
            <c:forEach items="${priceCalendars}" var="item" >

                {date:'<fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd"/>',data:'${item.price}',psid:'${item.psid}'},

            </c:forEach>


        ]
    });
    function getActive(){
        var data = $('.calendar-box').calendarGetActive();

        if (typeof(data.date) == "undefined"||typeof(data.money) == "undefined"){
            alert("请选择日期");
            return;
        }
        var numbers=$('#pnumber').val();
        var price=data.money;
        var sum=numbers*price;
        var str="出发日期:"+data.date+",订购数量:"+numbers+",总价:"+sum+"，确定要购买吗?";
        console.log(data.psid);
        console.log(numbers);
        if(confirm(str)==true){
            var url="http://localhost:8080/productOrder/fillView?"+"psid="+data.psid+"&num="+numbers;
            window.location.href=url;

//            $.ajax({
//                type: 'POST',
//                url: "http://localhost:8080/productOrder/create",
//                data : {
//                    "id" : data.psid,
//                },
//                success : function(result) {//返回数据根据结果进行相应的处理
//                    if ( result.success ) {
//                        alert('购买成功');
//                    } else {
//                        alert(result.msg);
//                    }
//                }
//            });

        }else{

            return false;

        }
    }
</script>



</body>
</html>
