<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta name="author" content="www.frebsite.nl" />
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />

		<title>ONE GO</title>

		
	<style type="text/css">
		.slidesjs-previous,.slidesjs-next,.slidesjs-play,.slidesjs-stop{
			display: none !important;
		}
		.slidesjs-pagination-item span{
			color:#999;
		}
		.slidesjs-pagination-item .active span{
			color:#FFF !important;
		}
		ul.slidesjs-pagination {
		    width: 100%;
		    text-align: center;
		    height: 20px;
		    position: relative;
		    bottom: 25px;
		    left: 20px;
		    z-index: 1000;
		}

		li.slidesjs-pagination-item {
		    display: block;
		    float: left;
		    margin-left: 3px;
		}
		span.fa.fa-circle.slide-nav-circle {
		    font-size: 0.7em;
		}
		.base-info{
			margin-top: -21px;
    		background-color: #FFF;
		}
		.base-info-line1 {
		    text-align: left;
		    margin-left: 3%;
		    padding-top: 10px;
		}
		.base-info-line2{
			text-align: left;
		    margin-left: 3%;
		    margin-top: 5px;
		    padding-bottom: 10px;
		}
		.comment-link{
			float: right;
		    margin-right: 3%;
		    color: #FFA339 !important;
		}
		.price-info {
		    height: 50px;
		    background-color: #FFF;
		    margin-top: 15px;
		    padding-top: 10px;
		}
		.price-info-left {
		    width: 60%;
		    float: left;
		    text-align: left;
		}

		.price-info-left div {
			padding-left: 5%;
		}


		.price-info-right {
		    width: 40%;
		    float: left;
		}

		.order-now-btn{
			display: block;
		    width: 80%;
		    height: 40px;
		    line-height: 40px;
		    background-color: #FFA339 !important;
		    color: #FFF !important;
		    font-size: 1.2em;
		}

