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
						<div class="panel panel-default user-profile"><h4><strong>新增商家</strong></h4></div>
						<div class="panel panel-default user-profile">
							<form id="fm" class="form-horizontal" action="" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label">商家名称</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" name="name" 
											placeholder="请输入商家名称">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">负责人</label>

									<div class="col-sm-10">
										<input type="email" class="form-control" name="owner" 
											placeholder="请输入负责人姓名">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">
										<div class="radio">
											<label><input type="radio" name="gender" value="男" checked>男</label>
											<label><input type="radio" name="gender" value="女">女</label>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-gender">身份证号</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" name="id_card"
											placeholder="请输入身份证号">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">地址</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" name="address"
											placeholder="请输入地址">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">联系方式</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											name="mobilephone" placeholder="手机号">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											name="telephone" placeholder="座机号">
									</div>
								</div>

								<div class="form-group">
								<div class="col-sm-5"></div>
								<button id="addstorebtn" type="button" class="btn btn-info btn-single pull-right">保 存</button>
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
			$("#main-menu>li:eq(1)").addClass("active opened");

			$("#addstorebtn").click(function(){
                var params = $("#fm").serializeArray();
                var j = {};
                for (var item in params) {
                    j[params[item].name] = params[item].value;
                }
                $.ajax({
                    url:'../service/addStore',
                    data: JSON.stringify(j),
                    type:'post',
                    dataType:'json',
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