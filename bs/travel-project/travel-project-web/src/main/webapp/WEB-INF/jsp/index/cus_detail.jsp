<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/3/8
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>定制详情</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>
<body>

<jsp:include page="navigation.jsp" flush="true" />

<!--content-->
<div id="content" class="w_960">
    <div class="tourOrder_form">
        <!--步骤说明-->
        <div class="steps">
            <ul>
                <li>
                    <p>
                        <span>1</span>
                        2分钟收集您的需求
                    </p>
                </li>

                <li>
                    <p>
                        <span>2</span>
                        24小时内客服与您沟通
                    </p>
                </li>

                <li>
                    <p>
                        <span>3</span>
                        48小时您将获取专属方案
                    </p>
                </li>
            </ul>
        </div>

        <!--步骤说明 end-->
        <div class="left_form">
            <!--表单-->
            <form class="edit_user_form" method="post" action="/User/editcustomdemand/id/801" style="padding-top:0;">
                <input type="hidden" name="id" value="801">
                <table width="100%">
                    <!--定制需求-->
                    <tr>
                        <td colspan="4" class="form_title_td">
                            <span class="icon_edit"></span>定制需求
                        </td>
                    </tr>
                    <!-- <tr>
                        <td class="need td_pt_50 td_w_120"></td>
                        <td class="user_form_txt td_pt_50 verticaltop"> 定制类型</td>
                        <td class="user_form_input td_pt_50" id="user_copy">
                            <label for="" class="customtype" type="1">个人定制</label>
                            <label for="" class="customtype active" type="2">团体定制</label>
                        </td>
                    </tr> -->
                    <tr>
                        <td class="need td_w_120 td_pt_50"></td>
                        <td class="user_form_txt td_pt_50"> 联系人</td>
                        <td class="user_form_input td_pt_50">
                            <input type="text" class="user_inputxt" name="linkman" datatype="s2-8" nullmsg="请输入联系人姓名！" errormsg="联系人姓名至少2个字符,最多8个字符！" value="${cus.personName}" placeholder="例如张三" maxlength="8" />
                        </td>
                        <td class="td_pt_50">
                            <div class="Validform_checktip"></div>
                            <div class="info">联系人姓名至少2个字符,最多8个字符！<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 手机号码</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt" name="tel" datatype="m" nullmsg="请输入您的手机号码！" errormsg="手机号码格式不正确！" value="${cus.phone}" placeholder="例如18311251523" />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">请输入手机号码！<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>

                    <!--定制需求 end-->

                    <!--路线信息-->
                    <tr>
                        <td colspan="4" class="form_title_td"><span class="icon_location2"></span>路线信息</td>
                    </tr>
                    <tr>
                        <td class="need td_pt_50 td_w_120"></td>
                        <td class="user_form_txt td_pt_50"> 出发地</td>
                        <td class="user_form_input td_pt_50">

                            <input type="text" class="user_inputxt" name="start_place" datatype="s2-16" nullmsg="请输入出发地点！" errormsg="出发地点至少2个字符,最多16个字符！" value="${cus.startAreaname}" placeholder="例如广州" maxlength="16" />
                        </td>
                        <td class="td_pt_50">
                            <div class="Validform_checktip"></div>
                            <div class="info">出发地点至少2个字符,最多16个字符<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>

                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 目的地</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt" name="aim_place" datatype="s2-16" nullmsg="请输入目的地！" errormsg="目的地至少2个字符,最多16个字符！" value="${cus.endAreaname}" placeholder="例如桂林" maxlength="16" />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">目的地至少2个字符,最多16个字符<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 出发时间</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt start_time" name="start_time" datatype="*" nullmsg="请选择出发时间！" value="<fmt:formatDate value="${cus.startDate}" pattern="yyyy-MM-dd"/>" placeholder="2016-6-6" readonly />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">请选择出发时间<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 旅行天数</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt" name="day_count" datatype="n" nullmsg="请输入旅行天数！" errormsg="旅行天数为数字！" value="${cus.days}" placeholder="例如10" />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">旅行天数为数字<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 费用预算</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt" name="price" datatype="/\d{1,10}(\.\d{2})?$/" nullmsg="请输入费用预算！" errormsg="费用预算为数字！" value="${cus.percapitaConsumption}" placeholder="例如100" />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">费用预算为数字<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt"> 旅行人数</td>
                        <td class="user_form_input">
                            <input type="text" class="user_inputxt" name="person_total" datatype="n" nullmsg="请输入人数！" errormsg="人数为数字！" value="${cus.number}" placeholder="例如10" />
                        </td>
                        <td>
                            <div class="Validform_checktip"></div>
                            <div class="info">人数为数字<span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div>
                        </td>
                    </tr>
                    <!--路线信息 end-->


                    <tr>
                        <td class="need td_w_120"></td>
                        <td class="user_form_txt verticaltop">备注</td>
                        <td class="user_form_input" colspan="2">
                            <textarea class="user_inputxt" style=" min-height:100px; width: 450px" name="remark" placeholder="例如我需要什么" maxlength="255">${cus.remarks}</textarea>
                        </td>
                        <td>

                        </td>
                    </tr>

                    <tr>
                        <td colspan="4" style="padding-top:60px;text-align: center">
                            <input type="hidden" value="132275486" name="contact">

                        </td>
                    </tr>

                </table>
            </form>
            <!--表单 end-->
        </div>

        <div class="tourOrder_form_shadow"></div>

    </div>

    <!--tourOrder_form end-->
</div>
<!--content end-->


<%@ include file="foot.jsp"%>

</body>
</html>
