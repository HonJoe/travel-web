<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="/css/allstyle.css" />
    <link rel="stylesheet" href="/css/bootstrap-datepicker.css"/>
    <title>服务定制</title>
</head>
<body>

<jsp:include page="navigation.jsp" flush="true" />


<div class="discovery_banner customtailor_banner">
    <div class="customtailor_banner_wrap">
        <img src="images/custom-loge.png">
        <!--<p class="custom-title">个性定制</p>-->
        <!--<p class="custom-t">定制你美好的旅行</p>-->
    </div>
    <div class="mask"></div>
</div>
<div id="content">
    <div class="custom-made">
        <div class="individuality">
            <span class="active" v="1">旅游定制</span>

        </div>
        <!-- 定制步骤-->
        <ul class="step">
            <li>
                <p><img src="images/icon-40.png"> </p>
                填写需求
            </li>
            <li>
                <p class="cus-step-img"><img src="../images/icon-45.png"> </p>
            </li>
            <li>
                <p><img src="../images/icon-41.png"> </p>
                提交需求
            </li>
            <li>
                <p class="cus-step-img"><img src="images/icon-45.png"> </p>
            </li>
            <li>
                <p><img src="images/icon-42.png"> </p>
                旅游定制
            </li>
            <li>
                <p class="cus-step-img"><img src="images/icon-45.png"> </p>
            </li>
            <li>
                <p><img src="images/icon-43.png"> </p>
                愉快出游
            </li>
        </ul>
        <!--定制步骤 end-->
        <div class="cus-tourism-list">
            <!-- 旅游定制-->
            <div class="tourism-custom J_travel">
                <!-- 需求信息-->
                <form method="post" name="travel-cus" class="cusForm" onsubmit="false">
                    <h1>需求信息</h1>
                    <ul class="cus-table">
                        <li>
                            <label>出游类型：</label>
                            <div class="cus-mold">
                                <span class="active" data-v="group">个性定制</span>
                            </div>
                        </li>
                        <li>
                            <label>出发地：</label>
                            <input type="text" name="startAreaname" class="start_place" placeholder="请输入出发地">
                            <div class="cus-place-list">
                            </div>
                        </li>
                        <li>
                            <label>目的地：</label>
                            <input type="text" name="endAreaname" class="cus-land" placeholder="请输入目的地">
                        </li>
                        <li>
                            <label>出发时间：</label>
                            <input type="text" name="startDate" class="cus-start-time" placeholder="请选择出游日期" readonly/>
                            <div class="cus-man-btn">
                                <span class="cus-next">-</span>
                                <input type="text" value="1" name="days" class="cus-numbe"/>
                                <span class="cus-prev">+</span>
                                天
                            </div>
                        </li>
                        <li>
                            <label>出发人数：</label>
                            <div class="cus-man-btn">
                                <span class="cus-next">-</span>
                                <input type="text" value="1" name="number" class="cus-numbe"/>
                                <span class="cus-prev">+</span>
                                人
                            </div>
                        </li>
                        <li>
                            <label>  人均消费：</label>
                            <div class="cus-person" >
                                <span class="active">0-500</span>
                                <span>500-1000</span>
                                <span>1000-1500</span>
                                <span>1500-2000</span>
                                <span>2000以上</span>
                                <span>不确定</span>
                            </div>
                            <input type="hidden" name="percapitaConsumption"  id="cusPer"/>
                        </li>
                        <li>
                            <label>  联系人：</label>
                            <input type="text" name="personName" placeholder="请输入联系人姓名">
                        </li>
                        <li>
                            <label>  联系电话：</label>
                            <input type="text" name="phone" placeholder="请输入联系电话">
                        </li>
                        <li>
                            <label>  备注：</label>
                            <textarea class="remark" name = "remarks"></textarea>
                        </li>
                    </ul>
                    <input type="button" class="cus-btn" value="提交"/>
                </form>
                <!-- 需求清单-->
                <div class="detailed">
                    <h3>需求清单</h3>
                    <ul class="detailed-list">
                        <li>
                            <label>出游类型：</label>
                            <span>个性定制</span>
                        </li>
                        <li>
                            <label>出发地：</label>
                            <span></span>
                        </li>
                        <li>
                            <label>目的地：</label>
                            <span></span>
                        </li>
                        <li>
                            <label>出发时间：</label>
                            <span></span>
                        </li>
                        <li>
                            <label>出发天数：</label>
                            <span>1</span>
                        </li>
                        <li>
                            <label>出发人数：</label>
                            <span>1</span>
                        </li>
                        <li>
                            <label>  人均消费：</label>
                            <span>0-500</span>
                        </li>
                        <li>
                            <label>  联系人：</label>
                            <span></span>
                        </li>
                        <li>
                            <label>  联系电话：</label>
                            <span></span>
                        </li>
                        <li>
                            <label>  备注：</label>
                            <span class="comment"></span>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 旅游定制 end-->


        </div>

    </div>

</div>
<!--content end-->

<style>

    .iconfont{
        font-family:"iconfont";
        font-size:16px;
        font-style:normal;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        padding-left:20px
    }
</style>


