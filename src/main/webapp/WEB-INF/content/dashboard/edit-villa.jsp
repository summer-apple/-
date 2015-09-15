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
					<h1 class="title">别墅管理</h1>
					<p class="description">create new villas</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li><a href="javascript:void(0);">别墅管理</a></li>
						<li class="active"><strong>编辑别墅</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->
			<div class="update-panel panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">编辑别墅</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">–</span>
									<span class="expand-icon">+</span>
								</a>
								<a href="javascript:void(0);" class="close-panel">
									×
								</a>
							</div>
						</div>
						<div class="panel-body">
							
							<form id="update-form" role="form" class="form-horizontal" action="" method="post">
								
								<input name="id" type="hidden" id="id"  value="${villa.id}">


								

								<div class="form-group">
									<label class="col-sm-2 control-label" for="name">别墅名</label>
									
									<div class="col-sm-10">
										<input name="name" type="text" class="form-control" id="name" placeholder="别墅名"  value="${villa.name}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="store">商户ID</label>
									
									<div class="col-sm-10">
										<input name="store" type="text" class="form-control" id="store" placeholder="商户ID"  value="${villa.store}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="bedroom">床位数</label>
									
									<div class="col-sm-10">
										<input name="bedroom" type="number" class="form-control" id="bedroom" placeholder="床位数"  value="${villa.bedroom}">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="people">人&nbsp;&nbsp;&nbsp;数</label>
									
									<div class="col-sm-10">
										<input name="people" type="number" class="form-control" id="people" placeholder="人数"   value="${villa.people}">
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="normalPrice">普通价</label>
									
									<div class="col-sm-10">
										<input name="normalPrice" type="number" class="form-control" id="normalPrice" placeholder="普通价 保留两位小数"  value="${villa.normalPrice}">
									</div>
								</div>

								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="specialPrice">特殊价</label>
									
									<div class="col-sm-10">
										<input name="specialPrice" type="number" class="form-control" id="specialPrice" placeholder="特殊价 保留两位小数"  value="${villa.specialPrice}">
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="weight">权&nbsp;&nbsp;&nbsp;重</label>
									
									<div class="col-sm-10">
										<input name="weight" type="number" class="form-control" id="weight" placeholder="1-100 数值越大排名越靠前"  value="${villa.weight}">
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="province">省&nbsp;&nbsp;&nbsp;份</label>
									
									<div class="col-sm-10">
										<input name="province" type="text" class="form-control" id="province" placeholder="省份 如：浙江省"   value="${villa.province}">
									</div>
										
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="city">城&nbsp;&nbsp;&nbsp;市</label>
									
									<div class="col-sm-10">
										<input name="city" type="text" class="form-control" id="city" placeholder="城市 如：杭州市"  value="${villa.city}">
									</div>
										
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="district">区&nbsp;/&nbsp;县</label>
									
									<div class="col-sm-10">
										<input name="district" type="text" class="form-control" id="district" placeholder="区/县 如：西湖区"  value="${villa.district}">
									</div>
										
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="detail">具体地址</label>
									
									<div class="col-sm-10">
										<textarea name="detail" class="form-control autogrow" cols="5" id="address" placeholder="街道/乡镇-具体地址(100字以内)" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 50px;">${villa.detail}</textarea>
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="description">别墅详情</label>
									<div class="col-sm-10">
									<textarea id="description" name="description" class="form-control wysihtml5" data-stylesheet-url="../resources/js/wysihtml5/lib/css/wysiwyg-color.css" name="sample_wysiwyg" id="sample_wysiwyg">${villa.description}</textarea>
									</div>
								</div>

							</form>

			<div class="vspacer v2"></div>


							<form id="svs-form" role="form" class="form-horizontal" action="" method="post">
								
							</form>



							<!--选择服务-->
							<form id="svs-form" class="form-horizontal" role="form" action="" method="post">
								
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label">选择服务</label>
									<div class="col-sm-10">	
										已选：
										<c:forEach items="${villa.svs}" var="svs">${svs.content}  </c:forEach>
										
										<select id="o-svs-select" multiple style="display:none;">
											<c:forEach items="${villa.svs}" var="svs">
												<option value="${svs.id}" selected>${svs.id}</option>
											</c:forEach>
										</select>
										

									</div>
									
										
									<script type="text/javascript">
										jQuery(document).ready(function($)
										{
											$("#svs-select").select2({
												placeholder: '增加新的服务',
												allowClear: true
											}).on('select2-open', function()
											{
												// Adding Custom Scrollbar
												$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
											});
											
										});
									</script>
									
									
									
									
									
									<div class="col-sm-2" ></div>
									<div class="svs-select-box col-sm-10" style="display: block;">	
									
										<select class="form-control col-sm-10" id="svs-select" multiple name="svs">
											<option></option>
											<optgroup class="free-svs" label="---免费服务---">
												
											</optgroup>
												
											<optgroup class="cost-svs" label="---收费服务---">
								
											</optgroup>
										</select>
									</div>	
								</div>
								
								
							</form>

					<div class="vspacer v2"></div>
