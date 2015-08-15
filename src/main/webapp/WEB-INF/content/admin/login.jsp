<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>

<title>Xenon - Login</title>

<%@include file="css.jsp"%>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript">
jQuery(document).ready(function($){
	// Reveal Login form
	setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
	// Validation and Ajax action
	$("form#login").validate({
		rules: {
			user_name: {
				required:true,
				remote:{
					url: "check-user-name",
					type: "post",
					contentType: "application/x-www-form-urlencoded; charset=utf-8"
				}
			},				
			password: {
				required: true
			}
		},
		messages: {
			user_name: {
				required: 'Please enter your username.',
				remote:'This userame is exist.'
			},
			password: {
				required: 'Please enter your password.'
			}
		}
	});
	// Set Form focus
	$("form#login .form-group:has(.form-control):first .form-control").focus();
	});
</script>

</head>
<body class="page-body login-page">
	<div class="login-container">
		<div class="row">
			<div class="col-sm-6">

				<!-- Errors container -->
				<div class="errors-container"></div>

				<!-- Add class "fade-in-effect" for login form effect -->
				<form method="post" role="form" id="login"
					class="login-form fade-in-effect" action="login">
					<div class="login-header">
						<p>您好！欢迎登录villa后台管理系统!</p>
					</div>


					<div class="form-group">
						<label class="control-label" for="username"></label> <input
							type="text" class="form-control input-dark" name="user_name"
							id="username" autocomplete="off" placeholder="请输入用户名"/>
					</div>

					<div class="form-group">
						<label class="control-label" for="passwd"></label> <input
							type="password" class="form-control input-dark" name="password"
							id="passwd" autocomplete="off" placeholder="请输入密码"/>
					</div>

					<c:if test="${wrongPassCount>3}">
						<div class="form-group">
							<label class="control-label" for="verify-code">Virfy Code</label>
							<input type="text" class="form-control input-dark"
								name="verify_code" id="verify-code" autocomplete="off" /> <a
								href="#" onclick="changeImg()"><img id="verify-img"
								src="../util/verify-code"
								style="width: 100px; height: 38px; position: absolute; top: 1px; right: 1px;"></a>
						</div>
					</c:if>

					<div class="form-group">
						<button type="submit" class="btn btn-dark  btn-block text-left">
							<i class="fa-lock"></i> 登 录
						</button>
					</div>
<!-- 					<div class="login-footer">
						<a href="forget-pass">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="register">还没注册？?</a>
					</div> -->
				</form>
				<!-- External login -->
			</div>
		</div>
	</div>
	<%@ include file="script.jsp"%>

</body>
</html>