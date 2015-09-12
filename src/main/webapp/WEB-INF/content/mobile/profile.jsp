<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
.userinfo-warp{
  width: 90%;
  margin-left: 5%;
  background-color: #FFF;	
}
.userinfo-title {
    height: 30px;
    border-bottom: 1px solid #EFEFEF;
    line-height: 30px;
	font-size: 0.9em;x
	color:#999;
	text-align: left;
	text-indent: 10px;
}
.userinfo-body {
    padding-top: 20px;
    padding-bottom: 20px;
}
.userinfo-body-line {
    width: 100%;
    clear: both;
   height: 40px;
}
.userinfo-body-label {
    width: 30%;
    height: 25px;
    line-height: 25px;
    float: left;
}
.userinfo-body-content {
    width: 70%;
    float: left;
    text-align: left;
}
.userinfo-body-content input{
	width: 80%;
	border: 1px solid #666;
	border-radius: 0;
	height: 25px;
	line-height: 25px;
	text-indent: 5px;
	text-align: left;
	color: #666;
}
#userinfo-content {
    resize: none;
    width: 80%;
    height: 75px;
    text-align: left;
    font-size: 0.9em;
    padding: 5px;
    color: #666;
    border: 1px solid #666;
}


.userinfo-foot {
width: 100%;
    height: 30px;
    text-align: right;
    clear: both;
    border-top: 1px solid #EFEFEF;
    margin-top: 20px;
}
.userinfo-foot a {
font-size: 0.8em;
    color: #FFA339;
    border: 1px solid #FFA339;
    border-radius: 5px;
    display: block;
    width: 50px;
    height: 20px;
    margin-top: 5px;
    margin-right: 10px;
    float: right;
    line-height: 20px;
    text-align: center;
}







		</style>

		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">个人信息</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>
		

			<div class="content">
				<div class="userinfo-warp">
					<form id="userinfo-form" action="" method="post">
						<input id="memberid" name="id" type="hidden" value="${member.id}">
						
						<div class="userinfo-title">用户ID：${member.id}</div>
						<div class="userinfo-body">
							<div class="userinfo-body-line">
								<div class="userinfo-body-label">姓名：</div>
								<div class="userinfo-body-content">
									<input type="text" name="truename" value="${member.truename}">
								</div>
							</div>
							<div class="userinfo-body-line">
								<div class="userinfo-body-label">手机：</div>
								<div class="userinfo-body-content">
									<input type="phone" name="phone" value="${member.phone}">
								</div>
							</div>
							<div class="userinfo-body-line">
								<div class="userinfo-body-label">邮箱：</div>
								<div class="userinfo-body-content">
									<input type="email" name="email" value="${member.email}">
								</div>
							</div>
							<div class="userinfo-body-line">
								<div class="userinfo-body-label">生日：</div>
								<div class="userinfo-body-content">
									<input type="date" name="birthday" value="<fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd"/>">
								</div>
							</div>
						</div>
						<div class="userinfo-foot">
							<a class="submit-btn" href="javascript:void(0);">保存</a>
							<a class="cancel-btn" href="javascript:void(0);">取消</a>
						</div>

					</form>
				</div>
			</div>

			<div class="foot-blank-box"></div>


				



			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>


		<div id="userinfo-id" style="display:none;"></div>

		</div>

		
		<link rel="stylesheet" href="resources/css/fonts/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css">
		
		
		<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.mmenu.min.all.js"></script>
		<script src="resources/js/jquery.uploadifive.js"></script>
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
			

			//取消按钮
			$(".cancel-btn").click(function(){
				history.back();
			});




//提交

	$(".submit-btn").click(function(){

		
				//获取别墅字段
				var params = $("#userinfo-form").serializeArray();
	            var j = {};
	            for (var item in params) {
	                j[params[item].name] = params[item].value;
	            }

	   		

	            $.ajax({
	                url:'member/updateInfo',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                    if (data==true) {
	                    	alert("保存成功...");
	                    	window.location.href="mobile/index";
	                    	
	                    }
	                }
	            });
	        
		});


		});
		</script>
	</body>
</html>