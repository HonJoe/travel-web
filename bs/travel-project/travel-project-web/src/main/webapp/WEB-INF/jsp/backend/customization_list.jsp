<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/2/26
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>定制消息列表</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
<%@ include file="nav.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">定制消息列表</h2>

        </div>
        <section class="mtb" >
            <select class="select" onchange="gradeChange(this.value)">
                <option value="查看全部">查看全部</option>
                <option value="查看未读">查看未读</option>

            </select>

        </section>
        <table class="table">
            <thead>
            <tr>
                <th>联系人</th>
                <th>手机号码</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>出发日期</th>
                <th>活动天数</th>
                <th>出发人数</th>
                <th>人均消费</th>

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


<script type="text/javascript" src="/js/jq-paginator.js"></script>

<script>
    function init(){
        $.ajax({
            url:"http://localhost:8080/manager/customization/list",
            async: false,
            type:"get",
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
                            url:"http://localhost:8080/manager/customization/list",
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
                                    var edtior="<td class='center'><a href='http://localhost:8080/manager/customization/detailView/"+item.id+"' title='预览' class='link_icon' >&#118;</a></td>";
                                    showTableHtml += "<tr>"+
                                        "<td style=\"padding-left: 20px;\">"+item.personName+"</td>"+
                                        "<td style=\"padding-left: 20px;\">"+item.phone+"</td>"+
                                        "<td style='text-align: center;'>"+item.startAreaname+"</td>"+
                                        "<td style='text-align: center;'>"+item.endAreaname+"</td>"+
                                        "<td style='text-align: center;'>"+item.startDate+"</td>"+
                                        "<td style='text-align: center;'>"+item.days+"</td>"+
                                        "<td style='text-align: center;'>"+item.number+"</td>"+
                                        "<td style='text-align: center;'>"+item.percapitaConsumption+"</td>"+
                                        edtior+"</tr>";
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
    
    function gradeChange(value) {
        console.log(value)
        var status;
        if (value =="查看未读"){
            status="0";
        }else{
            status="";
        }
        console.log(status);
        $.ajax({
            url:"http://localhost:8080/manager/customization/list",
            data:{
                status:status
            },
            async: false,
            type:"post",
            dataType:"json",
            success:function(result){

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
                                url:"http://localhost:8080/manager/customization/list",
                                async: false,
                                data:{
                                    current:pageIndex,
                                    status:status
                                },
                                type:"post",
                                dataType:"json",
                                success:function(result){
                                    console.log(result);
                                    var data=result.data;
                                    totalData = data.total;
                                    pageCount = data.pages;
                                    var showTableHtml = "";
                                    $.each(data.records,function(i,item){
                                        var edtior="<td class='center'><a href='http://localhost:8080/manager/customization/detailView/"+item.id+"' title='预览' class='link_icon' >&#118;</a></td>";
                                        showTableHtml += "<tr>"+

                                            "<td style=\"padding-left: 20px;\">"+item.personName+"</td>"+
                                            "<td style=\"padding-left: 20px;\">"+item.phone+"</td>"+
                                            "<td style='text-align: center;'>"+item.startAreaname+"</td>"+
                                            "<td style='text-align: center;'>"+item.endAreaname+"</td>"+
                                            "<td style='text-align: center;'>"+item.startDate+"</td>"+
                                            "<td style='text-align: center;'>"+item.days+"</td>"+
                                            "<td style='text-align: center;'>"+item.number+"</td>"+
                                            "<td style='text-align: center;'>"+item.percapitaConsumption+"</td>"+
                                            edtior+"</tr>";
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
</body>
</html>
