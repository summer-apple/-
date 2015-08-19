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
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />

<title>Villa - Dashboard</title>

<%@ include file="css.jsp" %>



<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


</head>
<body class="page-body">

	

	<div class="page-container">
		<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

		<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
		<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
		<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->

		<%@ include file="side-bar.jsp"%>
		<div class="main-content">

			<%@ include file="top-bar.jsp"%>

			<div class="page-title">

				<div class="title-env">
					<h1 class="title">Profile</h1>
					<p class="description">User profile and story timeline</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="member/home"><i class="fa-home"></i>Home</a></li>
						<li><a href="member/profile">Profile</a></li>
						<li class="active"><strong>Profile</strong></li>
					</ol>

				</div>

			</div>
			<section class="profile-env">

				<div class="row">

					<div class="col-sm-3">

						<!-- User Info Sidebar -->
						<div class="user-info-sidebar">

							<a href="#" class="user-img"> <img
								src="resources/images/user-4.png" alt="user-img"
								class="img-cirlce img-responsive img-thumbnail" width="150px" />
							</a> <a href="#" class="user-name"> Art Ramadani <span
								class="user-status is-online"></span>
							</a>





							<ul class="list-unstyled user-info-list">

								<li><i class="fa-spin fa-cog"></i> <a
									href="member/edit-profile">Edit Profile</a></li>
							</ul>

							<hr />

							<ul class="list-unstyled user-friends-count">
								<li><span>643</span> followers</li>
								<li><span>108</span> following</li>
							</ul>

							<button type="button" class="btn btn-success btn-block text-left">
								Following <i class="fa-check pull-right"></i>
							</button>
						</div>

					</div>

					<div class="col-sm-9">

						<div class="panel user-profile">
							<dl class="dl-horizontal">
								<dt>Username</dt>
								<dd>Summer.</dd>

								<dt>Nike name</dt>
								<dd>GMC</dd>

								<dt>Email</dt>
								<dd>summer@gmcfe.pub</dd>

								<dt>True Name</dt>
								<dd>Xia Dong</dd>

								<dt>Local</dt>
								<dd>Zhejiang Shaoxing</dd>

								<dt>Personal Intro</dt>
								<dd>Program ape.</dd>

								<dt>Gender</dt>
								<dd>Male</dd>

								<dt>Cell Phone</dt>
								<dd>15757135741</dd>

								<dt>Birth Day</dt>
								<dd>1992-09-26</dd>

								<dt>Address</dt>
								<dd>Zhejiang Province Shaoxing City Keqiao District
									Yangxunqiao Town Lianshe Village No.257</dd>
							</dl>

						</div>

						<div class="panel store-profile">
							<dl class="dl-horizontal">
								<dt>Store Name</dt>
								<dd>GMCFUER</dd>

								<dt>Brand</dt>
								<dd>LUJAN</dd>

								<dt>Local</dt>
								<dd>Zhejiang Hangzhou</dd>

								<dt>Intro</dt>
								<dd>Lujan collect the most interesting tings on the earth.</dd>

								<dt>Store Type</dt>
								<dd>Personal Part Time</dd>
								<!-- personal-full-time,company -->

								<dt>Goods Source</dt>
								<dd>Own Production</dd>

								<dt>Service Phone</dt>
								<dd>15757135741</dd>

								<dt>Store Mail</dt>
								<dd>gmcfure@store.gmcfe.pub</dd>

								<dt>Address</dt>
								<dd>Zhejiang Province Hangzhou City Jianggan District
									Xueyuan Street No.18</dd>

								<dt>Logo</dt>
								<dd></dd>

							</dl>

						</div>

					</div>



				</div>

			</section>

			<!-- Main Footer -->
			<!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
			<!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
			<!-- Or class "fixed" to  always fix the footer to the end of page -->
			<%@ include file="footer.jsp"%>
		</div>

		

	</div>


	<div class="page-loading-overlay">
		<div class="loader-2"></div>
	</div>




	<%@ include file="script.jsp" %>

</body>
</html>