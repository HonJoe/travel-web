<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" href="/css/bootstrap-datepicker.css"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
</head>
<body>
<%@ include file="nav.jsp"%>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">产品销售信息</h2>

        </div>
        <form class="form-horizontal" id="form1">
            <div class="form-group">
                <label  class="col-sm-2 control-label">产品名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="pName" name="pName"  readonly="readonly" value="${title}">
                </div>

            </div>
            <input type="hidden" name="pid" value="${pid}"/>
            <div class="form-group">
                <label  class="col-sm-2 control-label">价格</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="pPrice" id="price" required="required" value="${price}"  onkeyup="clearNoNum(this)" >
                </div>
            </div>

            <div class="form-group">
                <label  class="col-sm-2 control-label">单次库存</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control"   name="stock" id="stock" required="required" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">起始日期</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control cus-start-time" required="required"  name="startDate" id="startDate">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">新增连续天数</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" required="required"  name="days" id="days" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" id="save" >保存</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!--日期插件-->
<script type="text/javascript" src="/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
<script>
    $(function(){
        //   时间插件
        $(".cus-start-time").datepicker({
            'language': 'zh-CN',
            'format': 'yyyy-m-d',
            startDate:new Date(),//最小日期
            'autoclose': true,
            onSelect:function(dateText,inst){
//                $(".detailed-list li:eq(3) span").text(dateText);
            }
        });
    });
    $("#save").click(function(){
        var price = $("#price").val();//取值
        var stock = $("#stock").val();
        var days = $("#days").val();
        var startDate=$("#startDate").val();

        if(!price){
            alert("名称必填!");
            $("#price").focus();//获取焦点
            return false;
        }
        if(!stock){
            alert("简介必填!");
            $("#stock").focus();//获取焦点
            return false;
        }
        if(!price){
            alert("名称必填!");
            $("#price").focus();//获取焦点
            return false;
        }
        if(!stock){
            alert("简介必填!");
            $("#stock").focus();//获取焦点
            return false;
        }

        var data = $("#form1").serialize();
        var targetUrl="http://localhost:8080/manager/productSell/insertBatch";
        $.ajax({
            type:'post',
            url:targetUrl,
            cache: false,
            data:data,
            dataType:'json',
            success:function(result){
                if(result.status==200){
                    alert("保存成功");
                   window.location.href="http://localhost:8080/manager/productSell/listView/"+${pid};
                }

            },
            error:function(error){
                console.log(error);

            }
        })
    })
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
