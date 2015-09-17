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
					<h1 class="title">用户管理</h1>
					<p class="description">query members who follow you</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><a href="dashboard/home"><i class="fa-home"></i>主页</a></li>
						<li class="active"><strong>用户</strong></li>
					</ol>

				</div>

			</div>


<!--主体部分开始-->
			


			<div class="panel panel-default">
				
				<div class="vspacer v3"></div>
				
				<div class="row">
					<div class="col-sm-10">
						<a href="javascript:;" onclick="jQuery('#modal-1').modal('show', {backdrop: 'fade'});" class="btn btn-primary btn-single btn-sm">发送短信</a>
					</div>
					<div class="col-sm-10" style="display:none;">
						

						<form class="form-inline" id="qry-form" action="" method="post">
							
							<div class="form-group"> 
								<input id="pageNo" name="pageNo" class="form-control" type="hidden" value="0" placeholder="页码">
							</div>
							<div class="form-group"> 
								<input id="pageSize" name="pageSize" class="form-control" type="hidden" value="10" placeholder="每页商户数">
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
												<th>头像</th>
												<th>昵称</th>
												
												<th>性别</th>
												<th>手机</th>
												<th>真名</th>
												<th>邮箱</th>
												<th>生日</th>
												<th>省份</th>
												<!-- <th>操作</th> -->
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




<div class="modal fade" id="modal-1" style="display: none;" aria-hidden="true">
<form id="msg-form" action="" method="post">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title">短信信息</h4>
				</div>
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group">
								<label for="field-1" class="control-label">短信模板代码</label>
								
								<input type="text" class="form-control" id="project" name="project" placeholder="短信模板代码">
							</div>	
							
						</div>
						
						
					</div>
				
					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group no-margin">
								<label for="field-7" class="control-label">联系人</label>
								
								<textarea class="form-control autogrow" id="phonelist" name="phonelist" placeholder="请输入十一位手机号码，用英文状态逗号隔开。不填为发送给所有人。" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
							</div>	
							
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							
							<div class="form-group no-margin">
								<label for="field-7" class="control-label">自定义文字</label>
								
								<textarea class="form-control autogrow" id="code" name="code" placeholder="用于替代模板中的可自定义区域" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
							</div>	
							
						</div>
					</div>
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white send-cancel-btn" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-info send-msg-btn">发送</button>
				</div>
			</div>
		</div>
		</form>
	</div>


	<%@ include file="script.jsp" %>
	<script type="text/javascript" src="resources/js/jquery.pagination.js"></script>
	<script type="text/javascript">
	$().ready(function(){


//日期转换方法
(function($) {
    $.extend({
        myTime: {
            /**
             * 当前时间戳
             * @return <int>        unix时间戳(秒)  
             */
            CurTime: function(){
                return Date.parse(new Date())/1000;
            },
            /**              
             * 日期 转换为 Unix时间戳
             * @param <string> 2014-01-01 20:20:20  日期格式              
             * @return <int>        unix时间戳(秒)              
             */
            DateToUnix: function(string) {
                var f = string.split(' ', 2);
                var d = (f[0] ? f[0] : '').split('-', 3);
                var t = (f[1] ? f[1] : '').split(':', 3);
                return (new Date(
                        parseInt(d[0], 10) || null,
                        (parseInt(d[1], 10) || 1) - 1,
                        parseInt(d[2], 10) || null,
                        parseInt(t[0], 10) || null,
                        parseInt(t[1], 10) || null,
                        parseInt(t[2], 10) || null
                        )).getTime() / 1000;
            },
            /**              
             * 时间戳转换日期              
             * @param <int> unixTime    待时间戳(秒)              
             * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)              
             * @param <int>  timeZone   时区              
             */
            UnixToDate: function(unixTime, isFull, timeZone) {
                if (typeof (timeZone) == 'number')
                {
                    unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
                }
                var time = new Date(unixTime * 1000);
                var ymdhis = "";
                ymdhis += time.getUTCFullYear() + "-";
                ymdhis += (time.getUTCMonth()+1) + "-";
                ymdhis += time.getUTCDate();
                if (isFull === true)
                {
                    ymdhis += " " + time.getUTCHours() + ":";
                    ymdhis += time.getUTCMinutes() + ":";
                    ymdhis += time.getUTCSeconds();
                }
                return ymdhis;
            }
        }
    });
})(jQuery);



//alert($.myTime.UnixToDate(1325347200));

	function transTime(object,isFull){
		if (object!=null) {
			return $.myTime.UnixToDate(object.time/1000,isFull,8);
		}else{
			return "--";
		}
	}

//首次进入时刷新
		qry();
//点击查询时刷新
		// $("#qry-btn").click(function(){
		// 	$("#pageNo").val(0);
		// 	qry();
		// });


//查询方法
		function qry(){
            var params = $("#qry-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }
            $.ajax({
                url:'member/qryMember',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                    $("#qry-table tbody").empty();
                	$.each(data.list, function(i, item) {
                		 $("#qry-table tbody").append(
                		"<tr>"+
						"	<td class='store-id'>"+item.id+"</td>"+
						"	<td class='store-headimgurl'><img src='"+item.headimgurl+"' style='width:50px;'></td>"+
						"	<td class='store-nickname'>"+item.nickname+"</td>"+

						"	<td class='store-sexValue'>"+item.sexValue+"</td>"+
						"	<td class='store-phone'>"+item.phone+"</td>"+
						"	<td class='store-truename'>"+item.truename+"</td>"+
						"	<td class='store-email'>"+item.email+"</td>"+
						"	<td class='store-birthday'>"+transTime(item.birthday,false)+"</td>"+
						"	<td class='store-province'>"+item.province+"</td>"+
						// "	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' onclick='edit("+item.id+")'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
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
	                url:'member/qryMember',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                    $("#qry-table tbody").empty();
	                	$.each(data.list, function(i, item) {
	                		 $("#qry-table tbody").append(
			                		"<tr>"+
								"	<td class='store-id'>"+item.id+"</td>"+
								"	<td class='store-headimgurl'><img src='"+item.headimgurl+"' style='width:50px;'></td>"+
								"	<td class='store-nickname'>"+item.nickname+"</td>"+
								
								"	<td class='store-sexValue'>"+item.sexValue+"</td>"+
								"	<td class='store-phone'>"+item.phone+"</td>"+
								"	<td class='store-truename'>"+item.truename+"</td>"+
								"	<td class='store-email'>"+item.email+"</td>"+
								"	<td class='store-birthday'>"+transTime(item.birthday,false)+"</td>"+
								"	<td class='store-province'>"+item.province+"</td>"+
								// "	<td style='min-width:115px;'><a class='edit-btn btn btn-primary btn-single btn-sm' onclick='edit("+item.id+")'>编辑</a><a class='btn btn-primary btn-single btn-sm' onclick=del("+item.id+")>删除</a></td>"+
								"</tr>"
	                		 );
	                  	});
	                }
	            });
	            
		}
		

//发送短信
		$(".send-msg-btn").click(function(){
			var params = $("#msg-form").serializeArray();
            var j = {};
            for (var item in params) {
                j[params[item].name] = params[item].value;
            }

            $.ajax({
                url:'member/messgae',
                data: {data:JSON.stringify(j)},
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data) {
                		$(".send-cancel-btn").click();
                		alert("信息已发送")
                	}else{
                		alert("信息发送出错，请检查信息");
                	}
              }     
			});
		});


	 });
	</script>
</body>
</html>