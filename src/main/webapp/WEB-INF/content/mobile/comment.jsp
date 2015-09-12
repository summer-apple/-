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
.comment-body {
    padding-top: 20px;
        padding-bottom: 20px;
}
.comment-body-line {
    width: 100%;
    clear: both;
}
.comment-body-label {
    width: 30%;
    height: 25px;
    line-height: 25px;
    float: left;
}
.comment-body-content {
    width: 70%;
    float: left;
    text-align: left;
}
.star {
    color: #FFA339;
}
#comment-content {
    resize: none;
    width: 80%;
    height: 75px;
    text-align: left;
    font-size: 0.9em;
    padding: 5px;
    color: #666;
    border: 1px solid #666;
}
#add-img-btn {
    width: 75px;
    height: 25px;
    background-color: #FFA339;
    line-height: 25px;
    text-align: center;
    font-size: 0.7em;
    color: #FFF;
}

.comment-foot {
width: 100%;
    height: 30px;
    text-align: right;
    clear: both;
    border-top: 1px solid #EFEFEF;
    margin-top: 20px;
}
.comment-foot a {
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
#gallery-box {
    margin-top: 10px;
}
.img-box {
    width: 20%;
    float: left;
    margin-right: 5%;
    margin-bottom: 10px;
}






		</style>

		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">订单评价</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>
		

			<div class="content">
				<div class="comment-warp">
					<form id="comment-form" action="" method="post">
						<input id="orderid" name="orderid" type="hidden">
						<input id="star" name="star" type="hidden" value="100">
						<input id="villa" name="villa" type="hidden">
											
										
						<div class="comment-title">订单ID：</div>
						<div class="comment-body">
							<div class="comment-body-line">
								<div class="comment-body-label">评分：</div>
								<div class="comment-body-content star-content">
									<span class="star star1 fa fa-star"></span>
									<span class="star star2 fa fa-star"></span>
									<span class="star star3 fa fa-star"></span>
									<span class="star star4 fa fa-star"></span>
									<span class="star star5 fa fa-star"></span>
								</div>
							</div>
							<div class="comment-body-line">
								<div class="comment-body-label">内容：</div>
								<div class="comment-body-content content-content">
									<textarea id="comment-content" name="content" placeholder="快写下你的体验吧~"></textarea>
								</div>
							</div>
							<div class="comment-body-line" style="padding-top: 5px;">
								<div class="comment-body-label">图片：</div>
								<div class="comment-body-content image-content">
									<div id="add-img-btn">上传图片</div>
									<div id="gallery-box" class="album-images"></div>
								</div>
							</div>
						</div>
						<div class="comment-foot">
							<a class="submit-btn" href="javascript:void(0);">提交</a>
							<a class="cancel-btn" href="javascript:void(0);">取消</a>
						</div>

					</form>

					<form id="img-form" style="display:none;">
						<div id="tip-queue" style="width: 300px; height: 300px; background-color: #DDD; display:none;"></div>
						<input id="file_upload" type="file" name="upload" style="display:none;" />
						<select id="img-select" multiple name="img" style="display:none;"></select>
					</form>
				</div>
			</div>

			<div class="foot-blank-box"></div>


				



			<%@include file="foot.jsp"  %>
			<%@include file="menu.jsp"  %>


		<div id="comment-id" style="display:none;"></div>

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
			//获取地址栏参数 调用getUrlParam(name)方法
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r!=null) return unescape(r[2]); return null;
				}
			
			var id = getUrlParam("id");	
			var villa = getUrlParam("villa");

			//设置订单号
			$("#orderid").val(id);
			$(".comment-title").append(id);	

			//设置别墅ID
			$("#villa").val(villa);


			//取消按钮
			$(".cancel-btn").click(function(){
				history.back();
			});


