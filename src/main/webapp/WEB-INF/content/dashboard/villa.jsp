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
					<p class="description">query all villas</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li><a href="javascript:void(0);">别墅管理</a></li>
						<li class="active"><strong>查询别墅</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->
			
<!--新增商户表单结束-->

			<div class="panel panel-default">
				
				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-12">
						

						<form class="form-inline" id="qry-form" action="" method="post">
							<div class="form-group"> 
								<input id="qry-province" name="province" class="form-control" type="text" placeholder="省 份">
							</div>
							<div class="form-group"> 
								<input id="qry-lowPrice" name="lowPrice" class="form-control" type="text" placeholder="最低价">
							</div>
							<div class="form-group"> 
								<input id="qry-highPrice" name="highPrice" class="form-control" type="text" placeholder="最高价">
							</div>
							<div class="form-group"> 
								<input id="qry-bedroom" name="bedroom" class="form-control" type="text" placeholder="床位数">
							</div>
							
							<div class="form-group">
								<button id="qry-btn" type="button" class="btn btn-primary btn-single btn-sm">查 询</button>
							</div>
							
							<div class="form-group"> 
								<input id="pageNo" name="pageNo" class="form-control" type="hidden" value="0" placeholder="页码">
							</div>
							<div class="form-group"> 
								<input id="pageSize" name="pageSize" class="form-control" type="hidden" value="10" placeholder="每页别墅数">
							</div>

							
						</form>




						
 
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
												<th>商户</th>
												<th>省份</th>
												<th>城市</th>
												<th>床位</th>
												<th>人数</th>
												<th>普通价</th>
												<th>特殊价</th>
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
                url:'villa/qryVilla',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data.list, function(i, item) {
                		 $("#qry-table tbody").append(
                		"<tr>"+
						"	<td class='villa-id'>"+item.id+"</td>"+
						"	<td class='villa-name'>"+item.name+"</td>"+
						"	<td class='villa-storeName'>"+item.storeName+"</td>"+
						"	<td class='villa-province'>"+item.province+"</td>"+
						"	<td class='villa-city'>"+item.city+"</td>"+
						"	<td class='villa-bedroom'>"+item.bedroom+"</td>"+
						"	<td class='villa-people'>"+item.people+"</td>"+
						"	<td class='villa-normalPrice'>"+item.normalPrice+"</td>"+
						"	<td class='villa-specialPrice'>"+item.specialPrice+"</td>"+
						"	<td class='villa-weight'>"+item.weight+"</td>"+
						"	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' href='villa/getVilla?id="+item.id+"&type=redirect'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a><a target='_blank' class='btn btn-primary btn-single btn-sm' href='"+item.qrcode+"'>二维码</a></td>"+
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
	                url:'villa/qryVilla',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                    $("#qry-table tbody").empty();
	                	$.each(data.list, function(i, item) {
	                		 $("#qry-table tbody").append(
	                		"<tr>"+
						"	<td class='villa-id'>"+item.id+"</td>"+
						"	<td class='villa-name'>"+item.name+"</td>"+
						"	<td class='villa-storeName'>"+item.storeName+"</td>"+
						"	<td class='villa-province'>"+item.province+"</td>"+
						"	<td class='villa-city'>"+item.city+"</td>"+
						"	<td class='villa-bedroom'>"+item.bedroom+"</td>"+
						"	<td class='villa-people'>"+item.people+"</td>"+
						"	<td class='villa-normalPrice'>"+item.normalPrice+"</td>"+
						"	<td class='villa-specialPrice'>"+item.specialPrice+"</td>"+
						"	<td class='villa-weight'>"+item.weight+"</td>"+
						"	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' href='villa/getVilla?id="+item.id+"&type=redirect'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a><a target='_blank' class='btn btn-primary btn-single btn-sm' href='"+item.qrcode+"'>二维码</a></td>"+
						"</tr>"
	                		 );
	                  	});
	                }
	            });
	            
		}
		

//删除

	window.del = function(id){
		$.ajax({
                url:'villa/delVilla?id='+id,
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("删除成功...");
                   		qry();
                    }else{
                    	alert("该别墅已被引用，无法删除...");
                    }
                   
                }
            });
	}




	});
	</script>
</body>
</html>