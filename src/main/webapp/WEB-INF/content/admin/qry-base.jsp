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
						<div class="panel panel-default">
						<h4><strong class="nnn">查询基础服务</strong></h4>
						<div style="float:right"><a id="servicechange" href="#">服务 </a> | <a id="facilitychange" href="#"> 设施</a></div>
						</div>
<!-- service -->
						<div id="service">
							<div class="panel panel-default">
								<form class="form-inline">
								<div class="form-group">
									<input id="servicecontent" class="form-control" type="text" placeholder="请输入关键字">
								</div>
								 <div class="form-group">
									<select class="form-control" id="servicetype">
										<option value="">--请选择类型--</option>
										<option value="0">免费</option>
										<option value="1">收费</option>
									</select>
								</div>
								<div class="form-group">
								 	<input id="qryservicebtn" type="button" value="查 询">
								</div>
								</form>
							</div>
							<div id="servicelist" class="panel panel-default" style="display:none">
							<table class="table">
								<thead>
									<tr>
										<th>设施名称</th>
										<th>设施类型</th>
										<th>可选操作</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

							</div>
						</div>
<!-- //service -->
<!-- facility -->
						<div id="facility" style="display:none">
							<div class="panel panel-default">
								<form class="form-inline">
								<div class="form-group">
									<input id="facilitycontent" class="form-control" type="text" placeholder="请输入关键字">
								</div>
								 <div class="form-group">
									<select class="form-control" id="facilitytype">
										<option value="">--请选择类型--</option>
										<option value="0">别墅设施</option>
										<option value="1">综合设施</option>
									</select>
								</div>
								<div class="form-group">
								 	<input id="qryfacilitybtn" type="button" value="查 询">
								</div>
								</form>
							</div>
							
							<div id="facilitylist" class="panel panel-default" style="display:none">
							<table class="table">
								<thead>
									<tr>
										<th>服务名称</th>
										<th>服务类型</th>
										<th>可选操作</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
						</div>
<!-- //facility -->
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
			$("#main-menu>li:eq(0)").addClass("active opened");
			$("#servicechange").click(function(){
				$(".nnn").html("查询基础服务");
				$("#service").css("display","block");
				$("#facility").css("display","none");
			});
			$("#facilitychange").click(function(){
				$(".nnn").html("查询基础设施");
				$("#facility").css("display","block");
				$("#service").css("display","none");
			});

			$("#qryservicebtn").click(function(){
				$("#servicelist").css("display","block");
				$("#servicelist tbody").empty();
				var servicecontent = $("#servicecontent").val();
				var servicetype = $("#servicetype").val();
				$.ajax({
					url:'../svs/qrySvs?content='+servicecontent+'&type='+servicetype,
					type:'post',
					dataType:'json',
					success: function(data){
						$.each(data,function(i,item){
							var type="免费";
							if(item.type == 1){
								type="收费";
							}
							$("<tr><td>"+item.content+"</td><td>"+type+"</td><td><botton type='button' class='btn btn-danger' onclick=''>删 除</botton></td></tr>").appendTo($("#servicelist tbody"));
						});
					}
				});
			});
			$("#qryfacilitybtn").click(function(){
				$("#facilitylist").css("display","block")
				$("#facilitylist tbody").empty();
				var facilitycontent = $("#facilitycontent").val();
				var facilitytype = $("#facilitytype").val();
				$.ajax({
					url:'../facility/qryFacility?content='+facilitycontent+'&type='+facilitytype,
					type:'get',
					dataType:'json',
					success: function(data){
						$.each(data,function(i,item){
							var type="别墅设施";
							if(item.type == 1){
								type="综合设施";
							}
							$("<tr><td>"+item.content+"</td><td>"+type+"</td><td><botton type='button' class='btn btn-danger' onclick=''>删 除</botton></td></tr>").appendTo($("#facilitylist tbody"));
						});
					}
				});	
			});

		});
	</script>
</body>
</html>