<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>产品修改</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet"href="/css/kuCity.css" />

    <!-- 图片上传即使预览插件 -->
    <link rel="stylesheet" href="/css/bootstrap-fileinput.css">

</head>
<body>
<%@ include file="nav.jsp"%>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">产品信息</h2>

        </div>
        <form class="form-horizontal" role="form" onsubmit="return false;" id="form1">
            <div class="form-group">
                <label  class="col-sm-2 control-label">产品标题</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title"  required="required" value="${product.title}">


                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">产品封面</label>
                <div class="col-sm-10" style="max-width: 300px;">
                    <input type="file" name="uploadFile" data-ref="url2"class="col-sm-10 myfile" value="" />
                    <input type="hidden" name="mainImage" id="mainImage" value="${product.mainImage}">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">价格</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="price" name="price" value="${product.price}" onkeyup="clearNoNum(this)" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">出发地</label>
                <div class="col-sm-3">
                    <input type="text" id="startAreaname" class="form-control" name="startAreaname" required="required" value="${product.startAreaname}">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">目的地</label>
                <div class="col-sm-3">
                    <input type="text" id="endAreaname" class="form-control" name="endAreaname" required="required" value="">
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">旅游天数</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="activeDays" name="activeDays" value="${product.activeDays}" required="required" onkeyup="clearNoNum(this)"/>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">主题类型</label>
                <div class="col-sm-10">
                    <c:forEach items="${theme}" var="key">

                        <label class="checkbox-inline">
                            <input type="checkbox" name="themeName"  value="${key.themeName}"
                                <c:forEach items="${tp}" var="tp">
                                    ${tp.themeName == key.themeName ? 'checked' : ""}
                                </c:forEach>

                            >${key.themeName}
                        </label>
                    </c:forEach>

                </div>

            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">是否上架</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="status" id="inlineRadio1" value="1" ${product.status == 1 ? 'checked' : ""}> 是
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="status" id="inlineRadio2" value="2" ${product.status == 2 ? 'checked' : ""}> 否
                    </label>
                </div>
            </div>

            <div class="form-group" style="padding-top: 40px;">
                <label  class="col-md-2 control-label">景点介绍</label>
                <div class="col-md-10" id="div1">
                </div>
            </div>
            <input type="hidden" name="scenicDesc" id="scenicDesc" />
            <div class="form-group" style="padding-top: 40px;">
                <label  class="col-md-2 control-label">行程安排</label>
                <div class="col-md-10" id="div2">
                </div>
            </div>
            <input type="hidden" name="tripDesc" id="tripDesc"/>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit"  class="btn btn-default" onclick="sub()" >
                </div>
            </div>
        </form>
    </div>
</section>
<script type="text/javascript" src="/js/fileinput.min.js"></script>
<!-- 这个是汉化-->
<script type="text/javascript" src="/js/zh.js"></script>
<script type="text/javascript" src="/js/kuCity.js"></script>
<script>
    /*bootstrap fileupload*/
    $(".myfile").fileinput({
        //上传的地址
        uploadUrl:"http://localhost:8080/pic/upload1",
        uploadAsync : true, //默认异步上传
        showUpload : false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption : true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域

        maxFileCount : 1, //表示允许同时上传的最大文件个数
        enctype : 'multipart/form-data',
        validateInitialCount : true,
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes : [ 'image' ],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    })
    //异步上传返回结果处理
    $('.myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $(".myfile").on("fileuploaded", function(event, data, previewId, index) {
//        console.log("fileuploaded");
        var ref = $(this).attr("data-ref");
        $("input[name='" + ref + "']").val(data.response.data);
        $('#mainImage').val(data.response.data);

    });
    /*city js*/
    $('#startAreaname').kuCity();
    $('#endAreaname').kuCity();
</script>
<!--wangeditor-->
<script type="text/javascript" src="/js/wangEditor.min.js"></script>

<script>
    var E = window.wangEditor

    var editor = new E('#div1')
    editor.customConfig.showLinkImg = false
    editor.customConfig.uploadFileName = 'uploadFile'
    editor.customConfig.uploadImgServer = 'http://localhost:8080/pic/upload1'
    // 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = false
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            var url =result.data;
            insertImg(url);
        }
    }
    editor.create()
    editor.txt.html('${productDesc.scenicDesc}')

    var editor2 = new E('#div2')
    editor2.customConfig.showLinkImg = false
    editor2.customConfig.uploadFileName = 'uploadFile'
    editor2.customConfig.uploadImgServer = 'http://localhost:8080/pic/upload1'
    // 关闭粘贴样式的过滤
    editor2.customConfig.pasteFilterStyle = false
    editor2.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            var url =result.data;
            insertImg(url);
        }
    }
    editor2.create()
    editor2.txt.html('${productDesc.tripDesc}')

    function sub(){
        if (checkNum()==false){
            return;
        }
        var title=$("#title").val;var price=$("#price").val();
        if(title==""){
            alert("标题不能为空");
            return false;
        }
        if(price==""){
            alert("价格不能为空");
            return false;
        }

//			alert(editor.txt.html());
        $("#scenicDesc").val(editor.txt.html());
        $("#tripDesc").val(editor2.txt.html());
        var data = $("#form1").serialize();
        console.log(data);
        var targetUrl="http://localhost:8080/manager/product/update/"+${product.pid};
        $.ajax({
            type:'post',
            url:targetUrl,
            cache: false,
            data:data,
            dataType:'json',
            success:function(result){
                if(result.status==200){
                    alert("保存成功");
                    window.location.href="http://localhost:8080/manager/product/listView";
                }

            },
            error:function(error){
                console.log(error);

            }
        });
    }

    function checkNum() {
        var ipts = document.getElementsByName('themeName'), num = 0;
        for (var i = 0; i < ipts.length; i++) if (ipts[i].checked) num++;
        if(num<1){
            alert("至少要选择一个复选框");
            return false;
        }
    }

    function checkIsIllegal(){
        var title;var price;var activeNum ;var activeDays ;var startareaName ;var endAreaname ;

    }

    function clearNoNum(obj){
        obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
        if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
            obj.value= parseFloat(obj.value);
        }
    }
</script>


</body>
</html>
