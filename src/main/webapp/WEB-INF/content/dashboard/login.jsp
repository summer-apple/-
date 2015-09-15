<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>Xenon - Login</title>

	<link rel="stylesheet" href="http://fonts.useso.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="../resources/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="../resources/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="../resources/css/bootstrap.css">
	<link rel="stylesheet" href="../resources/css/xenon-core.css">
	<link rel="stylesheet" href="../resources/css/xenon-forms.css">
	<link rel="stylesheet" href="../resources/css/xenon-components.css">
	<link rel="stylesheet" href="../resources/css/xenon-skins.css">
	<link rel="stylesheet" href="../resources/css/custom.css">

	<script src="../resources/js/jquery-1.11.1.min.js"></script>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	
</head>
<body class="page-body login-page">

	
	<div class="login-container">
	
		<div class="row">
		
			<div class="col-sm-6">
			
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						// Reveal Login form
						setTimeout(function(){ $(".fade-in-effect").addClass('in'); }, 1);
						
						
						// Validation and Ajax action
						$("form#login").validate({
							rules: {
								name: {
									required: true
								},
								
								password: {
									required: true
								}
							},
							
							messages: {
								name: {
									required: 'Please enter your username.'
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
				
				<!-- Errors container -->
				<div class="errors-container">
				
									
				</div>
				
				<!-- Add class "fade-in-effect" for login form effect -->
				<form action="../admin/login" method="post" role="form" id="login" class="login-form fade-in-effect">
					
					<div class="login-header">
						<a href="dashboard-1.html" class="logo">
							<img src="../resources/images/logo@2x.png" alt="" width="80" />
							<span>log in</span>
						</a>
						
						<p>Dear user, log in to access the admin area!</p>
						
						<c:if test="${!empty result}">
							<p>
								<span class="text-danger">${result}</span>
							</p>
						</c:if>
					</div>
	
					
					<div class="form-group">
						<label class="control-label" for="username">Username</label>
						<input type="text" class="form-control input-dark" name="name" id="username" autocomplete="off" />
					</div>
					
					<div class="form-group">
						<label class="control-label" for="passwd">Password</label>
						<input type="password" class="form-control input-dark" name="password" id="passwd" autocomplete="off" />
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-dark  btn-block text-left">
							<i class="fa-lock"></i>
							Log In
						</button>
					</div>
					
					<div class="login-footer">
						<a href="#">Forgot your password?</a>
						
						<div class="info-links">
							<a href="#">ToS</a> -
							<a href="#">Privacy Policy</a>
						</div>
						
					</div>
					
				</form>
				
			
				
			</div>
			
		</div>
		
	</div>



	<!-- Bottom Scripts -->
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/TweenMax.min.js"></script>
	<script src="../resources/js/resizeable.js"></script>
	<script src="../resources/js/joinable.js"></script>
	<script src="../resources/js/xenon-api.js"></script>
	<script src="../resources/js/xenon-toggles.js"></script>
	<script src="../resources/js/jquery-validate/jquery.validate.min.js"></script>
	<script src="../resources/js/toastr/toastr.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../resources/js/xenon-custom.js"></script>

</body>
</html>