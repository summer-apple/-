<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

<title>Xenon - Dashboard</title>

<%@include file="css.jsp"%>
<script src="resources/js/jquery-1.11.1.min.js"></script>

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

			

			<div class="page-title">

				<div class="title-env">
					<h1 class="title">Edit Profile</h1>
					<p class="description">Update your profile here.</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="user/user-home"><i class="fa-home"></i>Home</a>
						</li>
						<li><a href="user/user-profile">Profile</a></li>
						<li class="active"><strong>Edit Profile</strong></li>
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
							</a>




							<button type="button" class="btn btn-success btn-block">
								Upload Image</button>
								
							
						</div>

					</div>

					<div class="col-sm-9">

						<div class="panel panel-default user-profile">
							<form class="form-horizontal" action="" method="post">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-name">Username</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="user-name"
											placeholder="Username" disabled>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="nike-name">Nike
										name</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="nike-name"
											placeholder="Nike name">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-email">Email</label>

									<div class="col-sm-10">
										<input type="email" class="form-control" id="user-email"
											placeholder="Email">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="true-name">True
										Name</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="true-name"
											placeholder="True Name">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-local">Local</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="user-local"
											placeholder="Local">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-intro">Personal
										Intro</label>

									<div class="col-sm-10">
										<textarea class="form-control" id="user-intro"
											placeholder="Personal Intro"></textarea>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-gender">Gander</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="user-gender"
											placeholder="Gender">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-phone">Cell
										Phone</label>

									<div class="col-sm-10">
										<input type="text" class="form-control" id="user-phone"
											placeholder="Cell Phone">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="user-birth">Birth
										Day</label>

									<div class="col-sm-10">
										<input type="text" class="form-control datepicker"
											id="user-birth" placeholder="Birth Day">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label">Select list</label>

									<!-- <script type="text/javascript">
										jQuery(document).ready(function($)
										{
											$("#s2example-1").select2({
												placeholder: 'Select your country...',
												allowClear: true
											}).on('select2-open', function()
											{
												// Adding Custom Scrollbar
												$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
											});
											
										});
									</script> -->

									<select class="form-control" id="s2example-1">
										<option></option>
										<optgroup label="North America">
											<option>Alabama</option>
											<option>Alaska</option>
											<option>Arizona</option>
											<option>Arkansas</option>
											<option>California</option>
											<option>Colorado</option>
											<option>Connecticut</option>
											<option>Delaware</option>
											<option>Florida</option>
											<option>Georgia</option>
											<option>Hawaii</option>
											<option>Idaho</option>
											<option>Illinois</option>
											<option>Indiana</option>
											<option>Iowa</option>
											<option>Kansas</option>
											<option>Kentucky[C]</option>
											<option>Louisiana</option>
											<option>Maine</option>
											<option>Maryland</option>
											<option>Massachusetts[D]</option>
											<option>Michigan</option>
											<option>Minnesota</option>
											<option>Mississippi</option>
											<option>Missouri</option>
											<option>Montana</option>
											<option>Nebraska</option>
											<option>Nevada</option>
											<option>New Hampshire</option>
											<option>New Jersey</option>
											<option>New Mexico</option>
											<option>New York</option>
											<option>North Carolina</option>
											<option>North Dakota</option>
											<option>Ohio</option>
											<option>Oklahoma</option>
											<option>Oregon</option>
											<option>Pennsylvania[E]</option>
											<option>Rhode Island[F]</option>
											<option>South Carolina</option>
											<option>South Dakota</option>
											<option>Tennessee</option>
											<option>Texas</option>
											<option>Utah</option>
											<option>Vermont</option>
											<option>Virginia[G]</option>
											<option>Washington</option>
											<option>West Virginia</option>
											<option>Wisconsin</option>
											<option>Wyoming</option>
										</optgroup>
										<optgroup label="Europe">
											<option>Albania</option>
											<option>Andorra</option>
											<option>Armenia</option>
											<option>Austria</option>
											<option>Azerbaijan</option>
											<option>Belarus</option>
											<option>Belgium</option>
											<option>Bosnia & Herzegovina</option>
											<option>Bulgaria</option>
											<option>Croatia</option>
											<option>Cyprus</option>
											<option>Czech Republic</option>
											<option>Denmark</option>
											<option>Estonia</option>
											<option>Finland</option>
											<option>France</option>
											<option>Georgia</option>
											<option>Germany</option>
											<option>Greece</option>
											<option>Hungary</option>
											<option>Iceland</option>
											<option>Ireland</option>
											<option>Italy</option>
											<option>Kosovo</option>
											<option>Latvia</option>
											<option>Liechtenstein</option>
											<option>Lithuania</option>
											<option>Luxembourg</option>
											<option>Macedonia</option>
											<option>Malta</option>
											<option>Moldova</option>
											<option>Monaco</option>
											<option>Montenegro</option>
											<option>The Netherlands</option>
											<option>Norway</option>
											<option>Poland</option>
											<option>Portugal</option>
											<option>Romania</option>
											<option>Russia</option>
											<option>San Marino</option>
											<option>Serbia</option>
											<option>Slovakia</option>
											<option>Slovenia</option>
											<option>Spain</option>
											<option>Sweden</option>
											<option>Switzerland</option>
											<option>Turkey</option>
											<option>Ukraine</option>
											<option>United Kingdom</option>
											<option>Vatican City (Holy See)</option>
										</optgroup>
										<optgroup label="Asia">
											<option>Afghanistan</option>
											<option>Bahrain</option>
											<option>Bangladesh</option>
											<option>Bhutan</option>
											<option>Brunei</option>
											<option>Cambodia</option>
											<option>China</option>
											<option>East Timor</option>
											<option>India</option>
											<option>Indonesia</option>
											<option>Iran</option>
											<option>Iraq</option>
											<option>Israel</option>
											<option>Japan</option>
											<option>Jordan</option>
											<option>Kazakhstan</option>
											<option>Korea North</option>
											<option>Korea South</option>
											<option>Kuwait</option>
											<option>Kyrgyzstan</option>
											<option>Laos</option>
											<option>Lebanon</option>
											<option>Malaysia</option>
											<option>Maldives</option>
											<option>Mongolia</option>
											<option>Myanmar (Burma)</option>
											<option>Nepal</option>
											<option>Oman</option>
											<option>Pakistan</option>
											<option>The Philippines</option>
											<option>Qatar</option>
											<option>Russia</option>
											<option>Saudi Arabia</option>
											<option>Singapore</option>
											<option>Sri Lanka</option>
											<option>Syria</option>
											<option>Taiwan</option>
											<option>Tajikistan</option>
											<option>Thailand</option>
											<option>Turkey</option>
											<option>Turkmenistan</option>
											<option>United Arab Emirates</option>
											<option>Uzbekistan</option>
											<option>Vietnam</option>
											<option>Yemen</option>
										</optgroup>
									</select>


								</div>

							</form>

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




	<%@ include file="script.jsp"%>
	<script src="resources/js/datepicker/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		(function() {

			$().ready(function(e) {

			});

		})(jQuery)
	</script>
</body>
</html>