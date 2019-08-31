<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
<%@ include file="nav.jsp"%>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">订单列表</h2>
        </div>
        <section class="mtb">

            <input type="text" id="keyword" class="textbox textbox_225" placeholder="输入用户名称/订单号..." />
            <input type="button" value="查询" class="group_btn" onclick="subForm()"/>
        </section>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>订单号</th>
                <th>下单用户</th>
                <th>用户联系号码</th>
                <th>商品id</th>
                <th>商品数量</th>
                <th>订单金额</th>
                <th>支付时间</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="showtable">
            </tbody>


        </table>

        <div id="pags">
            <!-- 分页  -->
            <div id="pagination" style="float:left;"></div>
            <div id="showpagecount" style="display: inline-block;margin-left: 20px;height: 35px;line-height: 35px;"></div>
        </div>


    </div>
</section>

</body>
<script type="text/javascript" src="/js/jq-paginator.js"></script>
<script>

    function init(){
        $.ajax({
            url:"http://localhost:8080/manager/productOrder/list",
            async: false,
            type:"get",
            dataType:"json",
            success:function(result){
                var total=result.data.total;
                //分页插件
                $.jqPaginator('#pagination', {
                    totalCounts:total,//总条目数
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
                            url:"http://localhost:8080/manager/productOrder/list",
                            async: false,
                            data:{
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
                                    var edtior="<td class='center'><a href='http://localhost:8080/manager/productOrder/detailView/"+item.id+"' title='查看' class='link_icon'>&#118;</a> </td>";
                                    showTableHtml += "<tr>"+
                                        "<td style=\"padding-left: 20px;\">"+item.orderNo+"</td>"+
                                        "<td style='text-align: center;'>"+item.username+"</td>"+
                                        "<td style='text-align: center;'>"+item.phone+"</td>"+
                                        "<td style='text-align: center;'>"+item.productId+"</td>"+
                                        "<td style='text-align: center;'>"+item.pruductNum+"</td>"+
                                        "<td style='text-align: center;'>"+item.payment+"</td>"+
                                        "<td style='text-align: center;'>"+item.paymentTime+"</td>"+
                                        "<td style='text-align: center;'>"+'已预订'+"</td>"+
                                        edtior;
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

    $(function() {
        //初始化分页
        init();

    });
    //提交事件
    function subForm(){
        //获取输入框值
        var keyword=$("#keyword").val();

        $.ajax({
            url:"http://localhost:8080/manager/productOrder/list",
            data:{
                keyword:keyword,
                size:5
            },
            async: false,
            type:"post",
            dataType:"json",
            success:function(result){
                console.log(result);
                var data=result.data;
                if (data.total!=0) {
                    //分页插件
                    $.jqPaginator('#pagination', {
                        totalCounts:data.total,//总条目数
                        pageSize:5,//每一页的条目数，要跟page类里值一样，不然显示的值对不上
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
                                url:"http://localhost:8080/manager/productOrder/list",
                                async: false,
                                data:{
                                    current:pageIndex,
                                    keyword:keyword,
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
                                        var edtior="<td class='center'><a href='http://localhost:8080/manager/productOrder/detailView/"+item.id+"' title='查看' class='link_icon'>&#118;</a> </td>";
                                        showTableHtml += "<tr>"+
                                            "<td style=\"padding-left: 20px;\">"+item.orderNo+"</td>"+
                                            "<td style='text-align: center;'>"+item.username+"</td>"+
                                            "<td style='text-align: center;'>"+item.phone+"</td>"+
                                            "<td style='text-align: center;'>"+item.productId+"</td>"+
                                            "<td style='text-align: center;'>"+item.pruductNum+"</td>"+
                                            "<td style='text-align: center;'>"+item.payment+"</td>"+
                                            "<td style='text-align: center;'>"+item.paymentTime+"</td>"+
                                            "<td style='text-align: center;'>"+'已预订'+"</td>"+
                                            edtior;
                                    });

                                    $("#showtable").html(showTableHtml);
                                    //显示分页数字
                                    $("#showpagecount").html("<span> 共"+pageCount+"页，"+totalData+"条</span>");
                                    //显示分页div块
                                    $("#pags").css("display","inline-block");
                                },
                                error:function(){
                                    $("#showtable").html("<tr><td style='padding: 160px;text-align: center;' colspan='5'>网络异常...</td></tr>");
                                    //隐藏分页div块
                                    $("#pags").css("display","none");
                                }
                            });

                        }
                    });

                }else{
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
