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










</style>
		

		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="javascript:void(0);"><span class="fa fa-search"></span></a>
			</div>
		<form role="form" id="qry-form" class="qry-form" action="" method="post">
			<input id="pageNo" name="pageNo" type="hidden" value="1">
			<input id="pageSize" name="pageSize" type="hidden" value="10">
			<div class="search-box">
				
				    <div class="input-group">
				      <input id="name" name="name" type="text" class="form-control" placeholder="搜索目的地 or 别墅名..." style="width:100%;">
				      <span class="input-icon fa fa-map-marker"></span>
				 
					</div>
					<div class="input-group">
				      <input id="people" name="people" type="text" class="form-control" placeholder="人数..." style="width:100%;">
				      <span class="input-icon input-icon-el el-user"></span>
					</div>
					<div class="input-group">
						<div class="clear-btn s-btn btn">清空</div> 
						<div class="qry-btn search-btn s-btn btn">搜索</div>
					</div>
			</div>

			<div class="select-box">
				<ul class="select-list">
					<li class="destination-item select-item">目的地 <span class="fa fa-angle-down"></span></li>
					<li class="price-item select-item">价  格 <span class="fa fa-angle-down"></span></li>
					<li class="bedroom-item select-item">卧室数 <span class="fa fa-angle-down"></span></li>
				</ul>
			</div>
				
			<div class="select-detail-box">
				<ul class="select-detail-list">
					<li class="destination-detail select-detail-item">
						<input id="address" type="hidden" name="address">
						<div class="destination-line">
							<div class="destination-option" title="北京">北&nbsp;&nbsp;&nbsp;京</div>
							<div class="destination-option" title="天津">天&nbsp;&nbsp;&nbsp;津</div>
							<div class="destination-option" title="河北">河&nbsp;&nbsp;&nbsp;北</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="山西">山&nbsp;&nbsp;&nbsp;西</div>
							<div class="destination-option" title="新疆">新&nbsp;&nbsp;&nbsp;疆</div>
							<div class="destination-option" title="辽宁">辽&nbsp;&nbsp;&nbsp;宁</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="宁夏">宁&nbsp;&nbsp;&nbsp;夏</div>
							<div class="destination-option" title="上海">上&nbsp;&nbsp;&nbsp;海</div>
							<div class="destination-option" title="江苏">江&nbsp;&nbsp;&nbsp;苏</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="浙江">浙&nbsp;&nbsp;&nbsp;江</div>
							<div class="destination-option" title="安徽">安&nbsp;&nbsp;&nbsp;徽</div>
							<div class="destination-option" title="福建">福&nbsp;&nbsp;&nbsp;建</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="江西">江&nbsp;&nbsp;&nbsp;西</div>
							<div class="destination-option" title="山东">山&nbsp;&nbsp;&nbsp;东</div>
							<div class="destination-option" title="河南">河&nbsp;&nbsp;&nbsp;南</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="湖北">湖&nbsp;&nbsp;&nbsp;北</div>
							<div class="destination-option" title="湖南">湖&nbsp;&nbsp;&nbsp;南</div>
							<div class="destination-option" title="广东">广&nbsp;&nbsp;&nbsp;东</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="海南">海&nbsp;&nbsp;&nbsp;南</div>
							<div class="destination-option" title="重庆">重&nbsp;&nbsp;&nbsp;庆</div>
							<div class="destination-option" title="四川">四&nbsp;&nbsp;&nbsp;川</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="贵州">贵&nbsp;&nbsp;&nbsp;州</div>
							<div class="destination-option" title="云南">云&nbsp;&nbsp;&nbsp;南</div>
							<div class="destination-option" title="西藏">西&nbsp;&nbsp;&nbsp;藏</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="陕西">陕&nbsp;&nbsp;&nbsp;西</div>
							<div class="destination-option" title="甘肃">甘&nbsp;&nbsp;&nbsp;肃</div>
							<div class="destination-option" title="青海">青&nbsp;&nbsp;&nbsp;海</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="吉林">吉&nbsp;&nbsp;&nbsp;林</div>
							<div class="destination-option" title="黑龙江">黑龙江</div>
							<div class="destination-option" title="内蒙古">内蒙古</div>
						</div>

						<div class="destination-line">
							<div class="destination-option" title="港澳台">港澳台</div>
							<div class="destination-option" title="">全&nbsp;&nbsp;&nbsp;部</div>
							
						</div>


					</li>
					
					<li class="price-detail select-detail-item">
						<input id="highPrice" type="hidden" name="highPrice">
						<input id="lowPrice" type="hidden" name="lowPrice">
						<div class="price-line">
							<div title="1" class="price-option">
								<span class="fa fa-square-o"></span>
								100--1000 RMB&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<div title="2" class="price-option">
								<span class="fa fa-square-o"></span>
								1000--2000 RMB&nbsp;&nbsp;
							</div>
						</div>
						<div class="price-line">
							<div title="3" class="price-option">
								<span class="fa fa-square-o"></span>
								2000--3000 RMB&nbsp;&nbsp;
							</div>
							<div title="4" class="price-option">
								<span class="fa fa-square-o"></span>
								3000--5000 RMB&nbsp;&nbsp;
							</div>
						</div>
						<div class="price-line">
							<div title="5" class="price-option">
								<span class="fa fa-square-o"></span>
								5000--10000 RMB
							</div>
							<div title="6" class="price-option">
								<span class="fa fa-square-o"></span>
								10000  以上 RMB&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="price-line">
							<div title="7" class="price-option">
								<span class="fa fa-square-o"></span>
								全部价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						
						<div class="select-btn-warp">
							<div class="qry-btn btn">筛选</div>
						</div>

					</li>
					<li class="bedroom-detail select-detail-item">
						<div class="bedroom-line">
							<label>卧室数：</label>
							<span class="fa fa-minus"></span>
							<input id="bedroom" name="bedroom" type="number" value="0">
							<span class="fa fa-plus"></span>
						</div>
						<div class="bedroom-line select-btn-warp">
							<div class="qry-btn btn">筛选</div>
						</div>
					</li>
				</ul>
			</div>	    

			
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
										'<a href="mobile/villa?id='+item.id+'"><img src="'+ imgurl +'"></a>'+
									'</div>'+
									'<div class="villa-info-warp">'+
										'<div class="villa-info-line1">'+
											'<div class="villa-info-left villa-name-info"><a href="mobile/villa?id='+item.id+'">'+ item.name +'</a></div>'+
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
				
                if (Number(amount)>1 && Number(pageNo) <= Number(amount)) {
                	if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                   		qry();
                	}
                }
                
            });





			//搜索框 隐藏显示	
			$(".search-icon").click(function(){
				$(".search-box").toggle(0);
				$(".select-detail-box").hide(0);
			});

			$(".content").click(function(){
				$(".search-box").hide(0);
				$(".select-detail-box").hide(0);
			});

			//清空地址、人数
			$(".clear-btn").click(function(){
				$("#name").val("");
				$("#people").val("");
			});
			

			//点击目的地

			$(".destination-item").click(function(){
				
				if($(".destination-detail").is(":hidden")){ 
					$(".select-detail-box").show(0);
					$(".select-detail-item").hide(0);
					$(".destination-detail").show(0);
				}else{
					$(".select-detail-box").hide(0);
					$(".select-detail-item").hide(0);
				}

				
			});

			//点击价格
			$(".price-item").click(function(){
				if($(".price-detail").is(":hidden")){ 
					$(".select-detail-box").show(0);
					$(".select-detail-item").hide(0);
					$(".price-detail").show(0);
				}else{
					$(".select-detail-box").hide(0);
					$(".select-detail-item").hide(0);
				}
			});

			//点击卧室

			$(".bedroom-item").click(function(){
				if($(".bedroom-detail").is(":hidden")){ 
					$(".select-detail-box").show(0);
					$(".select-detail-item").hide(0);
					$(".bedroom-detail").show(0);
				}else{
					$(".select-detail-box").hide(0);
					$(".select-detail-item").hide(0);
				}
			});


			//卧室数归零
			$("#bedroom").blur(function(){

				var i = $("#bedroom");

				if (i==""||Number(i.val())<0) {
					i.val(0);
				}
			});
			
			//卧室数++
			$(".fa-plus").click(function(){
				var i = $("#bedroom").val();
				$("#bedroom").val(Number(i)+1);
			});
			//卧室数--
			$(".fa-minus").click(function(){
				var i = $("#bedroom").val();
				if (Number(i)>1) {
					$("#bedroom").val(Number(i)-1);
				}
				
			});


			//点击价格
			$(".price-option").click(function(){
				var t = $(this).attr("title");
				var lowPrice = $("#lowPrice");
				var highPrice = $("#highPrice");

				if (t=="1") {
					lowPrice.val(100);
					highPrice.val(1000);
				}else if (t=="2") {
					lowPrice.val(1000);
					highPrice.val(2000);
				}else if (t=="3") {
					lowPrice.val(2000);
					highPrice.val(3000);
				}else if (t=="4") {
					lowPrice.val(3000);
					highPrice.val(5000);
				}else if (t=="5") {
					lowPrice.val(5000);
					highPrice.val(10000);
				}else if (t=="6") {
					lowPrice.val(10000);
					highPrice.val("");
				}else if (t=="7") {
					lowPrice.val("");
					highPrice.val("");
				}
				$(".fa-check-square-o").removeClass("fa-check-square-o").addClass("fa-square-o");
				$(this).find("span").removeClass("fa-square-o").addClass("fa-check-square-o");
			});

			// //点击已选价格
			// $(".fa-check-square-o").click(function(){
			// 	$(".fa-check-square-o").removeClass("fa-check-square-o").addClass("fa-square-o");
			// 	$("#lowPrice").val("");
			// 	$("#highPrice").val("");
			// });



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