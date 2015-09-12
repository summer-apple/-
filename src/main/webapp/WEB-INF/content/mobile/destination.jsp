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
		<link type="text/css" rel="stylesheet" href="resources/css/menu-common.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<title>ONE GO</title>

		

		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>
		<form role="form" id="qry-form" class="qry-form" action="" method="post">
			<input id="pageNo" name="pageNo" type="hidden" value="0">
			<input id="pageSize" name="pageSize" type="hidden" value="10">
			

			
				

			
		<input id="amount" type="hidden">
		</form>

			<div class="content">
				<!-- ajax 加载  -->
			</div>

			<div class="foot-blank-box"></div>


				



			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>
		</div>

		
		<link rel="stylesheet" href="resources/css/fonts/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		
		
		<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
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

			//清除content内容，amount归零
			window.clean = function(){
				$(".content").empty();
				$("#pageNo").val(0);
			}

			window.qry = function(){
				var params = $("#qry-form").serializeArray();
	            var j = {};
	            for (var item in params) {
	                j[params[item].name] = params[item].value;
	            }
	          
	            $.ajax({
	                url:'villa/qryMobileVilla',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                	
	                	$("#amount").val(data.amount);
	                	
	      		        var imgurl;
	      		        var imgid;

	                	$.each(data.list, function(i, item) {
	                		
	                		$.each(item.img, function(j, jtem) {
	                			if (j==0) {
	                				imgid = jtem.id;
	                			}else{
	                				if (jtem.id<imgid) {
	                					imgid = jtem.id;
	                				}
	                			}
	                			
	                		});

	                		$.each(item.img, function(j, jtem) {
	                			if (imgid==jtem.id) {
	                				imgurl = jtem.url;
	                			}
	                		});


	                		$(".content").append(
	                			'<div class="villa-warp">'+
									'<div class="villa-head-warp">'+
										'<img src="'+ imgurl +'">'+
									'</div>'+
									'<div class="villa-info-warp">'+
										'<div class="villa-info-line1">'+
											'<div class="villa-info-left villa-name-info">'+ item.name +'</div>'+
											'<div class="villa-info-right order-now-link"><a href="mobile/villa?id='+item.id+'">立即预定</a></div>'+
										'</div>'+
										'<div class="villa-info-line2">'+
											'<div class="villa-info-left">'+ item.province +' '+ item.city +'</div>'+
											'<div class="villa-info-right">平时价:'+ item.normalPrice +'元/场</div>'+
										'</div>'+
										'<div class="villa-info-line3">'+
											'<div class="villa-info-left">'+ item.bedroom +'卧室 最多容纳'+ item.people +'人</div>'+
											'<div class="villa-info-right">特殊价:'+ item.specialPrice +'元/场</div>'+
										'</div>'+
									'</div>'+
								'</div>'
							);
	                  	});
	                }
	            });

				$("#pageNo").val(Number($("#pageNo").val())+1);//页码++


			}

			//载入时查询
			qry();




			//滚动

			 $(window).scroll(function() {
                var amount = $("#amount").val();
                var pageNo = $("#pageNo").val();

                if (Number(pageNo) <= Number(amount)) {
                	if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                   		qry();
                	}
                }
                
            });




			//点击省份

			$(".destination-option").click(function(){
				var address = $(this).attr("title");
				$("#address").val(address);
				$(".destination-option").css("color","#000");
				$(this).css("color","#FFA339");
				$(".select-detail-box").hide(0);
				clean();//归零
				qry();//查询
			});

			$(".qry-btn").click(function(){
				$(".select-detail-box").hide(0);
				clean();//归零
				qry();
			});

			

		});
		</script>
	</body>
</html>