<!--选择设施-->

							<form id="facility-form" class="form-horizontal" role="form" action="" method="post">
								
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label">选择设施</label>
									<div class="col-sm-10">	
										已选：
										<c:forEach items="${villa.facility}" var="facility">${facility.content}  </c:forEach>
										
										<select id="o-facility-select" multiple style="display:none;">
											<c:forEach items="${villa.facility}" var="facility">
												<option value="${facility.id}" selected>${facility.id}</option>
											</c:forEach>
										</select>
										

									</div>
										
									<script type="text/javascript">
										jQuery(document).ready(function($)
										{
											$("#facility-select").select2({
												placeholder: '添加新的设施',
												allowClear: true
											}).on('select2-open', function()
											{
												// Adding Custom Scrollbar
												$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
											});
											
										});
									</script>
									<div class="col-sm-2"></div>
									<div class="col-sm-10">	
										<select class="form-control" id="facility-select" multiple name="facility">
											<option></option>
											<optgroup class="villa-facility" label="---别墅设施---">

											</optgroup>

											<optgroup class="general-facility" label="---综合设施---">
								
											</optgroup>
										</select>
									</div>		
								</div>
								
								
							</form>



						<div class="vspacer v2"></div>
<!--图片表单-->


							<form id="img-form" class="form-horizontal" role="form" action="" method="post">
								
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label">选择图片</label>
									
										
								
									<div class="col-sm-10">	

										<button id="add-img-btn" type="button" class="btn btn-primary btn-single btn-sm">选 择</button>
										<div id="tip-queue" style="width: 300px; height: 300px; background-color: #DDD; display:none;"></div>
										<input id="file_upload" type="file" name="upload" style="display:none;" />

										<select class="form-control" id="img-select" multiple name="img" style="display:none;">
											<c:forEach items="${villa.img}" var="img">
													<option id="img-option-${img.id}" value="${img.id}" selected>${img.id}</option>
											</c:forEach>
										</select>
									</div>		
								</div>
								
								
							</form>


				<div class="vspacer v2"></div>










				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-10">
					
					<div id="gallery-box" class="album-images row">
					<c:forEach items="${villa.img}" var="img">
						<div id="img-box-${img.id}" class="img-box col-md-3 col-sm-4 col-xs-6" style="position: relative;">
								<div class="album-image"><img id="img-${img.id}" src="${img.url}" class="img-responsive" style="width: 100%;">
								<a class="remove-btn" onclick="delImg(${img.id})" href="javascript:void(0);" style="top: 10px;right: 26px;position: absolute;">
								<span class="fa fa-remove" style="font-size: 14px;color: #666;"></span></a>
								</div>
						</div>
					</c:forEach>
					</div>
				</div>
				</div>
<div class="vspacer v2"></div>








								<div class="row">
									<div class="col-sm-6">
									</div>
									<div class="col-sm-2">
										<!-- <a href="javascript:void(0);" id="add-btn" class="btn btn-primary btn-single btn-sm">保存</a> -->
										
										<button id="update-btn" type="button" class="btn btn-primary btn-single btn-sm">更 新</button>
									</div>
								</div>


							
						</div>
					</div>








					
