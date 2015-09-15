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
					<h1 class="title">商户管理</h1>
					<p class="description">query edit or create  stores</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li class="active"><strong>查询商户</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->
			<div class="add-panel panel panel-default" style="display: none;">
						<div class="panel-heading">
							<h3 class="panel-title">新增商户</h3>
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
							
							<form id="add-form" role="form" class="form-horizontal" action="" method="post">
								
								<input name="id" type="hidden" id="id">

								<div class="form-group">
									<label class="col-sm-2 control-label" for="name">商户名</label>
									
									<div class="col-sm-10">
										<input name="name" type="text" class="form-control" id="name" placeholder="商户名">
									</div>
								</div>
								

								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="ownerName">姓&nbsp;&nbsp;&nbsp;名</label>
									
									<div class="col-sm-10">
										<input name="ownerName" type="text" class="form-control" id="ownerName" placeholder="姓 名">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;别</label>
									
									<div class="col-sm-10">
											<label class="radio-inline">
												<input type="radio" id="gender-male" name="gender" checked value="0">
												男
											</label>
											<label class="radio-inline">
												<input type="radio" id="gender-female" name="gender" value="1">
												女
											</label>
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="age">年&nbsp;&nbsp;&nbsp;龄</label>
									
									<div class="col-sm-10">
										<input name="age" type="number" class="form-control" id="age" placeholder="年 龄">
									</div>
								</div>

								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="idCard">身份证</label>
									
									<div class="col-sm-10">
										<input name="idCard" type="number" class="form-control" id="idCard" placeholder="身份证">
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-2 control-label" for="mobilephone">手机号</label>
									
									<div class="col-sm-10">
										<input name="mobilephone" type="number" class="form-control" id="mobilephone" placeholder="手机号">
									</div>
								</div>
								
								

								<div class="form-group">
									<label class="col-sm-2 control-label" for="telephone">座机号</label>
									
									<div class="col-sm-10">
										<input name="telephone" type="text" class="form-control" id="telephone" placeholder="座机号">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="weight">权&nbsp;&nbsp;&nbsp;重</label>
									
									<div class="col-sm-10">
										<input name="weight" type="number" class="form-control" id="weight" placeholder="1-100 数值越大排名越靠前">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="address">地&nbsp;&nbsp;&nbsp;址</label>
									
									<div class="col-sm-10">
										<textarea name="address" class="form-control autogrow" cols="5" id="address" placeholder="省-市-区/县-街道/乡镇-具体地址" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 50px;"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-6">
									</div>
									<div class="col-sm-2">
										<!-- <a href="javascript:void(0);" id="add-btn" class="btn btn-primary btn-single btn-sm">保存</a> -->
										<button id="add-btn" type="button" class="btn btn-primary btn-single btn-sm">保 存</button>
										<button id="update-btn" type="button" class="btn btn-primary btn-single btn-sm">更 新</button>
									</div>
								</div>
								
								
							</form>
							
						</div>
					</div>
<!--新增商户表单结束-->

			<div class="panel panel-default">
				
				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-10">
						

						<form class="form-inline" id="qry-form" action="" method="post">
							<div class="form-group"> 
								<input id="qry-id" name="id" class="form-control" type="text" placeholder="商户ID">
							</div>
							<div class="form-group"> 
								<input id="address" name="address" class="form-control" type="text" placeholder="商户地址">
							</div>
							<div class="form-group"> 
								<input id="name" name="name" class="form-control" type="text" placeholder="商户名称">
							</div>
							
							<div class="form-group">
								<button id="qry-btn" type="button" class="btn btn-primary btn-single btn-sm">查 询</button>
							</div>
							
							<div class="form-group"> 
								<input id="pageNo" name="pageNo" class="form-control" type="hidden" value="0" placeholder="页码">
							</div>
							<div class="form-group"> 
								<input id="pageSize" name="pageSize" class="form-control" type="hidden" value="10" placeholder="每页商户数">
							</div>

							
						</form>




						
 
					</div>
					<div class="col-sm-2">
						<a href="javascript:void(0);" class="open-panel btn btn-primary btn-single btn-sm">新建商户</a>
					</div>
				</div>

				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-12">
						<table id="qry-table" class="table table-bordered table-striped table-condensed table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>名称</th>
												<th>姓名</th>
												<th>年龄</th>
												<th>性别</th>
												<th>手机</th>
												<th>座机</th>
												<th>身份证</th>
												<th>地址</th>
												<th>权重</th>
												<th>操作</th>
											</tr>
										</thead>
										
										<tbody>
											
										</tbody>
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-12">
						<div class="pagination"></div>
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


	<%@ include file="script.jsp" %>
	<script type="text/javascript" src="resources/js/jquery.pagination.js"></script>
	<script type="text/javascript">
	$().ready(function(){
//首次进入时刷新
		qry();
//点击查询时刷新
		$("#qry-btn").click(function(){
			$("#pageNo").val(0);
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
                url:'store/qryStore',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data.list, function(i, item) {
                		 $("#qry-table tbody").append(
                		"<tr>"+
						"	<td class='store-id'>"+item.id+"</td>"+
						"	<td class='store-name'>"+item.name+"</td>"+
						"	<td class='store-ownerName'>"+item.ownerName+"</td>"+
						"	<td class='store-age'>"+item.age+"</td>"+
						"	<td class='store-genderValue'>"+item.genderValue+"</td>"+
						"	<td class='store-mobilephone'>"+item.mobilephone+"</td>"+
						"	<td class='store-telephone'>"+item.telephone+"</td>"+
						"	<td class='store-idCard'>"+item.idCard+"</td>"+
						"	<td class='store-address'>"+item.address+"</td>"+
						"	<td class='store-weight'>"+item.weight+"</td>"+
						"	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' onclick='edit("+item.id+")'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
						"</tr>"
                		 );
                  	});

					$(".pagination").pagination(data.amount, { 
						  prev_text: '&laquo;', 
						  next_text: '&raquo;',
						  ellipse_text:"...", 
						  items_per_page: 1, 
						  num_display_entries: 6, 
						  current_page: 0, 
						  num_edge_entries: 2,
						  link_to:"javascript:void(0);"
							
					});



                }
            });
            
            
		}

		function createPages(){

		}

