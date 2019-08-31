<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/1
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品列表</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
<%@ include file="nav.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">产品列表</h2>
        </div>
        <section class="mtb">

            <input type="text" id="title" class="textbox textbox_225" placeholder="输入标题查询..." />
            <input type="button" value="查询" class="group_btn" onclick="subForm()"/>
        </section>
        <table class="table table-bordered">
            <thead>
            <tr>

                <th>标题</th>
                <th>价格</th>
                <th>活动天数</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>对应产品销售操作</th>
                <th>创建时间</th>
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

<script>
    function del(obj) {
        var id=$(obj).attr("value");
        console.log(id);
        if(confirm("确实要删除吗？")){
            $.ajax({
                type:"GET",
                url:"http://localhost:8080/manager/product/delete/"+id,
                dataType:"json",
                success:function(obj){
                    if(obj.status==200){
                        alert("删除成功");
                        window.location.href="http://localhost:8080/manager/product/listView";
                    }

                }
            })

        }else {
            alert("已经取消了删除操作");
        }

    }
</script>
<script type="text/javascript" src="/js/jq-paginator.js"></script>
<script>

    function init(){
        $.ajax({
            url:"http://localhost:8080/product/list",
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
                            url:"http://localhost:8080/product/list",
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
                                    var edtior="<td class='center'><a href='http://localhost:8080/manager/product/updateView/"+item.pid+"' title='编辑' class='link_icon'>&#101;</a><a  title='删除' class='link_icon'value='"+item.pid+"' onclick='del(this)'>&#100;</a> </td>";
                                    showTableHtml += "<tr>"+
                                        /*"<th><input type='checkbox' name='id' value="+item.title+"></th>"+*/
                                        "<td style=\"padding-left: 20px;max-width: 200px;\">"+item.title+"</td>"+
                                        "<td style=\"padding-left: 20px;\">"+item.price+"</td>"+
                                        "<td style='text-align: center;'>"+item.activeDays+"</td>"+
                                        "<td style='text-align: center;'>"+item.startAreaname+"</td>"+
                                        "<td style='text-align: center;'>"+item.endAreaname+"</td>"+
                                        "<td style='text-align: center;'><a href='http://localhost:8080/manager/productSell/addView?pid="+item.pid+"&title="+item.title+"&price="+item.price+"'> 新增</a>    <a href='http://localhost:8080/manager/productSell/listView/"+item.pid+"'> 查看</a></td>"+
                                        "<td style='text-align: center;'>"+item.createTime+"</td>"+
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
    //提交事件
    function subForm(){
        //获取输入框值
        var title=$("#title").val();
        console.log(title);
        $.ajax({
            url:"http://localhost:8080/product/list",
            data:{
                title:title,
                size:10
            },
            async: false,
            type:"POST",
            dataType:"json",
            success:function(result){
                console.log(result);
                var data=result.data;
                if (data.total!=0) {
                    //分页插件
                    $.jqPaginator('#pagination', {
                        totalCounts:data.total,//总条目数
                        pageSize:10,//每一页的条目数，要跟page类里值一样，不然显示的值对不上
                        visiblePages:6,//最多显示的页码数
                        currentPage: 1,//当前的页码
                        wrapper:'<ul class="pagination" style="display: inline-block;padding-left: 0; margin: 0;border-radius: 4px;"></ul>',
                        first: '<li class="first"><a href="javascript:void(0);">首页</a></li>',
                        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                        last: '<li class="last"><a href="javascript:void(0);">页尾</a></li>',
                        page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
                        onPageChange: function (pageIndex) {
                            console.log(title);
                            $.ajax({
                                url:"http://localhost:8080/product/list",
                                async: false,
                                data:{
                                    current:pageIndex,
                                    title:title,
                                    size:10
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
                                        var edtior="<td class='center'><a href='http://localhost:8080/manager/product/updateView/"+item.pid+"' title='编辑' class='link_icon'>&#101;</a><a  title='删除' class='link_icon'value='"+item.pid+"' onclick='del(this)'>&#100;</a> </td>";
                                        showTableHtml += "<tr>"+
                                                /*"<th><input type='checkbox' name='id' value="+item.title+"></th>"+*/
                                            "<td style=\"padding-left: 20px;max-width: 200px;\">"+item.title+"</td>"+
                                            "<td style=\"padding-left: 20px;\">"+item.price+"</td>"+
                                            "<td style='text-align: center;'>"+item.activeDays+"</td>"+
                                            "<td style='text-align: center;'>"+item.startAreaname+"</td>"+
                                            "<td style='text-align: center;'>"+item.endAreaname+"</td>"+
                                            "<td style='text-align: center;'><a href='http://localhost:8080/manager/productSell/addView?pid="+item.pid+"&title="+item.title+"&price="+item.price+"'> 新增</a>    <a href='http://localhost:8080/manager/productSell/listView/"+item.pid+"'> 查看</a></td>"+
                                            "<td style='text-align: center;'>"+item.createTime+"</td>"+
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
