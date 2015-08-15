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
						<h4><strong>查询&修改商家信息</strong></h4>
						</div>

							<div class="panel panel-default">
								<form class="form-inline">
								<div class="form-group">
									<h4><small></small></h4> 
								</div>
								<div class="form-group">
									<input class="form-control" type="text" placeholder="要查询的商家名称">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" placeholder="要查询的负责人姓名">
								</div>
								 <div class="form-group">
								 	<span>性别</span>
									<select class="form-control">
										<option value="">--请选择--</option>
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
								</div>
								<div class="form-group">
								 	<input id="qrystorebtn" type="button" value="查 询">
								</div>
								</form>
							</div>

						<div class="panel panel-default">
							<h4><strong>商家名称 </strong> | <small> 负责人姓名</small></h4>
							<div class="panel-body">
						    	<span class="glyphicon glyphicon-user" aria-hidden="true"></span> 3306831111111111111<br/>
						    	<span class="glyphicon glyphicon-home" aria-hidden="true"></span> 浙江省杭州市武林壹号<br/>
								<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 1111111111 | 22222<br/>
						  	</div>
							<div>
								<div class="col-sm-5"></div>
								<button type="button" class="btn btn-gray">修 改</button>
								<button type="button" class="btn btn-danger">删 除</button>
							</div>
						</div>
						

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
			$("#main-menu>li:eq(1)").addClass("active opened");
			$("#qryfacilitybtn").click(function(){
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