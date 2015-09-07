<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta name="author" content="www.frebsite.nl" />
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
		<link type="text/css" rel="stylesheet" href="resources/css/menu-common.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<title>ONE GO</title>

		<style type="text/css">
.comment-warp{
  width: 90%;
  margin-left: 5%;
  background-color: #FFF;	
}
.comment-title {
    height: 30px;
    border-bottom: 1px solid #EFEFEF;
    line-height: 30px;
	font-size: 0.9em;
	color:#999;
	text-align: left;
	text-indent: 10px;
}


		</style>

		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">订单评价</span>
				<a class="search-icon" href="javascript:void(0);"><span class="fa fa-search"></span></a>
			</div>
		

			<div class="content">
				<div class="comment-warp">
					<form id="comment-form" action="" method="post">
						<input id="order" name="order" type="hidden">
						<input id="star" name="star" type="hidden">
						<select id="img" name="img" style="display:none;"></select>

						<div class="comment-title">订单ID：</div>
						<div class="comment-body">
							<div class="comment-body-line">
								<div class="comment-body-label">评分：</div>
								<div class="comment-body-content">sss</div>
							</div>
							<div class="comment-body-line">
								<div class="comment-body-label">内容：</div>
								<div class="comment-body-content">sss</div>
							</div>
							<div class="comment-body-line">
								<div class="comment-body-label">图片：</div>
								<div class="comment-body-content">sss</div>
							</div>
						</div>
						<div class="comment-foot">
							<a class="cancel-btn" href="javascript:void(0);">取消</a>
							<a class="submit-btn" href="javascript:void(0);">提交</a>
						</div>

					</form>
				</div>
			</div>

			<div class="foot-blank-box"></div>


				



			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>




		</div>

		
		<link rel="stylesheet" href="resources/css/fonts/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		
		
		<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.mmenu.min.all.js"></script>
		<script type="text/javascript">
			$(function() {
				$('nav#menu').mmenu({
					//extensions	: [ 'effect-slide-menu', 'pageshadow' ],
					//searchfield	: true,
					"autoHeight": true,
					counters	: true,
					navbar 		: {
						title		: 'ONE GO'
					},
					navbars		: [
						 {
							position	: 'top',
							content		: [
								'prev',
								'title',
								'close'
							]
						}, {
							position	: 'bottom',
							content		: [
								'<a href="http://gmcfe.pub/" target="_blank">PROWERED BY GMC INC.</a>'
							]
						}
					]
				});
			});
		</script>
		
		<script type="text/javascript">
		$().ready(function(){
			//获取地址栏参数 调用getUrlParam(name)方法
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r!=null) return unescape(r[2]); return null;
				}
			
			var id = getUrlParam("id");	

			//设置订单号
			$("#order").val(id);
			$(".comment-title").append(id);	




			//取消按钮
			$(".cancel-btn").click(function(){
				history.back();
			});


		});
		</script>
	</body>
</html>