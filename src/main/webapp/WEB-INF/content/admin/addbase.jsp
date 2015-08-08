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
					<div class="col-sm-2"></div>
					<div class="col-sm-8">
						<div class="panel panel-default user-profile"><h4><strong>新增服务&设施</strong></h4></div>
						<div class="panel panel-default user-profile">
							<form id="fm" class="form-horizontal" action="" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">基础服务</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="content" 
											placeholder="请输入服务名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">服务类型</label>
									<div class="col-sm-9">
										<div class="radio">
											<label><input type="radio" name="type" value="0" checked>免费</label>
											<label><input type="radio" name="type" value="1">收费</label>
										</div>
									</div>
								</div>

								<div class="form-group">
								<div class="col-sm-6"><button id="addservicebtn" type="button" class="btn btn-info btn-single pull-right">保 存</button></div>
								</div>
							</form>
						</div>
						<div class="panel panel-default user-profile">
							<form id="fm2" class="form-horizontal" action="" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">基础设施</label>
									<div class="col-sm-9">
										<input type="email" class="form-control" name="content" 
											placeholder="请输入设施名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">服务类型</label>
									<div class="col-sm-9">
										<div class="radio">
											<label><input type="radio" name="type" value="0" checked>别墅设施</label>
											<label><input type="radio" name="type" value="1">综合设施</label>
										</div>
									</div>
								</div>

								<div class="form-group">
								<div class="form-group">
								<div class="col-sm-6"><button id="addfalicitybtn" type="button" class="btn btn-info btn-single pull-right">保 存</button></div>
								</div>

							</form>
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
			$("#addservicebtn").click(function(){
                var params = $("#fm").serializeArray();
                var j = {};
                for (var item in params) {
                    j[params[item].name] = params[item].value;
                }

                $.ajax({
                    url:'../svs/addSvs',
                    data: {data:JSON.stringify(j)},
                    type:'post',
                    dataType:'json',
                    success:function(){
                      alert("数据传送成功");
                    }
                });

              var str=JSON.stringify(j);
              alert("序列化："+str);
			});

			$("#addfalicitybtn").click(function(){
                var params = $("#fm2").serializeArray();
                var j = {};
                for (var item in params) {
                    j[params[item].name] = params[item].value;
                }
                $.ajax({
                    url:'../svs/addFalicity',
                    data: JSON.stringify(j),
                    type:'post',
                    dataType:'json',
                    headers:{
                        Accept:"application/json",
                        "Content-Type":"application/json"
                    },
                    success:function(){
                      alert("数据传送成功");
                    }
                });

              var str=JSON.stringify(j);
              alert("序列化："+str);
			});
		});
	</script>
</body>
</html>