//点击页码查询

		window.page = function(no){
			$("#pageNo").val(no);
			 var params = $("#qry-form").serializeArray();
	            var j = {};
	            for (var item in params) {
	                j[params[item].name] = params[item].value;
	            }
	            $.ajax({
	                url:'store/qryStore',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                    $("#qry-table tbody").empty();
	                	$.each(data.list, function(i, item) {
	                		 $("#qry-table tbody").append(
	                		"<tr>"+
							"	<td class='store-id'>"+item.id+"</td>"+
							"	<td class='store-name'>"+item.name+"</td>"+
							"	<td class='store-ownerName'>"+item.ownerName+"</td>"+
							"	<td class='store-age'>"+item.age+"</td>"+
							"	<td class='store-genderValue'>"+item.genderValue+"</td>"+
							"	<td class='store-mobilephone'>"+item.mobilephone+"</td>"+
							"	<td class='store-telephone'>"+item.telephone+"</td>"+
							"	<td class='store-idCard'>"+item.idCard+"</td>"+
							"	<td class='store-address'>"+item.address+"</td>"+
							"	<td class='store-weight'>"+item.weight+"</td>"+
							"	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' onclick='edit("+item.id+")'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
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
                url:'store/addStore',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    if (data==0) {
                    	alert("该设施已存在...");
                    	qry();
                    }else{
                    	alert("保存成功...");
                    	qry();
                    }
                }
            });
		});
//删除

	window.del = function(id){
		$.ajax({
                url:'store/delStore?id='+id,
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("删除成功...");
                   		qry();
                    }else{
                    	alert("该设施已被引用，无法删除...");
                    }
                   
                }
            });
	}

//关闭新增商店面板
	$(".close-panel").click(function(){
		$(".add-panel").hide();
	});
//打开新增商店面板
	$(".open-panel").click(function(){
		$("#add-form")[0].reset();
		$(".add-panel .panel-title").html("新增商户");
		$("#add-btn").show();
		$("#update-btn").hide();
		$(".add-panel").show();
	});

//编辑
	window.edit = function(id){
		$("#add-form")[0].reset();
		$(".add-panel .panel-title").html("更新商户");
		$("#add-form #id").val(id);

		$("#add-btn").hide();
		$("#update-btn").show();

		$.ajax({
	                url:'store/getStore?id='+id,
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                	$("#add-form #name").val(data.name);
	                	$("#add-form #ownerName").val(data.ownerName);
	                	$("#add-form #age").val(data.age);
	                	$("#add-form #idCard").val(data.idCard);
	                	$("#add-form #mobilephone").val(data.mobilephone);
	                	$("#add-form #telephone").val(data.telephone);
	                	$("#add-form #weight").val(data.weight);
	                	$("#add-form #address").val(data.address);

	                	if (data.gender==1) {	                		
	                		$("#add-form #gender-male").removeAttr("checked");
	                		$("#add-form #gender-female").attr("checked",true);
	                	}else{
							$("#add-form #gender-female").removeAttr("checked");
	                		$("#add-form #gender-male").attr("checked",true);
	                	}//111
	                }//222
	           });
		
		$(".add-panel").show();
	}//333


//更新

	$("#update-btn").click(function(){
			var params = $("#add-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }
            $.ajax({
                url:'store/updateStore',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    if (data==true) {
                    	alert("更新成功...");
                    	qry();
                    }else{
                    	alert("更新失败...");
                    	qry();
                    }
                }
            });
		});

	});
	</script>
</body>
</html>