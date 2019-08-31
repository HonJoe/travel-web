<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 19:15
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
<%@ include file="nav.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">

        </div>

        <div id="content">
            <div class="custom-made">

                <div class="cus-tourism-list">

                    <div class="tourism-custom J_travel">

                        <form  method="post" name="travel-cus" class="cusForm">
                            <h1>订单信息</h1>
                            <ul class="cus-table">
                                <li>
                                    <label>订单编号：</label>
                                    <div class="cus-mold">
                                        <label>${order.orderNo}</label>
                                    </div>
                                </li>
                                <li>
                                    <label>下单用户id：</label>
                                    <label>${order.userId}</label>

                                </li>
                                <li>
                                    <label>商品id：</label>
                                    <label>${order.productId}</label>
                                </li>
                                <li>
                                    <label>商品销售记录id：</label>
                                    <label>${order.productsellId}</label>

                                </li>
                                <li>
                                    <label>  商品数量：</label>
                                    <label>${order.pruductNum}</label>
                                </li>
                                <li>
                                    <label>  订单金额：</label>
                                    <label>${order.payment}</label>
                                </li>
                                <li>
                                    <label>下单时间：</label>
                                    <label>><fmt:formatDate value="${order.paymentTime}" pattern="yyyy-MM-dd"/></label>

                                </li>
                                <li>
                                    <label>联系人：</label>
                                    <label>${order.username}</label>

                                </li>
                                <li>
                                    <label>  联系号码：</label>
                                    <label>${order.phone}</label>
                                </li>

                                <li>
                                    <label>  备注：</label>
                                    <label>${order.remarks}</label>
                                </li>

                            </ul>


                        </form>

                    </div>



                </div>

            </div>

        </div>
        <!--content end-->
    </div>
</section>
</body>
</html>