<div id="foot">
    <div class="footer_img">
        <div class="footer_cont">

            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="footer_img_bg"></div>
    </div>

</div>
<!--footer end-->

<%@ include file="foot.jsp"%>


<!--日期插件-->
<script type="text/javascript" src="js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.zh-CN.min.js" charset="UTF-8"></script>
<script>
    $(function(){
        var type;
        $(".J_villa").hide();
        $(".J_bus").hide();
        $(".cusForm input").focus(function(){
            $(this).css({border:"1px solid #ea6b51"});
        });
        $(".cusForm input").blur(function(){
            $(this).css({border:"1px solid #dfdfdf"});
        });
        $(".remark").focus(function(){
            $(this).css({border:"1px solid #ea6b51"});
        });
        $(".remark").blur(function(){
            $(this).css({border:"1px solid #dfdfdf"});
        });
        $(".individuality span").on("click",function(){
            $(this).addClass("active").siblings("span").removeClass("active") ;
            $(".tourism-custom").eq($(this).index()).show().siblings("div").hide();
            type=$(".individuality span.active").attr("v");
        });
        //出发地
        $(".start_place").on("keyup",function(){
            $(this).parents("form").next().find("span").eq(1).text($(this).val());
        });
        //目的地
        $(".cus-land").on("keyup",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(1).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(2).text($(this).val());
        });
        //增加天数
        $(".cus-prev").on("click",function(){
            var mun=parseInt($(this).parent().find(".cus-numbe").val());
            if(isNaN(mun))
                mun=0;
            mun++;
            $(this).prev().val(mun);
            $(this).prev().change();
        });
//  减少天数
        $(".cus-next").on("click",function(){
            var mun=parseInt($(this).parent().find(".cus-numbe").val());
            if(isNaN(mun))
                mun=2;
            mun--;
            if(mun<=0)
                mun=1;
            $(this).next().val(mun);
            $(this).next().change();
        });
        //出游类型
        $(".cus-mold span").on("click",function(){
            $(this).addClass("active").siblings("span").removeClass("active");
            $(".detailed-list li:eq(0) span").text($(this).text());
        });
        //出发天数
        $("input[name='day_count']").on("change",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(3).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(4).text($(this).val());
        });
        //出发人数
        $("input[name='person_total']").on("change",function(){

            if(type == 3)
                $(this).parents("form").next().find("span").eq(4).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(5).text($(this).val());
        });
        //人均消费
        $(".cus-person span").on("click",function(){
            $("#cusPer").val($(this).text());
            console.log($(this).text());
            $(this).addClass("active").siblings("span").removeClass("active");
            if(type == 3)
                $(this).parents("form").next().find("span").eq(5).text($(this).text());
            else
                $(this).parents("form").next().find("span").eq(6).text($(this).text());
        });
        //姓名
        $("input[name='personName']").on("keyup",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(6).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(7).text($(this).val());
        });
        //电话
        $("input[name='phone']").on("keyup",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(7).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(8).text($(this).val());
        });
        //备注
        $(".remark").on("change",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(8).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(9).text($(this).val());
        });
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
        $(".cus-start-time").on("change",function(){
            if(type == 3)
                $(this).parents("form").next().find("span").eq(2).text($(this).val());
            else
                $(this).parents("form").next().find("span").eq(3).text($(this).val());
        });
    });
    //    表单认证
    function cusApprove(cusForm){
        var reg=/^1[3|4|5|8|7][0-9]\d{4,8}$/;
        var reges=/^0\d{2,3}-?\d{7,8}$/;
        var cusDepart=cusForm.find(".start_place").val();
        var cusLand=cusForm.find(".cus-land").val();
        var susName=cusForm.find("input[name='personName']").val();
        var cusPhone=cusForm.find("input[name='phone']").val();
        if(cusDepart == ""){
            alert("出发地不能为空");
            return false;
        }
        if(cusLand == ""){
            alert("目的地不能为空");
            return false;
        }
        if(susName == ""){
            alert("联系人不能为空");
            return false;
        }
        if(cusPhone == ""){
            alert("联系电话不能为空");
            return false;
        }
        if(!reg.test(cusPhone)&&!reges.test(cusPhone)){
            alert("输入的号码不正确");
            return false;
        }
        return true;
    }


    //点击确定
    $(".cus-btn").on("click",function(){
        type=$(".individuality span.active").attr("v");
        var cusForm=$(this).parents(".cusForm");
        var price;
        var organization;
        var data;
        if(type == 1){
            organization=$(".cus-mold span.active").text();
            price=$(".cusForm[name='travel-cus'] .cus-person span.active").text();
            data=$(".cusForm[name='travel-cus']").serialize();
            console.log(data);
        }
        if(cusApprove(cusForm)){
            $.ajax({
                type:"POST",
                url:"/customization/save",
                data:data,
                dataType:"json",
                success:function(obj){
                    if(obj.status==200){
                        alert("提交成功");
                        window.location.href="http://localhost:8080/customization/listView";
                    }else{
                        alert("提交失败"+obj.msg);
                    }

                }
            })
        }

    });

</script>

</body>
</html>
