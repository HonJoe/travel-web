<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    System.out.println("basePath:"+basePath);
%>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />

</head>
<body>
<%@ include file="nav.jsp"%>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">会员列表</h2>
            <a href="user_detail.html" class="fr top_rt_btn add_icon">添加新会员</a>
        </div>
        <section class="mtb">

            <input type="text" id="keyword" class="textbox textbox_225" placeholder="输入会员号/手机/电子邮件查询..." />
            <input type="button" value="查询" class="group_btn" onclick="subForm()"/>
        </section>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>用户账号</th>
                    <th>用户密码</th>
                    <th>手机号码</th>
                    <th>电子邮件</th>
                    <th>性别</th>
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
                type:"POST",
                url:"http://localhost:8080/manager/user/delete",
                data:{
                    id:id
                },
                dataType:"json",
                success:function(obj){
                    if(obj.status==200){
                        alert("删除成功");
                        window.location.href="http://localhost:8080/admin/userlist";
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
            url:"http://localhost:8080/manager/user/count",
            async: false,
            type:"get",
            dataType:"json",
            success:function(data){

                //分页插件
                $.jqPaginator('#pagination', {
                    totalCounts:data,//总条目数
                    pageSize:5,//每一页的条目数
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
                            url:"http://localhost:8080/manager/user/list",
                            async: false,
                            data:{
                                current:pageIndex,
                                size:5
                            },
                            type:"post",
                            dataType:"json",
                            success:function(result){

                                var data=result.data;
                                totalData = data.total;
                                pageCount = data.pages;
                                var showTableHtml = "";

                                $.each(data.records,function(i,item){
                                    var edtior="<td class='center'><a href='http://localhost:8080/manager/user/updateView/"+item.id+"' title='编辑' class='link_icon'>&#101;</a><a  title='删除' class='link_icon'value='"+item.id+"' onclick='del(this)'>&#100;</a> </td>";
                                    showTableHtml += "<tr>"+
                                        "<th><input type='checkbox' name='id' value="+item.id+"></th>"+
                                        "<td style=\"padding-left: 20px;\">"+item.username+"</td>"+
                                        "<td style='text-align: center;'>"+item.password+"</td>"+
                                        "<td style='text-align: center;'>"+item.phone+"</td>"+
                                        "<td style='text-align: center;'>"+item.email+"</td>"+
                                        "<td style='text-align: center;'>"+item.sex+"</td>"+
                                        "<td style='text-align: center;'>"+item.createTime+"</td>"+
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
        var usernameCont=$("#keyword").val();

        $.ajax({
            url:"http://localhost:8080/manager/user/list",
            data:{
                keyword:usernameCont,
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
                                url:"http://localhost:8080/manager/user/list",
                                async: false,
                                data:{
                                    current:pageIndex,
                                    keyword:usernameCont,
                                    size:5
                                },
                                type:"post",
                                dataType:"json",
                                success:function(result){
                                    var data=result.data;
                                    totalData = data.total;
                                    pageCount = data.pages;
                                    var showTableHtml = "";
                                    $.each(data.records,function(i,item){
                                        var edtior="<td class='center'><a href='http://localhost:8080/manager/user/updateView/"+item.id+"' title='编辑' class='link_icon'>&#101;</a><a  title='删除' class='link_icon'value='"+item.id+"' onclick='del(this)'>&#100;</a> </td>";
                                        showTableHtml += "<tr>"+
                                            "<th><input type='checkbox' name='id' value="+item.id+"></th>"+
                                            "<td style=\"padding-left: 20px;\">"+item.username+"</td>"+
                                            "<td style='text-align: center;'>"+item.password+"</td>"+
                                            "<td style='text-align: center;'>"+item.phone+"</td>"+
                                            "<td style='text-align: center;'>"+item.email+"</td>"+
                                            "<td style='text-align: center;'>"+item.sex+"</td>"+
                                            "<td style='text-align: center;'>"+item.createTime+"</td>"+
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
