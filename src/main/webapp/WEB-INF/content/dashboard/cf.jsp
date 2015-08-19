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
						<div class="panel-heading">
							<h3 class="panel-title">Select2 Elements</h3>
							<div class="panel-options">
								<a href="#" data-toggle="panel">
									<span class="collapse-icon">&ndash;</span>
									<span class="expand-icon">+</span>
								</a>
								<a href="#" data-toggle="remove">
									&times;
								</a>
							</div>
						</div>
						<div class="panel-body">
							
							<form role="form" action="fuck/fuckVilla" method="post">
								
								
								
								<div class="form-group">
									<label class="control-label">Multiple select</label>
									
										
									<script type="text/javascript">
										jQuery(document).ready(function($)
										{
											$("#s2example-2").select2({
												placeholder: 'Choose your favorite US Countries',
												allowClear: true
											}).on('select2-open', function()
											{
												// Adding Custom Scrollbar
												$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
											});
											
										});
									</script>
									
									<select class="form-control" id="s2example-2" multiple name="sss">
										<option></option>
										<optgroup label="United States">
											<option>Alabama<div class="aaa">出啦</div></option>
											<option>Alaska<p>sss</p></option>
											<option>Arizona</option>
											<option>Arkansas</option>
											<option selected>California</option>
											<option>Colorado</option>
											<option>Connecticut</option>
											<option>Delaware</option>
											<option selected>Florida</option>
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
							
										</optgroup>
									</select>
										
								</div>
								
								<input type="submit">
								
							</form>
						
						
					</div>
				
				</div>

<!--主体部分结束-->

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
	<link rel="stylesheet" href="resources/js/select2/select2.css">
	<link rel="stylesheet" href="resources/js/select2/select2-bootstrap.css">
		<script src="resources/js/select2/select2.min.js"></script>
	<script type="text/javascript">
	$().ready(function(){
/* //首次进入时刷新
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
	} */

	});
	</script>
</body>
</html>