<!--新增商户表单结束-->


<!--主体部分结束-->
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
	<link rel="stylesheet" href="resources/js/select2/select2.css">
	<link rel="stylesheet" href="resources/js/select2/select2-bootstrap.css">
	<script src="resources/js/select2/select2.min.js"></script>
	<script src="resources/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="resources/js/selectboxit/jquery.selectBoxIt.min.js"></script>
	<script src="resources/js/multiselect/js/jquery.multi-select.js"></script>
	<script src="resources/js/jquery.uploadifive.js"></script>

	<link rel="stylesheet" href="resources/js/wysihtml5/src/bootstrap-wysihtml5.css">
	<script src="resources/js/wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
	<script src="resources/js/wysihtml5/src/bootstrap-wysihtml5.js"></script>


	<script type="text/javascript">
	$().ready(function(){
//隐藏编辑器无用按钮
		$(".wysihtml5-toolbar > li:eq(5)").hide();
		$(".wysihtml5-toolbar > li:eq(6)").hide();
		$(".html-code-icon").hide();

//获取服务列表
	$.ajax({
                url:'svs/qrySvs',
                data: {data:'{"content":"","type":""}'},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data, function(i, item) {

                		if (item.type==0) {
                			$(".free-svs").append(
                				"<option value='"+item.id+"'>"+item.content+"</option>"
                			);
                		}else{
                			$(".cost-svs").append(
                				"<option value='"+item.id+"'>"+item.content+"</option>"
                			);
                		}


                		 $("#qry-table tbody").append(
                		"<tr>"+
						"	<td>"+item.id+"</td>"+
						"	<td>"+item.content+"</td>"+
						"	<td>"+item.typeValue+"</td>"+
						"	<td><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
						"</tr>"
                		 );
                  	});
                }
            });

//获取设施列表
	$.ajax({
                url:'facility/qryFacility',
                data: {data:'{"content":"","type":""}'},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data, function(i, item) {

                		if (item.type==0) {
                			$(".villa-facility").append(
                				"<option value='"+item.id+"'>"+item.content+"</option>"
                			);
                		}else{
                			$(".general-facility").append(
                				"<option value='"+item.id+"'>"+item.content+"</option>"
                			);
                		}


                		 $("#qry-table tbody").append(
                		"<tr>"+
						"	<td>"+item.id+"</td>"+
						"	<td>"+item.content+"</td>"+
						"	<td>"+item.typeValue+"</td>"+
						"	<td><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
						"</tr>"
                		 );
                  	});
                }
            });


//添加

	$("#update-btn").click(function(){



			//获取别墅字段
			var params = $("#update-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }


   			var $svs = $("#o-svs-select").val()+","+$("#svs-select").val()+"";
   			
   			var $facility = $("#o-facility-select").val()+","+$("#facility-select").val()+"";
   			
   			var $img = $("#img-select").val()+"";

            $.ajax({
                url:'villa/updateVilla',
                data: {data:JSON.stringify(j),svs:$svs,facility:$facility,img:$img},
                type:'post',
                dataType:'json',
                success:function(data){
                    if (data==0) {
                    	alert("该别墅已存在...");
                    }else{
                    	alert("保存成功...");
                    }
                }
            });
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
	        'formData'     : {"folder":"gallery"},//The other data want to send
	        'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 10,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
	        'onUploadComplete' : function(file, data) { //文件上传成功后执行 
	        	var img = $.parseJSON(data);
	        	$("#gallery-box").append(
	        			'<div id="img-box-'+ img.id +'" class="img-box col-md-3 col-sm-4 col-xs-6" style="position: relative;">'+
								'<div class="album-image">'+
									'<img id="img-'+ img.id +'" src="'+ img.url +'" class="img-responsive" style="width: 100%;">'+
									'<a class="remove-btn" onclick="delImg('+ img.id +')" href="javascript:void(0);" style="top: 10px;right: 26px;position: absolute;">'+
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
	        url:'img/delVillaImg?id='+id,
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

//修改服务按钮

	//$(".")







	});
	</script>
</body>
</html>