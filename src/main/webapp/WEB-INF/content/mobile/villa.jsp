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
    		height: 65px;
		}
		.villa-star-wrap {
    width: 150px;
    float: left;
    height: 30px;
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
}
.villa-info-head {
    height: 20px;
    text-align: left;
    padding-left: 3%;
    padding-bottom: 10px;
}
.villa-info-head span{
	float: right;
    display: block;
    line-height: 23px;
    margin-right: 3%;
    color: #FFA339 !important;
    height: 100%;
}
.villa-info-body{
	display: none;
	padding-bottom: 10px;
	border-top: 1px solid #EFEFEF;
}
.description-info .villa-info-body{
	padding: 15px;
    text-align: left;	   
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
    margin-top: 15px;
}
.fs-body {
    width: 70%;
    float: left;
    margin-top: 15px;
}
.fa-item {
    width: 50%;
    float: left;
}

/**comment**/
.comment-warp {
    height: auto;
    clear: both;
    border-bottom: 1px solid #EFEFEF;
    padding-bottom: 20px;
}
.comment-title {
    height: 50px;
    margin-top: 10px;
}
.comment-title-left {
    width: 60%;
    height: 100%;
    float: left;
}
.comment-user-head {
    width: 50px;
    height: 50px;
    border-radius: 25px;
    float: left;
    margin-left: 10px;
    margin-right: 10px;
}
.comment-other-info {
    float: left;
    text-align: left;
}
.comment-other-info {

    text-align: left;
}
.comment-user-name {
    height: 30px;
    line-height: 45px;
}
.comment-time {
    font-size: 0.8em;
    color: #999;
}
.star-warp {
    width: 90%;
    margin-right: 10%;
    padding-top: 20px;
}
.star{
	color: #FFA339 !important;
}
.comment-title-right {
    width: 40%;
    float: left;
    text-align: right;
}
.comment-body {
    width: 80%;
    text-align: left;
    margin-left: 10%;
    margin-top: 10px;
    font-size: 0.9em;
    color: #666;
    line-height: 1.5em;
    text-indent: 25px;
    margin-bottom: 10px;
}

.comment-img {
    width: 80%;
    margin-left: 10%;
}
.comment-img-item {
    width: 50px;
    height: 50px;
    float: left;
    margin-right: 5px;
    margin-bottom: 5px;
}

