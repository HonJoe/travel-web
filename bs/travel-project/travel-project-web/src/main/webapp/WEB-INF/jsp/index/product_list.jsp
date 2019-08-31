<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>旅行信息</title>
    <link rel="stylesheet" href="/css/allstyle.css" />


</head>
<body>
<jsp:include page="navigation.jsp" flush="true" />
<link rel="stylesheet" href="/css/jour.css">
<style>
    a:hover{
        text-decoration:none;
    }
</style>

<div class="main">
    <table></table>
    <div id="content" class="clear">

        <!-- 条件筛选-->
        <div class="search-main">

            <div class="seting" style="margin-bottom: 20px">
                <form id="form1" onsubmit="false">
                    <div class="row">
                        <div class="col-sm-4">出发地&nbsp;&nbsp;&nbsp;<input type="text" class="jour_input " name="startAreaname" style="line-height: 25px" id="searchvalue1" placeholder="出发地搜索"></div>
                        <div class="col-sm-4">目的地&nbsp;<input type="text" class="jour_input " style="line-height: 25px" name="endAreaname" placeholder="目的地搜索"></div>
                        <div class="col-sm-4">标题&nbsp;<input type="text" class="jour_input " style="line-height: 25px" id="title" name="title" placeholder="产品搜索"></div>
                    </div>
                    <input type="hidden" name="status" value="1">

                    <div class="row">
                        <div class="col-sm-4">旅游天数&nbsp;
                            <select  name="activeDays">
                                <option value="不限">不限</option>
                                <option value="1-2天" >1-2天</option>
                                <option value="3-5天">3-5天</option>
                                <option value="5天以上">5天以上</option>
                            </select>
                        </div>
                        <div class="col-sm-4">主题游玩类型&nbsp;
                            <select  name="type">
                                <option value="全部">全部</option>
                                <c:forEach items="${themes}" var="item" >
                                    <option value="${item.themeName}" >${item.themeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm-4"><button type="button" style="width: 60px;height: 30px;vertical-align:middle;line-height:22px;" id="searchvalue">查询</button></div>
                    </div>
                </form>


            </div>




            <!--内容-->
            <div class="search-ph">

                <div class="search-details" id="showtable">





                </div>

                <div id="pags" style="margin-bottom: 20px;">
                    <!-- 分页  -->
                    <div id="pagination" style="float:left;"></div>
                    <div id="showpagecount" style="display: inline-block;margin-left: 20px;height: 35px;line-height: 35px;"></div>
                </div>


                <!--条件筛选 end -->
            </div>

        </div>
    </div>
</div>
<%@ include file="foot.jsp"%>

</body>

<script type="text/javascript" src="/js/jq-paginator.js"></script>
<script>

    function init(){
        $.ajax({
            url:"http://localhost:8080/product/list",
            async: false,
            type:"POST",
            data:{
                status:1
            },
            dataType:"json",
            success:function(result){

                var data=result.data;
                //分页插件
                $.jqPaginator('#pagination', {
                    totalCounts:data.total,//总条目数
                    pageSize:10,//每一页的条目数
                    visiblePages:6,//最多显示的页码数
                    currentPage: 1,//当前的页码
                    wrapper:'<ul class="pagination" style="display: inline-block;padding-left: 0; margin: 0;border-radius: 4px;"></ul>',
                    first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
                    prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                    next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                    last: '<li class="last"><a href="javascript:void(0);">页尾</a></li>',
                    page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
                    onPageChange: function (pageIndex) {

                        $.ajax({
                            url:"http://localhost:8080/product/list",
                            async: false,
                            data:{
                                status:1,
                                current:pageIndex,
                                size:10
                            },
                            type:"post",
                            dataType:"json",
                            success:function(result){
                                var data=result.data;
                                totalData = data.total;
                                pageCount = data.pages;
                                var showTableHtml = "";

                                $.each(data.records,function(i,item){

                                    var tpUrl="http://localhost:8080/themeProduct/list/"+item.pid;
                                    var tpList;
                                    $.ajax({
                                        url : tpUrl,
                                        type : 'get',
                                        async: false,//使用同步的方式,true为异步方式
                                        success : function(data){
                                             tpList=data;
                                        }
                                    });
                                    var strTp="";
                                    $.each(tpList,function (n,value) {
                                        strTp+="<span class=''>"+value.themeName+"</span>"
//                                        console.log(value);
                                    } );



                                    showTableHtml +=
                                        "<div class='details-list'>"+
                                        "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>"+
                                        "<div class='details-img'>"+
                                        "<img src='"+item.mainImage+"' width='100%' height='100%'>"+
                                        "</div>"+
                                        "</a>"+
                                        "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>"+
                                        "<div class='introduce'>"+
                                        "<h3>"+item.title+"</h3>"+
                                        "<p>产品特色："+strTp+


                                        "</p>"+
                                        "<p>出发城市："+item.startAreaname+"</p>"+
                                        "<p>目标城市："+item.endAreaname+"</p>"+
                                        "</div>"+
                                        "</a>"+
                                        "<div class='details-buy'>"+
                                        "<p>&yen;<span>"+item.price+"</span>/人起</p>"+
                                        "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>立即预订</a>"+
                                        "</div>"+
                                        "</div>";
                                });

                                $("#showtable").html(showTableHtml);
                                //显示分页数字
                                $("#showpagecount").html("<span> 共"+pageCount+"页，"+totalData+"条</span>");
                            },
                            error:function(){
                                $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>网络异常...</td></tr>");
                                //隐藏分页div块
                                $("#pags").css("display","none");
                            }
                        });

                    }
                });
            },
            error:function(){
                $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>网络异常...</td></tr>");
                //隐藏分页div块
                $("#pags").css("display","none");
            }
        });
    }

    $("#searchvalue").click(function() {//给输入框绑定按键事件
        var data = $("#form1").serialize();
        data= decodeURIComponent(data,true);

        subData(data);

    })

    $(function() {
        //初始化分页
        init();

    });

    function subData(data) {
        console.log("提交数据:"+data);
        $.ajax({
            url:"http://localhost:8080/product/list",
            async: false,
            type:"POST",
            data:data,
            dataType:"json",
            success:function(result){

                if (result.data.total!=0) {

                    console.log("第一次提交数据:");
                    console.log(result);
                    //分页插件
                    $.jqPaginator('#pagination', {
                        totalCounts:result.data.total,//总条目数
                        pageSize:10,//每一页的条目数
                        visiblePages:6,//最多显示的页码数
                        currentPage: 1,//当前的页码
                        wrapper:'<ul class="pagination" style="display: inline-block;padding-left: 0; margin: 0;border-radius: 4px;"></ul>',
                        first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
                        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                        last: '<li class="last"><a href="javascript:void(0);">页尾</a></li>',
                        page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
                        onPageChange: function (pageIndex) {
                            var newdata=data+"&current="+pageIndex;

                            console.log("拼装后的数据"+data);
                            $.ajax({
                                url:"http://localhost:8080/product/list",
                                async: false,
                                data:newdata,
                                type:"post",
                                dataType:"json",
                                success:function(result){
                                    console.log("二次提交的数据");
                                    console.log(result);
                                    var data=result.data;
                                    totalData = data.total;
                                    pageCount = data.pages;
                                    var showTableHtml = "";

                                    $.each(data.records,function(i,item){

                                        var tpUrl="http://localhost:8080/themeProduct/list/"+item.pid;
                                        var tpList;
                                        $.ajax({
                                            url : tpUrl,
                                            type : 'get',
                                            async: false,//使用同步的方式,true为异步方式
                                            success : function(data){
                                                tpList=data;
                                            }
                                        });
                                        var strTp="";
                                        $.each(tpList,function (n,value) {
                                            strTp+="<span class=''>"+value.themeName+"</span>"
//                                        console.log(value);
                                        } );



                                        showTableHtml +=
                                            "<div class='details-list'>"+
                                            "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>"+
                                            "<div class='details-img'>"+
                                            "<img src='"+item.mainImage+"' width='100%' height='100%'>"+
                                            "</div>"+
                                            "</a>"+
                                            "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>"+
                                            "<div class='introduce'>"+
                                            "<h3>"+item.title+"</h3>"+
                                            "<p>产品特色："+strTp+


                                            "</p>"+
                                            "<p>出发城市："+item.startAreaname+"</p>"+
                                            "<p>目标城市："+item.endAreaname+"</p>"+
                                            "</div>"+
                                            "</a>"+
                                            "<div class='details-buy'>"+
                                            "<p>&yen;<span>"+item.price+"</span>/人起</p>"+
                                            "<a href='http://localhost:8080/product/detailView/"+item.pid+"'>立即预订</a>"+
                                            "</div>"+
                                            "</div>";
                                    });

                                    $("#showtable").html(showTableHtml);
                                    //显示分页数字
                                    $("#showpagecount").html("<span> 共"+pageCount+"页，"+totalData+"条</span>");
                                },
                                error:function(){
                                    $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>网络异常...</td></tr>");
                                    //隐藏分页div块
                                    $("#pags").css("display","none");
                                }
                            });

                        }
                    });

                }
                else{
                        $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>暂无数据</td></tr>");
                        //隐藏分页div块
                        $("#pags").css("display","none");
                 }

            },
            error:function(){
                $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>网络异常...</td></tr>");
                //隐藏分页div块
                $("#pags").css("display","none");
            }

        });
    }

</script>




</html>
