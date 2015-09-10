<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>
<style type="text/css">
	body, ul, dl, dd, dt, ol, li, p, h1, h2, h3, h4, h5, h6, textarea, form, select, fieldset, table, td, div, input {margin:0;padding:0;-webkit-text-size-adjust: none}
h1, h2, h3, h4, h5, h6{font-size:12px;font-weight:normal}
body>div{margin:0 auto}
div {text-align:left}
a img {border:0}
body { color: #333; text-align: center; font: 12px "宋体"; }
ul, ol, li {list-style-type:none;vertical-align:0}
a {outline-style:none;color:#535353;text-decoration:none}
a:hover { color: #D40000; text-decoration: none}
.clear{height:0; overflow:hidden; clear:both}
.button {display: inline-block;zoom: 1; *display: inline;vertical-align: baseline;margin: 0 2px;outline: none;cursor: pointer;text-align: center;text-decoration: none;font: 14px/100% Arial, Helvetica, sans-serif;padding:0.25em 0.6em 0.3em;text-shadow: 0 1px 1px rgba(0,0,0,.3);-webkit-border-radius: .5em; -moz-border-radius: .5em;border-radius: .5em;-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.red {color: #faddde;border: solid 1px #980c10;background: #d81b21;background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#A51715));background: -moz-linear-gradient(top,  #ed1c24,  #A51715);filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');
}
.red:hover { background: #b61318; background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115)); background: -moz-linear-gradient(top,  #c9151b,  #a11115); filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115'); color:#fff;}
.red:active {color: #de898c;background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');}
.cor_bs,.cor_bs:hover{color:#ffffff;}

.keTitle{height:100px; line-height:100px; font-size:30px; font-family:'微软雅黑'; color:#FFF; text-align:center; repeat-x bottom left; font-weight:normal}
.kePublic{background:#FFF; padding:0px; height: 100%;}
.keBottom{color:#FFF; padding-top:25px; line-height:28px; text-align:center; font-family:'微软雅黑'; repeat-x top left; padding-bottom:25px;}
.keTxtP{font-size:16px; color:#ffffff;}
.keUrl{color:#FFF; font-size:30px;}
.keUrl:hover{ text-decoration: underline; color: #FFF; }
.mKeBanner,.mKeBanner div{text-align:center;}
/*科e互联特效基本框架CSS结束，应用特效时，以上样式可删除*/
.main_visual{height:100%;overflow:hidden;position:relative;}
.main_image{height:100%;overflow:hidden;position:relative;}
.main_image ul{width:9999px;height:100%;overflow:hidden;position:absolute;top:0;left:0;background-color: #000;}
.main_image li{float:left;width:100%;height:100%;}
.main_image img{width: 100%;}
div.flicking_con{position:absolute;bottom: 100px;left:50%;z-index:999;width:300px;height:21px;margin:0 0 0 -50px;}
div.flicking_con a{float:left;width:21px;height:21px;margin:0;padding:0;background:url('../resources/images/btn_main_img.png') 0 0 no-repeat;display:block;text-indent:-1000px}
div.flicking_con a.on{background-position:0 -21px}
#btn_prev,#btn_next{z-index:11111;position:absolute;display:block;width:73px!important;height:74px!important;top:50%;margin-top:-37px;display:none;}
#btn_prev{background:url(images/hover_left.png) no-repeat left top;left:100px;}
#btn_next{background:url(images/hover_right.png) no-repeat right top;right:100px;}
</style>
<script type="text/javascript" src="../resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.touchSlider.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	var $h = $(window).height();
	$("body").css("height",$h);

	

	

	


	
	$dragBln = false;
	
	$(".main_image").touchSlider({
		
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});
	
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	});
	
	$(".main_image a").click(function(){
		if($dragBln) {
			return false;
		}
	});
	
	timer = setInterval(function(){
		$("#btn_next").click();
	}, 5000);
	
	$(".main_visual").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},5000);
	});
	
	$(".main_image").bind("touchstart",function(){
		clearInterval(timer);
	}).bind("touchend", function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		}, 5000);
	});
	
});
</script>
</head>
<body class="keBody">

<div class="kePublic">
<!--效果html开始-->
<div class="main_visual">
	<div class="flicking_con">
		<a href="#">1</a>
		<a href="#">2</a>
		<a href="#">3</a>
		<a href="#">4</a>
		<a href="#">5</a>
	</div>
	<div class="main_image">
		<ul>
			<li><img class="slide-img slide-img-1" src="../resources/images/gallery/aaa.jpg"></li>
			<li><img class="slide-img slide-img-2" src="../resources/images/gallery/bbb.jpg"></li>
			<li><img class="slide-img slide-img-3" src="../resources/images/gallery/ccc.jpg"></li>
			<li><img class="slide-img slide-img-4" src="../resources/images/gallery/ddd.jpg"></li>
			<li><img class="slide-img slide-img-5" src="../resources/images/gallery/aaa.jpg"></li>
		</ul>
		<a href="javascript:;" id="btn_prev"></a>
		<a href="javascript:;" id="btn_next"></a>
	</div>
</div>
<!--效果html结束-->
<script type="text/javascript">
	$(window).load(function(){ 
			var $slideImgCount = $(".slide-img").length;
			for(i=1;i<=$slideImgCount;i++){
				//alert("i="+i);
				//alert($(".slide-img-"+i).height());
				//alert($(window).height()-$(".slide-img-"+i).height());
				var $marginTop = ($(window).height()-$(".slide-img-"+i).height())/2;
				//alert($marginTop);
				$(".slide-img-"+i).css("margin-top",$marginTop);
			}
	});
</script>
</body>
</html>