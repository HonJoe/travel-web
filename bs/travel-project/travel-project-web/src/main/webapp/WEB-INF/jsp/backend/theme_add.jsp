<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>主题</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>
<body>
<%@ include file="nav.jsp"%>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">主题信息</h2>
        </div>
        <form class="form-horizontal" id="form1">
            <div class="form-group">
                <label  class="col-sm-2 control-label">主题名称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="themeName" name="themeName" placeholder="themeName" value="${theme.themeName}">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">简介</label>
                <div class="col-sm-4">
                    <textarea class="form-control" rows="3" id="detail" name="detail">${theme.detail}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">

                    <c:choose>
                        <c:when test="${empty theme}">
                            <button type="button" class="btn btn-default" id="sub" >保存</button>
                        </c:when>
                        <c:otherwise>
                            <button type="button"  class="btn btn-default" id="update" >修改</button>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </form>
    </div>
</section>
<script>

    $("#sub").click(function(){
        var themeName = $("#themeName").val();//取值
        var detail = $("#detail").val();
        if(!themeName){
            alert("名称必填!");
            $("#themeName").focus();//获取焦点
            return false;
        }
        if(!detail){
            alert("简介必填!");
            $("#detail").focus();//获取焦点
            return false;
        }
        var data = $("#form1").serialize();
        var targetUrl="http://localhost:8080/manager/theme/save";
        $.ajax({
            type:'post',
            url:targetUrl,
            cache: false,
            data:data,
            dataType:'json',
            success:function(result){
                console.log(result);
                if(result.status==200){
                    alert("保存成功");
                     window.location.href="http://localhost:8080/admin/themelist";
                }

            },
            error:function(error){

                console.log(error);

            }
        })


    })

    $("#update").click(function(){
        var themeName = $("#themeName").val();//取值
        var detail = $("#detail").val();
        if(!themeName){
            alert("名称必填!");
            $("#themeName").focus();//获取焦点
            return false;
        }
        if(!detail){
            alert("简介必填!");
            $("#detail").focus();//获取焦点
            return false;
        }
        var data = $("#form1").serialize();
        var id="${theme.id}";
        var targetUrl="http://localhost:8080/manager/theme/update/"+id;
        $.ajax({
            type:'post',
            url:targetUrl,
            cache: false,
            data:data,
            dataType:'json',
            success:function(result){
                if(result.status==200){
                    alert("保存成功");
                    window.location.href="http://localhost:8080/admin/themelist";
                }

            },
            error:function(error){
                console.log(error);

            }
        })
    })
</script>
</body>
</html>
