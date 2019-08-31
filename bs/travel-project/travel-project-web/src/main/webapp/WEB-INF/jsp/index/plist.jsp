<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/7
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品信息</title>

</head>
<script type="text/javascript">
    function getByDays(obj){
        var activeDays=$(obj).attr("value");
        console.log(activeDays);
        var url="http://localhost:8080/product/list2";
        var data={
            size:5,
            activeDays:activeDays
        };
        $.post(url,data,function(result){

            showDataHtml2(result);
        });

    }


</script>
<body>

<jsp:include page="navigation.jsp" flush="true" />
<link rel="stylesheet" href="/css/allstyle.css" />
<!--content-->
<div class="discovery_banner customtailor_banner theme-banner">
    <div class="custom_banner_wrap">
        <form  class="customForm" onsubmit="false">
            <input type="text"  id="keyword" class="custom-search" autocomplete="off" placeholder="你要去哪儿？"  />
        </form>

        <a href="http://localhost:8080/customized" class="more-custom">获得更多专业定制&gt;&gt;</a>
    </div>
</div>
<div id="content">
    <!-- 各种类型-->
    <div class="custom">
        <!-- 特色旅游-->
        <div class="custom-around">
            <div class="custom-top">
                <div class="custom-lt">
                    <b>特色旅游</b>
                </div>
                <ul class="custom-list custom-feature">
                    <li  value="自然山水">
                        自然山水                        </li>
                    <li  value="沙滩海岸">
                        沙滩海岸                        </li>
                    <li value="漂流">
                        漂流                                     </li>
                    <li value="游乐园">
                        游乐园                        </li>
                    <li value="温泉">
                        温泉                        </li>
                    <li value="徒步登山">
                        徒步登山                        </li>
                    <li value="酒店">
                        酒店                        </li>
                    <li value="自由行">
                        自由行                        </li>              </ul>
                <a class="theme-feature"  href="http://localhost:8080/productlistView"> <p class="all_r">更多&gt;</p></a>
            </div>
            <div class="tour-content ">
                <div class="ct-cn">
                    <ul class="ct-lg feature-content">
                    </ul>
                </div>
            </div>
        </div>
        <!-- 特色旅游 end-->
        <!-- 周边游-->
        <div class="custom-around">
            <div class="custom-top">
                <div class="custom-lt">
                    <b>旅行天数</b>
                </div>
                <ul class="custom-list custom-rim">
                    <li value="1-2天" onclick="getByDays(this)">1-2天</li>
                    <li value="3-5天" onclick="getByDays(this)">3-5天</li>
                    <li value="5天以上" onclick="getByDays(this)">5天以上 </li>

                </ul>
                <a class="rim-all" href="http://localhost:8080/productlistView"> <p class="all_r">更多&gt;</p></a>
            </div>
            <div class="tour-content ">
                <div class="ct-cn">
                    <ul class="ct-lg rim-content">

                    </ul>
                </div>
            </div>
        </div>
        <!-- 周边游 end-->
        <!-- 国内游-->
        <div class="custom-around">
            <div class="custom-top">
                <div class="custom-lt">
                    <b>热门旅游</b>
                </div>
                <ul class="custom-list custom-civil">
                </ul>
                <a class="civil-all" href="http://localhost:8080/productlistView"> <p class="all_r">更多&gt;</p></a>
            </div>
            <div class="tour-content ">
                <div class="ct-cn">
                    <ul class="ct-lg civil-content">


                    </ul>
                </div>
            </div>
        </div>
        <!-- 国内游 end-->
    </div>
</div>
<!--content end-->

<%@ include file="foot.jsp"%>
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
        -webkit-text-stroke-width: 0.2;
        -moz-osx-font-smoothing: grayscale;
        padding-left:20px
    }
</style>





<script>

    $(function() {
        //初始化分页
        init();

    });

    $(".custom-feature>li").on("click",function(){
        var url="http://localhost:8080/product/list2";
        var v=$(this).attr("value");
        var data={
            size:5,
            type:v
        };
        $.post(url,data,function(result){

            showDataHtml1(result);
        });

    });
    $("#keyword").keyup(function(){

        if(event.keyCode == 13){

            window.location.href="http://localhost:8080/productlistView";

        }

    });

    function init(){
        var url="http://localhost:8080/product/list2";
        var data={
            size:5,
            type:'自然山水'
        };
        $.post(url,data,function(result){

            showDataHtml1(result);
        });
        data={
            size:5,
            activeDays:'1-2天'
        };
        $.post(url,data,function(result){

            showDataHtml2(result);
        });
        url="http://localhost:8080/product/hot";
        data={
            size:5,
        };
        $.post(url,data,function(result){

            showDataHtml3(result);
        });
    }


    function showDataHtml1(obj){
        var html="";
        $(".feature-content").html(html);
        $.each(obj,function(i,item){
            html+=`<li>
                   <a href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-img">
                        <img class="lazy" src="`+item.mainImage+`" >
                    </a>
                    <div class="ct-td">
                        <a href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-title">`+item.title+`</a>
                        <p class="price"><i>¥</i>`+item.price+`<i>/人起</i></p>
                    </div>
                </li>`
        });

        $(".feature-content").html(html);
    }

    function showDataHtml2(obj){
        var html="";

        $.each(obj,function(i,item){
            html+=`<li>
                   <a href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-img">
                        <img class="lazy" src="`+item.mainImage+`" >
                    </a>
                    <div class="ct-td">
                        <a href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-title">`+item.title+`</a>
                        <p class="price"><i>¥</i>`+item.price+`<i>/人起</i></p>
                    </div>
                </li>`
        });

        $(".rim-content").html(html);
    }

    function showDataHtml3(obj){
        var html="";

        $.each(obj,function(i,item){
            html+=`<li>
                   <a href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-img">
                        <img class="lazy" src="`+item.mainImage+`" >
                    </a>
                    <div class="ct-td">
                        <a  href="http://localhost:8080/product/detailView/`+item.pid+`" class="ct-title">`+item.title+`</a>
                        <p class="price"><i>¥</i>`+item.price+`<i>/人起</i></p>
                    </div>
                </li>`
        });

        $(".civil-content").html(html);
    }
</script>

</html>
