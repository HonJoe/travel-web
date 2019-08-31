$('.carousel').carousel({
    interval: 2000
})
$(function () {
	
	//获取网页url，根据url跳转页面
     var strUrl=window.location.href;
     var arrUrl=strUrl.split("/");
     var strPage=arrUrl[arrUrl.length-1];
	 var url = strPage.substring(0,strPage.indexOf('html')+4);
	 if( url == "index.html"){
		$('.nav_item1').css("background","#ff9d00").children('a').css("color","#fff");
	 }else if(url == "destination.html"){
		$('.nav_item2').css("background","#ff9d00").children('a').css("color","#fff");
	 }else if(url == "jour.html"){
		$('.nav_item3').css("background","#ff9d00").children('a').css("color","#fff");
	 }else if(url == "mate.html"){
		$('.nav_item4').css("background","#ff9d00").children('a').css("color","#fff");
	 }
	
	//点击每一个导航选项时,跳转到a标签指定的url
    $(".navigation li").click(function () {
		var url = $(this).children('a').attr('href');
		window.location.href = url;
		// if(!RGBtoHEX($(this).css("backgroundColor")) == "#ff9d00"){
			// $(this).css("background-color","#ff9d00");
			// $(this).children('a').css("color","#fff");
			// $(this).siblings().css("background-color","#fff");
			// $(this).siblings().children('a').css("color","#000");
		// }
		// alert(RGBtoHEX($(this).css("backgroundColor")));
    });
	
	//取消a标签的默认跳转事件
	$('.navigation li a').click(function(event){
		event.preventDefault();
	});

	//鼠标滑过每一个导航选项时，判断当前选项是否为选中选中状态,如果是,则鼠标移过文字变色.若否,则不变色
    $(".navigation li").hover(function () {
        if(!(RGBtoHEX($(this).css("backgroundColor")) == "#FF9D00")){
            $(this).children('a').css("color","#ff9d00");
        }
    },function () {
        if(!(RGBtoHEX($(this).css("backgroundColor")) == "#FF9D00")){
            $(this).children('a').css("color","#000");
        }
    });

	//登录注册的页面显示和跳转
    $('.login').click(function () {
        $("#myModal").modal("show");
    });

    $('.reg').click(function () {
        window.location.href = "register.html";
    });

    //轮播输入框
    $('#radioGroup span').click(function () {
        var i = $(this).index();
        $('#radioGroup').find('input').removeProp('checked');
        $('#radioGroup span').eq($('#radioGroup span').index(this)).children('input').prop('checked', 'checked');
        $('#input_Group li').eq(i).show().siblings().hide();
        $('#input_Group li').removeClass('show').eq(i).addClass('show');
    });



});

//获取颜色的16进制码
function toHex(N) {
    if (N==null) return "00";
    N=parseInt(N); if (N==0 || isNaN(N)) return "00";
    N=Math.max(0,N); N=Math.min(N,255); N=Math.round(N);
    return "0123456789ABCDEF".charAt((N-N%16)/16) + "0123456789ABCDEF".charAt(N%16);
}

function RGBtoHEX(str)
{
    if (str.substring(0, 3) == 'rgb') {
        var arr = str.split(",");
        var r = arr[0].replace('rgb(','').trim(), g = arr[1].trim(), b = arr[2].replace(')','').trim();
        var hex = [
            toHex(r),
            toHex(g),
            toHex(b)
        ];
        return "#" + hex.join('');
    }
    else{
        return str;
    }
}