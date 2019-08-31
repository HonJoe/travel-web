
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/2/26
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>定制信息</title>
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
                    <!-- 旅游定制-->
                    <div class="tourism-custom J_travel">
                        <!-- 需求信息-->
                        <form action="/User/customdemand" method="post" name="travel-cus" class="cusForm">
                            <h1>需求信息</h1>
                            <ul class="cus-table">
                                <li>
                                    <label>出游类型：</label>
                                    <div class="cus-mold">
                                        <span class="active" data-v="group">团体定制</span>
                                    </div>
                                </li>
                                <li>
                                    <label>出发地：</label>
                                    <label>${customization.startAreaname}</label>

                                </li>
                                <li>
                                    <label>目的地：</label>
                                    <label>${customization.endAreaname}</label>
                                </li>
                                <li>
                                    <label>出发时间：</label>
                                    <label><fmt:formatDate value="${customization.startDate}" pattern="yyyy-MM-dd"/></label>

                                </li>
                                <li>
                                    <label>活动天数：</label>
                                    <label>${customization.days}</label>

                                </li>
                                <li>
                                    <label>出发人数：</label>
                                    <label>${customization.number}</label>

                                </li>
                                <li>
                                    <label>  人均消费：</label>
                                    <label>${customization.percapitaConsumption}</label>
                                </li>
                                <li>
                                    <label>  联系人：</label>
                                    <label>${customization.personName}</label>
                                </li>
                                <li>
                                    <label>  联系电话：</label>
                                    <label>${customization.phone}</label>
                                </li>
                                <li>
                                    <label>  备注：</label>
                                    <label>${customization.remarks}</label>
                                </li>

                            </ul>
                            <input type="button" class="cus-btn" value="设为已读" id="send" onclick="setIsReaded()"/>

                        </form>

                    </div>
                    <!-- 旅游定制 end-->


                </div>

            </div>

        </div>
        <!--content end-->
    </div>
</section>
<script>
    function setIsReaded() {
        var id="${customization.id}";
        var url="http://localhost:8080/manager/customization/update/"+id+"?status=1";
        $.get(url, function(data){
            if(data.status==200){
                alert("设置成功" );
            }

        })
    }
</script>
</body>
</html>
