<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>Xenon - Dashboard</title>
<%@include file="css.jsp"%>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="page-body">
	<div id="svs" style="display:none"></div>
	<div id="facility" style="display:none"></div>
	<div class="page-container">
		<!-- side-bar -->
		<%@ include file="side-bar.jsp"%>
		<!-- main-content -->
		<div class="main-content">
		<!-- top-bar -->
		<%@ include file="top-bar.jsp"%>
			<!-- profile-env -->
			<section class="profile-env">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
<!-- -->					
						<div class="panel panel-default">
						<h4><strong>查询&修改别墅</strong></h4>
						</div>
<!-- search -->
							<div class="panel panel-default">
								<form id="fm" class="form-inline">
								<input type="hidden" name="province">
								<input type="hidden" name="highPrice">
								<input type="hidden" name="lowPrice">
								<input class="page"type="hidden" name="pageNo" value="1">
								<input type="hidden" name="bedroom">
								<input type="hidden" name="pageSize" value="20">
								<div class="form-group">
									<h4><small></small></h4> 
								</div>
								<div class="form-group">
									<input class="form-control" type="text" placeholder="请输入关键字">
								</div>
								<div class="form-group">
								 	<input id="qryvillabtn" type="button" value="查 询">
								</div>
								</form>
							</div>
<!-- //search -->
<!-- villalist -->
						<div id="villalist2">
						</div>
						<div id="villalist" style="display:none">
						<div class="panel panel-default">
							<div class="panel-body">
								<div id="img" class="img" style="float:left">
									<img style="width:150px;height:150px;background-color:#f3f3f3;margin-right:20px;margin-top:20px">
								</div>
								<div class="introduce" style="float:left">
									<h3>{name}<small>评分：{star}</small></h3>
									<span>地址 </span>{address}<br/>
									<span>规格 </span>{bedroom}室 可住约{people}人<br/>
									<span>描述 </span>{description}<br/>
									<div style="max-width:450px;"><span>服务 </span>{svs}</div>
									<div style="max-width:450px;"><span>设施 </span>{facility}</div>
									<span>价格 </span>￥{price} <span style="color:red;">[特惠价 ￥{s-price}]</span><br/>
								</div>
						  	</div>
							<div>
								<div class="col-sm-5"></div>
								<button type="button" class="btn btn-gray">修 改</button>
								<button type="button" class="btn btn-danger">删 除</button>
							</div>
						</div>
						</div>
<!-- //villalist -->

					</div>
				</div>

			</section>	
		<%@ include file="footer.jsp"%>
		</div>
	</div>

	<%@ include file="script.jsp"%>
	<script src="../resources/js/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#main-menu>li:eq(2)").addClass("active opened");

			$("#qryvillabtn").click(function(){
				$(".page").val(1);
				$("#villalist2 div").remove();
                var params = $("#fm").serializeArray();
                var j = {};
                for (var item in params) {
                    j[params[item].name] = params[item].value;
                }
				$.ajax({
					url:'../villa/qryVilla',
					data:{data:JSON.stringify(j)},
					type:'get',
					dataType:'json',
					success: function(data){
						$.each(data,function(i,item){
							var o=$('#villalist').html();
							var setName=o.replace('{name}',item.name);
							var setAddr=setName.replace('{address}',item.detail);
							var setBedroom=setAddr.replace('{bedroom}',item.bedroom);
							var setPeople=setBedroom.replace('{people}',item.people);
							var setDescript=setPeople.replace('{description}',item.description);
							var setNPrice=setDescript.replace('{price}',item.normalPrice);
							var setSPrice=setNPrice.replace('{s-price}',item.specialPrice);
							var setStar=setSPrice.replace('{star}',item.star);
							$.each(item.svs,function(index,item2){
								var svsold=$("#svs").val();
								var svsnew=svsold+" "+item2.content;
								$("#svs").val(svsnew);
							});
							var svs=$("#svs").val();
							var setSvs=setStar.replace('{svs}',svs);
							$.each(item.facility,function(index2,item3){
								var fold=$("#facility").val();
								var fnew=fold+" "+item3.content;
								$("#facility").val(fnew);
							});
							var facility=$("#facility").val();
							var setFacility=setSvs.replace('{facility}',facility);
							$(setFacility).appendTo($("#villalist2"));
							$("#svs").val("");
							$("#facility").val("");
						});
					}
				});	
				
			});

			window.delVilla = function(){

			};

	        $(window).scroll(function(){
	            if($(document).scrollTop()>=$(document).height()-$(window).height()){
	                var add=parseInt($(".page").val())+1;
	                $(".page").val(add);
					var params = $("#fm").serializeArray();
	                var j = {};
	                for (var item in params) {
	                    j[params[item].name] = params[item].value;
	                }
					$.ajax({
						url:'../villa/qryVilla',
						data:{data:JSON.stringify(j)},
						type:'get',
						dataType:'json',
						success: function(data){
							$.each(data,function(i,item){
								var o=$('#villalist').html();
								var setName=o.replace('{name}',item.name);
								var setAddr=setName.replace('{address}',item.detail);
								var setBedroom=setAddr.replace('{bedroom}',item.bedroom);
								var setPeople=setBedroom.replace('{people}',item.people);
								var setDescript=setPeople.replace('{description}',item.description);
								var setNPrice=setDescript.replace('{price}',item.normalPrice);
								var setSPrice=setNPrice.replace('{s-price}',item.specialPrice);
								var setStar=setSPrice.replace('{star}',item.star);
								// $.each(item.svs,function(index,item2){
								// 	alert(item2.villa);
								// 	alert(item2.svs);

								// });
								$(setStar).appendTo($("#villalist2"));
							});
						}
					});	
				}
			});
		});
	</script>
</body>
</html>