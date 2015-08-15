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
						<h4><strong>查询&修改别墅</strong></h4>
						</div>

							<div class="panel panel-default">
								<form class="form-inline">
								<div class="form-group">
									<h4><small></small></h4> 
								</div>
								<div class="form-group">
									<input class="form-control" type="text" placeholder="要查询的别墅名称">
								</div>
								<div class="form-group">
									<select class="form-control">
										<option>--请选择商家--</option>
									</select>
								</div>
								<div class="form-group">
								 	<span>状态</span>
									<select class="form-control">
										<option value="">--请选择--</option>
										<option value="黑名单">黑名单用户</option>
										<option value="普通">普通用户</option>
									</select>
								</div>
								<div class="form-group">
								 	<input id="qryorderbtn" type="button" value="查 询">
								</div>
								</form>
							</div>
<!-- villalist -->
						<div id="villalist" class="panel panel-default">
							<div class="panel-body">
								<div id="img" class="img" style="float:left">
									<img style="width:200px;height:200px;background-color:#f3f3f3;margin-right:20px;margin-top:20px">
								</div>
								<div class="introduce" style="float:left">
									<h3>{name}<small>{star}</small></h3>
									<span>地址 </span>{address}<br/>
									<span>规格 </span>5室，3浴，泳池 可住10-15人<br/>
									<span>描述 </span>blablabla...<br/>
									<div class="service"><span>服务 </span>{service}</div>
									<div class="facility"><span>设施 </span>{facility}</div>
									<span>价格 </span>${price} [特惠价 $1,500]<br/>
								</div>
						  	</div>
							<div>
								<div class="col-sm-5"></div>
								<button type="button" class="btn btn-gray">修 改</button>
								<button type="button" class="btn btn-danger">删 除</button>
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
			function qryVilla(){
				$.ajax({
					url:'../villa/qryVilla',
					data:{'content':facilitycontent,'type':facilitytype},
					type:'get',
					dataType:'json',
					success: function(data){
						$.each(data,function(i,item){
							var vlist=$('#villalist').html();
							var vname=vlist.replace('{name}',item.Name);
							$.each(item.svs,function(index,item2){
								alert(item2.villa);
								alert(item2.svs);

							});
							$(vname).appendTo($("#villalist"));
						});
					}
				});	
			};
			qryVilla();
		});
	</script>
</body>
</html>