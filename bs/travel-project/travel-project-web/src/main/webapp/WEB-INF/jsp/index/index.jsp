<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>

</head>
<body>

<jsp:include page="navigation.jsp" flush="true" />
<link rel="stylesheet" href="/css/theme.css">
<link rel="stylesheet" href="/css/allstyle.css" />
<!--轮播-->
<div id="Carousels" class="row">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/images/test2.jpg" alt="First slide" style="width: 100%">
            </div>
            <div class="item">
                <img src="/images/test3.jpg" alt="Second slide" style="width: 100%">
            </div>
            <div class="item">
                <img src="/images/test.jpg" alt="Third slide" style="width: 100%">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">
        </a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">
        </a>
    </div>

    <!--输入框-->
    <div id="searchBox">
        <div id="radioGroup">

        </div>

        <div id="input_Group">
            <ul>
                <li class="show"><input type="text" id="searchInput" placeholder="搜索全部"><span class="indexIcon"></span></li>
                <li><input type="text" placeholder="目的地"><span class="indexIcon"></span></li>
                <li><input type="text" placeholder="游记"><span class="indexIcon"></span></li>
            </ul>
        </div>
    </div>
</div>
<!--目的地-->
<div class="content">

    <div class="like">
        <h3 class="section_title">
            最新信息
        </h3>
        <div class="row">
            <c:forEach begin='0' end='2'  items='${productList}' var='item'>
                <div class="col-xs-4 col-md-4">
                    <div class="modalImage">
                        <div class="images"><img src="${item.mainImage}"></div>
                        <div class="imageInfo">
                            <div class="viewSpots">
                                    <a href="http://localhost:8080/product/detailView/${item.pid}">${item.title}</a>


                            </div>
                            <div class="linkList">
                                <p class="price"><i>¥</i>${item.price}/<i>/人起</i></p>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!--第二屏-->
        <div class="row">
            <c:forEach begin='3' end='6'  items='${productList}' var='item'>
                <div class="col-xs-4 col-md-4">
                    <div class="modalImage">
                        <div class="images"><img src="${item.mainImage}"></div>
                        <div class="imageInfo">
                            <div class="viewSpots">
                                <a href="http://localhost:8080/product/detailView/${item.pid}">${item.title}</a>

                            </div>
                            <div class="linkList">
                                <p class="price"><i>¥</i>${item.price}/<i>/人起</i></p>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

    <div class="orage">
        <h3 class="section_title">
            主题活动
            <a href="#" class="more">更多主题活动</a>
        </h3>
        <div class="species">
            <ul class="list-species">
                <li>
                    <a href="/Search/index/product/3/ticketCategory/2">
                        <img class="lazy" src="../images/banner-05.png" data-original="../images//banner-05.png" style="display: inline;">
                        <!--<div class="kind">-->
                        <!--<b>游乐园&gt;</b>-->
                        <!--</div>-->
                    </a>
                </li>
                <li>
                    <a href="/Search/index/product/4">
                        <img class="lazy" src="../images//banner-06.png" data-original="../images//banner-06.png" style="display: inline;">
                        <!--<div class="kind">-->
                        <!--<b>温泉&gt;</b>-->
                        <!--</div>-->
                    </a>
                </li>
                <li>
                    <a href="/Search/index/product/3/ticketCategory/3">
                        <img class="lazy" src="../images//banner-07.png" data-original="../images//banner-07.png" style="display: inline;">
                        <!--<div class="kind">-->
                        <!--<b>古城美食&gt;</b>-->
                        <!--</div>-->
                    </a>
                </li>
                <li>
                    <a href="/Search/index/product/2">
                        <img class="lazy" src="../images//banner-08.png" data-original="../images//banner-08.png" style="display: inline;">
                        <!--<div class="kind">-->
                        <!--<b>特色活动&gt;</b>-->
                        <!--</div>-->
                    </a>
                </li>
                <li>
                    <a href="/Search/index/product/1">
                        <img class="lazy" src="../images//banner-09.png" data-original="../images//banner-09.png" style="display: inline;">
                        <!--<div class="kind">-->
                        <!--<b>更多种类&gt;</b>-->
                        <!--</div>-->
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="like">
        <h3 class="section_title">
            热门产品
        </h3>
        <div class="row">
            <c:forEach begin='0' end='2'  items='${hotPList}' var='item'>
                <div class="col-xs-4 col-md-4">
                    <div class="modalImage">
                        <div class="images"><img src="${item.mainImage}"></div>
                        <div class="imageInfo">
                            <div class="viewSpots">
                                <a href="http://localhost:8080/product/detailView/${item.pid}">${item.title}</a>

                            </div>
                            <div class="linkList">
                                <p class="price"><i>¥</i>${item.price}/<i>/人起</i></p>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!--第二屏-->
        <div class="row">
            <c:forEach begin='3' end='6'  items='${hotPList}' var='item'>
                <div class="col-xs-4 col-md-4">
                    <div class="modalImage">
                        <div class="images"><img src="${item.mainImage}"></div>
                        <div class="imageInfo">
                            <div class="viewSpots">
                                <a href="http://localhost:8080/product/detailView/${item.pid}">${item.title}</a>

                            </div>
                            <div class="linkList">
                                <p class="price"><i>¥</i>${item.price}/<i>/人起</i></p>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

    <div id="themeTour">
        <h3 class="section_title">
            目的地
            <a href="#" class="more">更多>>></a>
        </h3>
        <div class="themeTourItem">
            <img src="../images/15_d.jpg">
            <div class="themeTourImageHover">
                <h3>一切精华，尽在掌握</h3>
            </div>
        </div>

        <div class="themeTourItem ">
            <img src="../images/43_d.jpg">
            <div class="themeTourImageHover">
                <h3>一切精华，尽在掌握</h3>
            </div>
        </div>

        <div class="themeTourItem ">
            <img src="../images/50_d.jpg">
            <div class="themeTourImageHover">
                <h3>一切精华，尽在掌握</h3>
            </div>
        </div>

        <div class="themeTourItem ">
            <img src="../images/80_d.jpg">
            <div class="themeTourImageHover">
                <h3>一切精华，尽在掌握</h3>
            </div>
        </div>
    </div>

</div>


<div id="footer" class="row">
    <div class="ft-content">
        <dl class="ft-info-col ft-info-about">
            <dt>关于我们</dt>
            <dd><a>关于本网站</a></dd>
            <dd><a>网络信息侵权通知指引</a></dd>
            <dd><a>隐私政策</a></dd>
            <dd><a>服务协议</a></dd>
            <dd><a>联系我们</a></dd>
            <dd><a>加入我们</a></dd>
        </dl>

        <dl class="ft-info-col ft-info-service">
            <dt>旅行服务</dt>
            <dd><a>旅游攻略</a></dd>
            <dd><a>旅游特价</a></dd>
            <dd><a>旅游问答</a></dd>
            <dd><a>旅游保险</a></dd>
            <dd><a>旅游资讯</a></dd>
            <dd><a>旅游指南</a></dd>
        </dl>
        <dl class="ft-info-col ft-info-qrcode">
            <dd>
                <span class="ft-qrcode-tejia"></span>
                <p>本旅游网<br>官方微博号</p>
            </dd>
            <dd>
                <span class="ft-qrcode-weixin"></span>
                <p>本旅游网<br>官方订阅号</p>
            </dd>
        </dl>
    </div>
</div>

<script>
    $("#searchInput").keyup(function(){

        if(event.keyCode == 13){

            window.location.href="http://localhost:8080/productlistView";

        }

    });
</script>
</body>
</html>