//上传图片
		
     	$("#add-img-btn").click(function(){
    	  $("#real-input:first").click();
        });

  	  	$('#file_upload').uploadifive({
  			'width'           : 0,                 // The width of the button
  			'height'          : 0,                 // The height of the button
  	        'auto' : true,   //取消自动上传 
  	        'uploadScript' : 'img/upload', //处理上传文件Action路径 
  	        'fileObjName'  : 'upload',        //文件对象
	        'buttonText'   : '选择文件',   //按钮显示文字 
	        'queueID'      : 'tip-queue', //drug and drop box's ID 
	        'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型 
	        'fileSizeLimit'   : '2MB',                  // Maximum allowed size of files to upload
	        'formData'     : {"folder":"comment"},//The other data want to send
	        'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 10,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
	        'onUploadComplete' : function(file, data) { //文件上传成功后执行 
	        	var img = $.parseJSON(data);
	        	$("#gallery-box").append(
	        			'<div id="img-box-'+ img.id +'" class="img-box" style="position: relative;">'+
								'<div class="album-image">'+
									'<img id="img-'+ img.id +'" src="'+ img.url +'" class="img-responsive" style="width: 100%;">'+
									'<a class="remove-btn" onclick="delImg('+ img.id +')" href="javascript:void(0);" style="top: 0.5em;right: 0.5em;position: absolute;">'+
									'<span class="fa fa-remove" style="font-size: 14px;color: #666;"></span>'+
								'</div>'+
						'</div>'
	        	);//删除改为异步
					
				$("#img-select").append('<option id="img-option-'+ img.id +'" value="'+ img.id +'" selected>'+ img.id +'</option>');


					}
		});


		//删除图片
		window.delImg = function(id){
			
			$.ajax({
			        url:'img/delCommentImg?id='+id,
			        type:'post',
			        dataType:'json',
			        success:function(data){
			        	if (data==true) {
			        		var $i = 'img-box-'+id;//网页移除图片
			        		$("#"+$i).remove();
			        		var $o = 'img-option-'+id;//移除表单中的项
			        		$("#"+$o).remove();
			        	}else{
			        		alert("删除图片失败...");
			        	}
			        }
			});
			
		}
//评分
		$(".star").click(function(){
			if ($(this).hasClass("star1")) {
				$("#star").val(20);
				$(".star2,.star3,.star4,.star5").removeClass("fa-star").addClass("fa-star-o");
				$(".star1").removeClass("fa-star-o").addClass("fa-star");
			}
			if ($(this).hasClass("star2")) {
				$("#star").val(40);
				$(".star3,.star4,.star5").removeClass("fa-star").addClass("fa-star-o");
				$(".star1,.star2").removeClass("fa-star-o").addClass("fa-star");
			}
			if ($(this).hasClass("star3")) {
				$("#star").val(60);
				$(".star4,.star5").removeClass("fa-star").addClass("fa-star-o");
				$(".star1,.star2,.star3").removeClass("fa-star-o").addClass("fa-star");
			}
			if ($(this).hasClass("star4")) {
				$("#star").val(80);
				$(".star5").removeClass("fa-star").addClass("fa-star-o");
				$(".star1,.star2,.star3,.star4").removeClass("fa-star-o").addClass("fa-star");
			}
			if ($(this).hasClass("star5")) {

				$("#star").val(100);
				$(".star1,.star2,.star3,.star4,.star5").removeClass("fa-star-o").addClass("fa-star");
			}
		});


//提交

	$(".submit-btn").click(function(){

		if ($("#comment-id").html()=="") {//判断是否已经提交过

				//获取别墅字段
				var params = $("#comment-form").serializeArray();
	            var j = {};
	            for (var item in params) {
	                j[params[item].name] = params[item].value;
	            }

	   			
	   			var $img = $("#img-select").val()+"";

	            $.ajax({
	                url:'comment/addComment',
	                data: {data:JSON.stringify(j),img:$img},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                    if (data!=0) {
	                    	$("#comment-id").html(data);
	                    	alert("保存成功...");
	                    	history.back();
	                    }else{
	                    	alert("评论出错！");
	                    }
	                }
	            });
	        }else{
	        	alert("评论已提交...")
	        }
		});


		});
		</script>
	</body>
</html>