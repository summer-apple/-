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
					<h1 class="title">服务管理</h1>
					<p class="description">query and create new services</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li><a href="javascript:void(0);">服务&设施</a></li>
						<li class="active"><strong>服务</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->


			<div class="panel panel-default">
				
				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-10">
						

						<form class="form-inline" id="qry-form" action="" method="post">
							<div class="form-group"> 
								<input id="content" name="content" class="form-control" type="text" placeholder="关键字">
							</div>
							<div class="form-group">
								<select class="form-control" id="type" name="type">
									<option value="">服务类型</option>
									<option value="0">免费</option>
									<option value="1">收费</option>
								</select>
							</div>
							<div class="form-group">
								<button id="qry-btn" type="button" class="btn btn-primary btn-single btn-sm">查 询</button>
							</div>
						</form>




						
 
					</div>
					<div class="col-sm-2">
						<a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});" class="btn btn-primary btn-single btn-sm">新建服务</a>
					</div>
				</div>

				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-12">
						<table id="qry-table" class="table table-bordered table-striped table-condensed table-hover">
										<thead>
											<tr>
												<th>服务ID</th>
												<th>服务名称</th>
												<th>服务类型</th>
												<th>操作</th>
											</tr>
										</thead>
										
										<tbody>
											
										</tbody>
						</table>
					</div>
				</div>
				

			</div>

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
<!--新增表单开始-->
	<div class="modal fade" id="modal-6" aria-hidden="true" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">新增-编辑 服务</h4>
				</div>
				
				<div class="modal-body">
				
				<form id="add-form" role="form" class="form-horizontal" action="" method="post">
				
					<div class="row">
						<div class="col-md-6">
							
							<div class="form-group">
								<label for="content" class="control-label">服务名称</label>
								
								<input name="content" type="text" class="form-control" id="content" placeholder="建议2或4个汉字...">
							</div>	
							
						</div>
						<div class="col-md-2"></div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="type" class="control-label">服务类型</label>
								
								<div class="radio">
											<label><input type="radio" name="type" value="0" checked>免费</label>
											<label><input type="radio" name="type" value="1">收费</label>
								</div>
							</div>
			
							
						</div>
					</div>


				</form>
					
					
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">取 消</button>
					<button id="add-btn" type="button" class="btn btn-info">保 存</button>
				</div>
			</div>
		</div>
	</div>
<!--新增表单结束-->

	<%@ include file="script.jsp" %>
	<script type="text/javascript">
	$().ready(function(){
//首次进入时刷新
		qry();
//点击查询时刷新
		$("#qry-btn").click(function(){
			qry();
		});
//查询方法
		function qry(){
            var params = $("#qry-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }
            $.ajax({
                url:'svs/qrySvs',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data, function(i, item) {
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
		}

//添加

	$("#add-btn").click(function(){
			var params = $("#add-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }
            $.ajax({
                url:'svs/addSvs',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    if (data==true) {
                    	alert("保存成功...");
                    	qry();
                    }else{
                    	alert("该服务已存在...");
                    	qry();
                    };
                }
            });
		});
//删除

	window.del = function(id){
		$.ajax({
                url:'svs/delSvs?id='+id,
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("删除成功...");
                   		qry();
                    }else{
                    	alert("该服务已被引用，无法删除...");
                    };
                   
                }
            });
	}

	});
	</script>
</body>
</html>