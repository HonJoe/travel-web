<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/8
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>后台首页</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet" />
</head>
<body>
<%@ include file="nav.jsp"%>


<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="row" style="margin-top: 20px;">
            <div class="col-sm-3 col-sm-12 col-xs-12">
                <div class="panel panel-primary text-center no-boder bg-color-green">
                    <div class="panel-body">
                        <i class="fa fa-bar-chart-o fa-5x"></i>
                        <h3>${pnum}</h3>
                    </div>
                    <div class="panel-footer back-footer-green">
                        产品数量

                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-12 col-xs-12">
                <div class="panel panel-primary text-center no-boder bg-color-blue">
                    <div class="panel-body">
                        <i class="fa fa-shopping-cart fa-5x"></i>
                        <h3>${onum} </h3>
                    </div>
                    <div class="panel-footer back-footer-blue">
                        订单

                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-12 col-xs-12">
                <div class="panel panel-primary text-center no-boder bg-color-red">
                    <div class="panel-body">
                        <i class="fa fa fa-comments fa-5x"></i>
                        <h3>${cusnum} </h3>
                    </div>
                    <div class="panel-footer back-footer-red">
                        定制消息

                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-sm-12 col-xs-12">
                <div class="panel panel-primary text-center no-boder bg-color-brown">
                    <div class="panel-body">
                        <i class="fa fa-users fa-5x"></i>
                        <h3>${usernum} </h3>
                    </div>
                    <div class="panel-footer back-footer-brown">
                        用户数

                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- Bootstrap Js -->
<script src="/assets/js/bootstrap.min.js"></script>

<!-- Morris Chart Js -->
<script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="/assets/js/morris/morris.js"></script>
</body>
</html>
