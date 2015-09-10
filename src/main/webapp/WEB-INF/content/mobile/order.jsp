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
.order-warp {
    width: 90%;
    margin-left: 5%;
    margin-bottom: 20px;
    background-color: #FFF;
}
.order-title {
    height: 30px;
    border-bottom: 1px solid #EFEFEF;
}
.order-title div{
	float: left;
	display: block;
	height: 100%;
	line-height: 30px;
	width: 50%;
	font-size: 0.9em;
	color:#999;
}
.order-store {
    text-align: left;
    text-indent: 10px;
}
.order-state {
    text-align: right;
    padding-right: 10px;
}
.order-body {
    width: 100%;
    height: auto;
}
.order-body-line {
    text-align: left;
    text-indent: 10px;
    height: 25px;
    line-height: 25px;
    color: #333;
}

.order-body-line-label{
	padding-right: 10px;
}

.order-body-left {
    width: 23%;
    float: left;
    max-width: 100px;
    margin: 10px;
}
.order-body-left img{
	width: 100%;
    height: 100%;
}
.order-body-right {
    width: 70%;
    float: left;
    margin-top: 10px;
}
.order-operate {
    width: 100%;
    clear: both;
    height: 30px;
    border-top: 1px solid #EFEFEF;
}
.orderid {
    display: block;
    width: 30%;
    height: 100%;
    line-height: 30px;
    text-align: left;
    text-indent: 10px;
    font-size: 0.9em;
    float: left;
    color: #999;
}
.operations {
    width: 70%;
    text-align: right;
    float: left;
}
.operations a {
	font-size: 0.8em;
	color: #FFA339;
	border:1px solid #FFA339;
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
				<span class="platform-title">我的订单</span>
				<a class="search-icon" href="javascript:void(0);"><span class="fa fa-search"></span></a>
			</div>
		<form role="form" id="qry-form" class="qry-form" action="" method="post">
			<input id="memberid" name="memberid" type="hidden" value="15"><!-- ${member.id} -->
			<input id="pageNo" name="pageNo" type="hidden" value="0">
			<input id="pageSize" name="pageSize" type="hidden" value="10">
			
			<input id="amount" type="hidden">
		</form>

			<div class="content">
				<!-- ajax 加载  -->
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



			
			//格式化时间
				function transTime(object,isFull){
					if (object!=null) {
						return $.myTime.UnixToDate(object.time/1000,isFull);
					}else{
						return "--";
					}
				}


			//操作按钮判断

				function operation(state,id,villa){
					if (state==1) {
						return '<a class="complete-btn"  onclick=complete("'+id+'")>完成订单</a>'+
								'<a class="cancel-btn" href="tel:10086">取消订单</a>'+
								'<a class="comment-btn" href="mobile/comment?id='+id+'&villa='+villa+'">评 价</a>';
					}else if(state==2){
						return '<a class="comment-btn" href="mobile/comment?id='+id+'&villa='+villa+'">评 价</a>';
					}else{
						return "";
					}
				}
				
				

			window.qry = function(){
				var params = $("#qry-form").serializeArray();
	            var j = {};
	            for (var item in params) {
	                j[params[item].name] = params[item].value;
	            }
	          
	            $.ajax({
	                url:'order/qryOrderByMember',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                	
	                	$("#amount").val(data.amount);
	                	$.each(data.list, function(i, item) {
	                		$(".content").append(
		                		'<div id="order-'+item.id+'" class="order-warp">'+
								'	<div class="order-title">'+
								'		<div class="order-store">'+item.villaName+'</div>'+
								'		<div class="order-state">'+item.stateValue+'</div>'+
								'	</div>'+
								'	<div class="order-body">'+
								'		<div class="order-body-left">'+
								'			 <img src="'+item.villaHead+'">'+
								'		</div>'+
								'		<div class="order-body-right">'+
								'			<div class="order-body-line">'+
								'				<span class="order-body-line-label">开始日期:</span>'+
								'				<span class="dayStart">'+transTime(item.startDay,false)+'&nbsp;&nbsp;'+item.startPeriodValue+'</span>'+
								'			</div>'+
								'			<div class="order-body-line">'+
								'				<span class="order-body-line-label">结束日期:</span>'+
								'				<span class="dayEnd">'+transTime(item.endDay,false)+'&nbsp;&nbsp;'+item.endPeriodValue+'</span>'+
								'			</div>'+
								'			<div class="order-body-line">'+
								'				<span class="order-body-line-label">订单金额:</span>'+
								'				<span class="money">￥'+item.money+'</span>'+
								'			</div>	'+
								'		</div>'+
								'	</div>'+
								'	<div class="order-operate">'+
								'		<span class="orderid">订单ID:'+item.id+'</span>'+
								'		<div class="operations">'+
								operation(item.state,item.id,item.villa)+
								'		</div>'+
								'	</div>'+
								'</div>'
							);
						});
	                
	                }
	            });

				$("#pageNo").val(Number($("#pageNo").val())+1);//页码++


			}


			//载入时查询
			qry();


			//完成订单
			window.complete = function(id){
				$.ajax({
		                url:'order/complete?id='+id,
		                type:'post',
		                dataType:'json',
		                success:function(data){
		                	if (data==true) {
		                    	alert("订单已完成，请评价！");	
		                   		$("#order-"+id).find(".complete-btn,.cancel-btn").hide(0);
		                   		$("#order-"+id).find(".comment-btn").show(0);
		                   		$("#order-"+id).find(".order-state").html("已完成");
		                    }
		                   
		                }
		            });
			}

			

			//滚动

			 $(window).scroll(function() {
                var amount = $("#amount").val();
                var pageNo = $("#pageNo").val();

                if (Number(pageNo) <= Number(amount)) {
                	if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
                   		qry();
                	}
                }
                
            });


			


			

		});
		</script>
	</body>
</html>