.comment-img-item-big{
	width: 100% !important;
    height: auto !important;
    margin-right: 0 !important;
    margin-bottom: 10px !important;
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
						
					</div>
					<div class="base-info-line2">
						<div class="villa-star-wrap"></div>
						<a class="comment-link" href="javascript:void(0)" onclick="">评价 <span class="fa fa-chevron-right"></span></a>
					</div>
				</div>
				<div class="price-info">
					<div class="price-info-left">
						<div class="normal-price"></div>
						<div class="special-price"></div>
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
//日期转换方法
			(function($) {
			    $.extend({
			        myTime: {
			            /**
			             * 当前时间戳
			             * @return <int>        unix时间戳(秒)  
			             */
			            CurTime: function(){
			                return Date.parse(new Date())/1000;
			            },
			            /**              
			             * 日期 转换为 Unix时间戳
			             * @param <string> 2014-01-01 20:20:20  日期格式              
			             * @return <int>        unix时间戳(秒)              
			             */
			            DateToUnix: function(string) {
			                var f = string.split(' ', 2);
			                var d = (f[0] ? f[0] : '').split('-', 3);
			                var t = (f[1] ? f[1] : '').split(':', 3);
			                return (new Date(
			                        parseInt(d[0], 10) || null,
			                        (parseInt(d[1], 10) || 1) - 1,
			                        parseInt(d[2], 10) || null,
			                        parseInt(t[0], 10) || null,
			                        parseInt(t[1], 10) || null,
			                        parseInt(t[2], 10) || null
			                        )).getTime() / 1000;
			            },
			            /**              
			             * 时间戳转换日期              
			             * @param <int> unixTime    待时间戳(秒)              
			             * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)              
			             * @param <int>  timeZone   时区              
			             */
			            UnixToDate: function(unixTime, isFull, timeZone) {
			                if (typeof (timeZone) == 'number')
			                {
			                    unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
			                }
			                var time = new Date(unixTime * 1000);
			                var ymdhis = "";
			                ymdhis += time.getUTCFullYear() + "-";
			                ymdhis += (time.getUTCMonth()+1) + "-";
			                ymdhis += time.getUTCDate();
			                if (isFull === true)
			                {
			                    ymdhis += " " + time.getUTCHours() + ":";
			                    ymdhis += time.getUTCMinutes() + ":";
			                    ymdhis += time.getUTCSeconds();
			                }
			                return ymdhis;
			            }
			        }
			    });
			})(jQuery);



			
			//格式化时间
				function transTime(object,isFull){
					if (object!=null) {
						return $.myTime.UnixToDate(object.time/1000,isFull);
					}else{
						return "--";
					}
				}


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


		    		 //插入评分
		    		 $(".villa-star-wrap").html(star(data.star));


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
					$.ajax({
						url:"comment/qryCommentByVilla?id="+data.id,
						type:"post",
						dataType:"json",
						success:function(data){


							$.each(data,function(i,item){
								
							var str = "";
							$.each(item.img, function(i, item) {
	                			str+='<img class="comment-img-item" src="'+item.url+'">';
	                			
	                		});



				    		 	$("#comment-info .villa-info-body").append(

									'<div class="comment-warp">'+
										'<div class="comment-title">'+
											'<div class="comment-title-left">'+
												'<img class="comment-user-head" src="'+item.memberHead+'">'+
												'<div class="comment-other-info">'+
													'<div class="comment-user-name">'+item.memberName+'</div>'+
													'<div class="comment-time">'+transTime(item.commentDay,false)+'</div>'+
												'</div>'+
											'</div>'+
											'<div class="comment-title-right">'+
												'<div class="star-warp">'+
													star(item.star)+
												'</div>'+
											'</div>'+
										'</div>'+
										'<div class="comment-body">'+
											item.content+
										'</div>'+
										'<div class="comment-img">'+
											str+
										'</div>'+
										'<div style="clear:both;"></div>'+
									'</div>'

				    		 		);
							});

						}
					});










				}
			});



			function star(star){
				var s = Number(star/20);
				var str = "";
				for (var i = 1; i <= s; i++) {
					str+='<span class="star star'+ i +' fa fa-star"></span>';
				}
				var j = s+1;
				for (j;j<=5;j++) {
					str+='<span class="star star'+ j +' fa fa-star fa-star-o"></span>';
				}

				return str;
			}

			function commentImg(imgs){
				var str = "";
				
				$.each(imgs,function(i,item){
					str+='<img class="comment-img-item" src="'+item.url+'">';
				});

				return str;
			}

			//缩小已放大的图片**********************on 方法！！！！！！！！！！！！

			$(document).on("click",".comment-img-item",function(){
				if ($(this).hasClass("comment-img-item-big")) {
					$(".comment-img-item-big").removeClass("comment-img-item-big");
				}else{
					$(this).parent().find(".comment-img-item").addClass("comment-img-item-big");
				}
			});
			
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

			//villa info box 隐藏 弹出

			$(".villa-info-head").click(function(){
				if ($(this).find("span").hasClass("fa-chevron-down")) {
					$(".fa-chevron-down").removeClass("fa-chevron-down").addClass("fa-chevron-right");
					$(".villa-info-body").hide();
					$(this).find("span").removeClass("fa-chevron-down").addClass("fa-chevron-right");
				}else{
					$(".fa-chevron-down").removeClass("fa-chevron-down").addClass("fa-chevron-right");
					$(".villa-info-body").hide();
					$(this).find("span").removeClass("fa-chevron-right").addClass("fa-chevron-down");
					$(this).next(".villa-info-body").show();
				}
			});
			

			$(".comment-link").click(function(){
				$("#comment-info").find(".villa-info-head").click();
				$("html, body").scrollTop(500);
			});


		});
		</script>
	</body>
</html>