.villa-info-box {
    margin-top: 10px;
    background-color: #FFF;
    padding-top: 10px;
    width: 100%;
    height: auto;
    float: left;
    padding-bottom: 15px;
}
.villa-info-head {
    height: 20px;
    border-bottom: 1px solid #DDD;
    padding-bottom: 15px;
    text-align: left;
    padding-left: 3%;
}
.villa-info-head span{
	float: right;
    display: block;
    line-height: 23px;
    margin-right: 3%;
    color: #FFA339 !important;
    height: 100%;
}
.description-info .villa-info-body{
	    text-align: left;
    text-indent: 5%;
}
.free-svs,.villa-facility{
	width: 100%;
    float: left;
    height: 100%;
    background-color: #EFEFEF;
    padding-bottom: 10px;
}
.cost-svs,.general-facility{
	 padding-bottom: 10px;
}
.cost-svs .fs-title{
	margin-bottom: 10px !important;
}
.fs-title {
    width: 30%;
    float: left;
    margin-top: 20px;
}
.fs-body {
    width: 70%;
    float: left;
    margin-top: 20px;
}
.fa-item {
    width: 50%;
    float: left;
}

	</style>
		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>


			<div class="content" style="padding-top: 40px;">
				 <div id="slides">
				 	<!-- ajax -->
			     </div>

				<div class="base-info">
					<div class="bed-peo base-info-line1">
						5个卧室 容纳20人
					</div>
					<div class="base-info-line2">
						评分：***** 5.0分
						<a class="comment-link" href="javascript:void(0)" onclick="document.getElementById('comment-info').scrollIntoView();">评价 <span class="fa fa-chevron-right"></span></a>
					</div>
				</div>
				<div class="price-info">
					<div class="price-info-left">
						<div class="normal-price">周一-周四:1500元/场</div>
						<div class="special-price">周五-周日:2500元/场</div>
					</div>
					<div class="price-info-right">
						<a class="order-now-btn button" href="">立即预定</a>
					</div>
				</div>
				<div class="villa-info-box description-info">
					<div class="villa-info-head">别墅详情<span class="fa fa-chevron-right"></span></div>
					<div class="villa-info-body">
						<!--ajax-->
					</div>
				</div>
				<div class="villa-info-box svs-facility-box">
					<div class="villa-info-head">服务 设施<span class="fa fa-chevron-right"></span></div>
					<div class="villa-info-body">
						<div class="svs-box fs-box">
							<div class="free-svs fa-svs">
								<div class="fs-title">免费服务</div>
								<div class="fs-body">
									<!-- ajax -->
								</div>
							</div>
							<div class="cost-svs fa-svs">
								<div class="fs-title">收费服务</div>
								<div class="fs-body">
									<!-- ajax -->
								</div>
							</div>
						</div>
						<div class="facility-box fs-box">
							<div class="villa-facility fa-facility">
								<div class="fs-title">别墅设施</div>
								<div class="fs-body">
									<!-- ajax -->
								</div>
							</div>
							<div class="general-facility fa-facility">
								<div class="fs-title">综合设施</div>
								<div class="fs-body">
									<!-- ajax -->
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div id="comment-info" class="villa-info-box comment-info">
					<div class="villa-info-head">评 价<span class="fa fa-chevron-right"></span></div>
					<div class="villa-info-body">
						评价吊吊吊
						《<br><br><br><br><br><br>
						<br><br><br><br><br>
						<br><br><br><br>
						<br><br><br>
						aa
					</div>
				</div>


			</div>

			<div class="foot-blank-box"></div>


			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>
		</div>

		<link type="text/css" rel="stylesheet" href="resources/css/menu-common.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<link rel="stylesheet" href="resources/css/fonts/fontawesome/css/font-awesome.min.css">
		<!-- <link rel="stylesheet" href="resources/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css"> -->
		
		
		<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.slides.min.js"></script>
		<!-- <script src="resources/js/bootstrap.min.js"></script> -->
		<script type="text/javascript" src="resources/js/jquery.mmenu.min.all.js"></script>
		<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu({
					//extensions	: [ 'effect-slide-menu', 'pageshadow' ],
					//searchfield	: true,
					"autoHeight": true,
					counters	: true,
					navbar 		: {
						title		: 'ONE GO'
					},
					navbars		: [
						 {
							position	: 'top',
							content		: [
								'prev',
								'title',
								'close'
							]
						}, {
							position	: 'bottom',
							content		: [
								'<a href="http://gmcfe.pub/" target="_blank">PROWERED BY GMC INC.</a>'
							]
						}
					]
				});
			});
		</script>
		
		<script type="text/javascript">
		$().ready(function(){

			//获取地址栏参数 调用getUrlParam(name)方法
	
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r!=null) return unescape(r[2]); return null;
				}
			
			var id = getUrlParam("id");

			//获取别墅json对象
			$.ajax({
				url:"villa/getVilla?type=json&id="+id,
				type:"post",
				dataType:"json",
				success:function(data){
					//插入图片
					var imgs = data.img;
					$.each(imgs,function(i,item){
						$("#slides").append(
							'<img src="'+ item.url +'"/>'
							);
					});

					//轮播图
		    		 $('#slides').slidesjs({
				        width: 1000,
				        height: 618,
				        play: {
				          active: true,
				          auto: true,
				          interval: 4000,
				          swap: true
				        }
				      });
		    		 
		    		 //插入预定按钮连接
		    		 $(".order-now-btn").attr("href","mobile/per-order?id="+data.id);

		    		 //插入别墅名
		    		 $(".platform-title").html(data.name);

		    		 //插入床位 人数
		    		 $(".bed-peo").html('卧室'+data.bedroom+'个 容纳'+ data.people +'人');

		    		 //插入价格
		    		 $(".normal-price").html('周一-周四:'+ data.normalPrice+'元/场');
		    		 $(".special-price").html('周五-周日:'+ data.specialPrice+'元/场');

		    		 //插入简介
		    		 $(".description-info .villa-info-body").html(data.description);

		    		 //插入服务设施

		    		 var svs = data.svs;
		    		 var facility = data.facility;

		    		 $.each(svs,function(i,item){
		    		 	
		    		 	if (item.type==0) {
		    		 		$(".free-svs .fs-body").append('<div class="fa-item">'+ item.content +'</div>');
		    		 	}else{
		    		 		$(".cost-svs .fs-body").append('<div class="fa-item">'+ item.content +'</div>');
		    		 	}
					});

		    		$.each(facility,function(i,item){
						
		    		 	if (item.type==0) {
		    		 		$(".villa-facility .fs-body").append('<div class="fa-item">'+ item.content +'</div>');
		    		 	}else{
		    		 		$(".general-facility .fs-body").append('<div class="fa-item">'+ item.content +'</div>');
		    		 	}
					});



					//插入评论
				}
			});



			





		});
		</script>
	</body>
</html>