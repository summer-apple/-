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

		<title>ONE GO</title>

		
	
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>

			<div class="test"style="padding-top: 104px;margin-left: 50px;">
				<form>
					<input id="a" type="date" value="2015-08-14" style="width: 200px; height: 30px; border: 1px solid #D82E2E;">
				</form>
				
				
				${member.openid}<br>
				${member.nickname}<br>
				${member.truename}<br>
				${member.phone}<br>
				${member.email}<br>
				${member.birthday}<br>
			</div>
			

			<div class="foot-blank-box"></div>

			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>
		</div>

		<link type="text/css" rel="stylesheet" href="resources/css/menu-common.css" />
		<link type="text/css" rel="stylesheet" href="resources/css/jquery.mmenu.all.css" />
		<link rel="stylesheet" href="resources/css/fonts/fontawesome/css/font-awesome.min.css">
		<!-- <link rel="stylesheet" href="resources/css/fonts/elusive/css/elusive.css">
		<link rel="stylesheet" href="resources/css/bootstrap.css"> -->
		
		
		<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="resources/js/jquery.slides.min.js"></script>
		<!-- <script src="resources/js/bootstrap.min.js"></script> -->
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
			
			/* function getUrlParam(name) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r!=null) return unescape(r[2]); return null;
				}
			
			var id = getUrlParam("code"); */

			//alert(id);

			
			/* $("input").change(function(){
				alert($(this).val());
				}); */


		Date.prototype.Format = function(fmt){ //author: meizz   
				  var o = {   
				    "M+" : this.getMonth()+1,                 //月份   
				    "d+" : this.getDate(),                    //日   
				    "h+" : this.getHours(),                   //小时   
				    "m+" : this.getMinutes(),                 //分   
				    "s+" : this.getSeconds(),                 //秒   
				    "q+" : Math.floor((this.getMonth()+3)/3), //季度   
				    "S"  : this.getMilliseconds()             //毫秒   
				  };   
				  if(/(y+)/.test(fmt))   
				    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
				  for(var k in o)   
				    if(new RegExp("("+ k +")").test(fmt))   
				  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
				  return fmt;   
				}  
			

			var time1 = new Date().Format("yyyy-MM-dd HH:mm:ss");     
  
			var time2 = new Date().Format("yyyy-MM-dd");    

			var d = new Date()
			//alert(time2);
			$("#a").val(time2);

		});
		</script>
	</body>
</html>