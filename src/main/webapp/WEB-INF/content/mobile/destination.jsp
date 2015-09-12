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
<style type="text/css">

.search-box {
	width: 100%;
	display: none;
	position: fixed;
	margin-top: 40px;
	padding-bottom: 15px;
	background-color: #EFEFEF;

    z-index: 111;
}


.input-group {
    width: 90%;
    margin-left: 5%;
}

.search-box .input-group .form-control{
	text-indent: 18px;
	height: 40px;
    margin-top: 10px;
}

.input-icon {
    position: absolute;
    top: 21px;
    left: 13px;
    z-index: 100;
    color: #999;
    font-size: 1.5em !important;
}
.input-icon-el {
	font-size: 0.9em !important;
    left: 10px;
}


.s-btn {
	width: 45%;
    height: 40px;
    font-size: 15px;
    margin-top: 10px;
    line-height: 30px !important;
}

.clear-btn{
    background-color: #FFF;	
}

.search-btn{
	background-color: #FFA339;
    color: #FFF;
    float: right;	
}
.qry-form{
	background-color: #EFEFEF;
}

.select-box {
    padding-top: 55px;
    width: 100%;
    background-color: #EFEFEF;
    height: 40px;
}
ul.select-list {
    width: 90%;
    margin-left: 5%;
    padding: 0;
    height: 40px;
}
.select-item {
    display: block;
    float: left;
    width: 33.33%;
    height: 40px;
    background-color: #FFF;
    line-height: 40px;
    text-align: center;
    border-right: 1px solid #DDD;
    font-size: 15px;
}
.bedroom-item {
	border-right:0px;
}


.select-detail-box {
    margin-top: 41px;
    width: 100%;
    height: 100px;
    display: none;
}

.select-detail-list {
    width: 90%;
    margin-left: 5%;
    padding: 0;
    height: 100px;
    position: relative;
}
.select-detail-item {
    width: 100%;
    background-color: #FFF;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    display: none;
}
.destination-detail{
	height: 330px;
	padding-top: 10px;
}

.destination-line {
    width: 100%;
    height: 29px;
}
.destination-option {
    width: 33.33%;
    float: left;
    text-align: center;
    font-size: 1.2em;
}


.price-detail {
	padding-top: 10px;
	height: 200px;
}

.price-option span {
    font-size: 1.1em;
    color: #999;
}
.price-option span.fa-check-square-o {
    font-size: 1.1em;
    color: #FFA339;
}

.bedroom-detail{
	height: 120px;
}

.bedroom-line {
    width: 80%;
    margin-left: 10%;
    margin-top: 20px;
}

.bedroom-line label {
    width: 23%;
    display: block;
    float: left;
    height: 30px;
    text-align: center;
    line-height: 30px;
}

.bedroom-line span {
    width: 10%;
    display: block;
    float: left;
    height: 30px;
    line-height: 30px;
        font-size: 1.5em;
    color: #FFA339;
}

.bedroom-line input{
	display: block;
    float: left;
    width: 50%;
    height: 30px;
    line-height: 30px;
    text-align: center;
    margin-right: 5%;
    border: 1px solid #DDD;

}

.select-btn-warp{
	clear: both;
    text-align: center;
    padding-top: 10px;
}

.select-btn-warp .btn {
    background-color: #FFA339;
    color: #FFF;
    width: 100px;
    height: 40px;
    display: block;
    margin-left: auto;
    margin-right: auto;
    font-size: 1.2em;
}


.price-line {
    width: 100%;
    height: 25px;
    margin-top: 5px;
}
.price-option {
    width: 50%;
    text-align: center;
    float: left;
}



.content
{
	width: 100%;
	height: auto;
	background-color: #EFEFEF;
	padding-top: 60px;
}



.villa-warp{
	width: 90%;
    margin-left: 5%;
    margin-bottom: 20px;
	background-color: #FFF;
}

.villa-head-warp img{
	width: 100%;
}
.villa-info-warp {
    width: 100%;
    height: 78px;
    background-color: #FFF;
}
.villa-info-left {
    float: left;
    width: 50%;
    text-align: left;
    padding-left: 10px;
}


.villa-info-right {
    float: right;
    width: 50%;
    text-align: right;
    padding-right: 10px;
}

.villa-info-line1{
	margin-top: 5px;
    padding-bottom: 30px;

    height: 25px;
    line-height: 25px;
}
.villa-name-info{
    font-size: 1.35em;	
}

.order-now-link a {
	font-size: 1.3em;
	color: #FFA339;
}


.villa-info-line2 div,.villa-info-line3 div{

    height: 20px;
    line-height: 20px;
}









.foot-blank-box {
    width: 100%;
    height: 100px;
    background-color: #EFEFEF;
    clear: both;
}

footer {
	position: fixed;
    bottom: 0px;
    width: 100%;
    height: 55px;
    background-color: #FFF;
}

.fo-btn-list {
	width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

.fo-btn-item {
    width: 33.33%;
    display: block;
    height: 100%;
    float: left;
}

.fo-btn-item span {
    display: block;
    width: 100%;
    height: 20px;
    margin-top: 9px;
    font-size: 2em;
    text-align: center;
    color:#888;
    margin-bottom: 3px;
}
.fo-btn-item a {
	font-size: 1em;
    text-align: center;
    display: block;
    width: 100%;
    margin-top:3px;
    color:#888;
}



	#qry-form{
		width:100%;
		padding-top: 50px;
	}
	.address{
		width: 44%;
		height: 30px;
		margin-left: 4%;
	}
</style>
		

		
	</head>
	<body onload="setup();preselect('浙江省');">
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>
		<form role="form" id="qry-form" class="qry-form" action="" method="post">
			<input id="pageNo" name="pageNo" type="hidden" value="0">
			<input id="pageSize" name="pageSize" type="hidden" value="10">
			
				<select class="address province-select" id="s1" name="province">
					<option></option>
				</select>
		
				<select class="address city-select" id="s2" name="city">
					<option></option>
				</select>
	

			
				

			
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
		<script src="resources/js/geo.js"></script>
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
	                url:'villa/qryDestination',
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




			//地址更改

			$(".address").change(function(){
				clean();
				qry();//查询
			});


			

		});
		</script>
	</body>
</html>