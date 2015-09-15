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

		
	<style type="text/css">
		.head-img-warp {
    width: 100%;
    height: auto;
}
img.head-img {
    width: 100%;
    height: auto;
}
.villa-base-info-warp {
    width: 100%;
    height: 55px;
    background-color: #272727;
    margin-top: -6px;
}
.villa-name {
    text-align: left;
    text-indent: 10px;
    padding-top: 7px;
    font-size: 1.2em;
    color: #FFF;
}
.villa-address {
    text-align: left;
    margin-left: 10px;
}
.order-info-title {
    text-align: left;
    margin-top: 10px;
    text-indent: 10px;
    height: 30px;
}
.form-group{
	width: 80%;
    margin-left: 10%;
    height: 30px;
    margin-bottom: 15px;
}
.form-group input{
	width: 100%;
	height: 100%;
	text-indent: 10px;
	font-size: 1.1em;
    
}
.ordered-warp{
	display: none;
}
.ordered-line {
    text-align: left;
    width: 80%;
    margin-left: 10%;
    font-size: 0.9em;
    color: #666;
}
.time-line {
    width: 100%;
    height: 30px;
    margin-bottom: 15px;
    text-align: left;
        clear: both;
}

.time-line > input{
     width: 60%;
    float: left;
    height: 80%;
    margin-right: 10px;
    margin-left: 10%;
    text-indent: 10px;
}
.period-warp {
    height: 100%;
    line-height: 30px;
}
.period-warp input{
	line-height: 30px;
}
.money-display {
    font-size: 1.5em;
    color: #FFA339;
}
.operate-warp {
    width: 100%;
    height: 40px;
    margin-top: 15px;
    text-align: center;
}
.cancel-btn{
	 background-color: #CCC !important;

}
.operation-btn {
    width: 20%;
    height: 40px;
    background-color: #FFA339;
    display: block;
    float: left;
    line-height: 40px;
    margin-left: 15%;
    color: #FFF !important;
    font-size: 1.2em;
    min-width: 100px;
}
.user-info-warp input{
	border: 1px solid #999;
}

	</style>
		
	</head>
	<body>
		<div id="page">
			<div class="header">
				<a id="menu-btn" href="#menu"><span class="fa fa-list-ul"></span></a>
				<!-- <a class="platform-title-link" href="#qry-form"><span class="platform-title">ONE GO.</span></a> -->
				<span class="platform-title">ONE GO.</span>
				<a class="search-icon" href="mobile/index"><span class="fa fa-search"></span></a>
			</div>


			<div class="content" style="padding-top: 40px;">
				 <div class="head-img-warp">
				 	<img class="head-img" src="">
				 </div>
				 <div class="villa-base-info-warp">
				 	<div class="villa-name"></div>
				 	<div class="villa-address"></div>
				 </div>

				<div class="order-info-warp">
					<div class="order-info-title">订单信息:</div>
					<form id="order-form" action="" method="post">
							<input id="id" type="hidden" name="id" value="0">
							<input id="villa" type="hidden" name="villa">
							<input id="villaName" type="hidden" name="villaName">
							<input id="store" type="hidden" name="store">
							<input id="member" type="hidden" name="member" value="${member.id}">
							<input id="openid" type="hidden" name="openid"  value="${member.openid}">

							<input id="normalPrice" name="normalPrice" type="hidden">
							<input id="specialPrice" name="specialPrice" type="hidden">




						<div class="user-info-warp">
							<div class="form-group">
								<input id="truename" type="text" name="truename" placeholder="姓名*" value="${member.truename}" required>
							</div>
							<div class="form-group">
								<input id="phone" type="tel" name="phone" placeholder="手机*" value="${member.phone}" required>
							</div>
							<div class="form-group">
								<input id="email" type="email" name="email" placeholder="邮箱*" value="${member.email}" required>
							</div>
						</div>

						<div class="ordered-warp">
							<div  class="order-info-title">不可预订日期:</div>
							
						</div>
						<div class="time-warp">
						<div  class="order-info-title">开始日期:</div>
							<div class="time-line">
								
								<input id="startDay" type="date" name="startDay">
								<div class="period-warp">
									<input class="startPeriod" type="radio" name="startPeriod" value="0" checked>上午
									<input class="startPeriod" type="radio" name="startPeriod" value="1">下午
								</div>
							</div>
							<div class="order-info-title">结束日期:</div>
							<div class="time-line">
								
								<input id="endDay" type="date" name="endDay">
								<div class="end-warp">
									<input class="endPeriod" type="radio" name="endPeriod" value="0" checked>上午
									<input class="endPeriod" type="radio" name="endPeriod" value="1">下午
								</div>
							</div>
						</div>

						<div class="money-warp">
							<div class="order-info-title">总金额:</div>
							<div class="money-display"></div>
							<input id="money" type="hidden" name="money">
						</div>

						<div class="operate-warp">
							<a href="javascript:void(0);" class="button cancel-btn operation-btn">取 消</a>
							<a href="javascript:void(0);" class="button next-btn operation-btn">支付定金</a>
						</div>

					</form>
				</div>


				

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
	<!-- 	<script src="resources/js/jquery-validate/jquery.validate.min.js"></script> -->
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
	
			function getUrlParam(name) {
				var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r!=null) return unescape(r[2]); return null;
				}
			
			var id = getUrlParam("id");




			//获取当前日期
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
			

			//var time1 = new Date().Format("yyyy-MM-dd HH:mm:ss");     
 
			var time2 = new Date().Format("yyyy-MM-dd");    
			$("#startDay,#endDay").val(time2);







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



			//获取别墅json对象
			$.ajax({
				url:"villa/getVilla?type=json&id="+id,
				type:"post",
				dataType:"json",
				success:function(data){
					//插入图片
					var imgs = data.img;
					$.each(imgs,function(i,item){
						
						if (i==0) {
							$(".head-img").attr("src",item.url);
						}

					});


		    		 //插入别墅名
		    		 $(".platform-title,.villa-name,#villaName").html(data.name);
					 $("#villaName").val(data.name);
		    		 //插入地址
		    		 $(".villa-address").html(data.province+" "+data.city);

		    		 //插入价格
		    		 $("#normalPrice").val(data.normalPrice);
		    		 $("#specialPrice").val(data.specialPrice);


		    		 //插入villa,store,member
		    		 $("#villa").val(data.id);
		    		 $("#store").val(data.store);
		    		 

		    		 //计算价格
		    		 calculate();
		    		

					
				}
			});


			//价格计算函数

			var calculate = function(){
				var $normalPrice = $("#normalPrice").val();
				var $specialPrice = $("#specialPrice").val();
				var $startDay = $("#startDay").val();
				var $endDay = $("#endDay").val();
				var $startPeriod = $(".startPeriod:checked").val();
				var $endPeriod = $(".endPeriod:checked").val();




				$.ajax({
					url:"order/calculate",
					dataType:"json",
					method:"post",
					data:{startDay:$startDay,startPeriod:$startPeriod,endDay:$endDay,endPeriod:$endPeriod,normalPrice:$normalPrice,specialPrice:$specialPrice},
					success:function(data){
						$(".money-display").html("￥ "+data);
						$("#money").val(data);
					}
				});


			}
			

			$("#startDay,#endDay,.startPeriod,.endPeriod").change(function(){
				calculate();
			});

			$("#truename,#phone,#email,#startDay,#endDay,.startPeriod,.endPeriod").change(function(){
				$("#id").val(0);
			});




			//获取已预订日期
			$.ajax({
					url:"order/qryOrderedOrder",
					dataType:"json",
					method:"post",
					data:{villaid:id,date:time2},
					success:function(data){
						if (data.amount>0) {

							$(".ordered-warp").show(0);

							$.each(data.list,function(i,item){
							$(".ordered-warp").append(
								'<div class="ordered-line">'+transTime(item.startDay,false)+' '+item.startPeriodValue+' -- '+transTime(item.endDay,false)+' '+item.endPeriodValue+'</div>'
								);
							});
						}
						
					}
				});




















//调用JSAPI进行支付
		function onBridgeReady(){
			//alert($appId +" "+$timeStamp + " "+$nonceStr + " "+$package + " "+$paySign);

		   WeixinJSBridge.invoke(
		       'getBrandWCPayRequest', {
		      	"appId" : $appId, //公众号名称，由商户传入
				"timeStamp" : $timeStamp, //时间戳
				"nonceStr" : $nonceStr, //随机串
				"package" : $package, ////扩展包
				"signType" : "MD5", //微信签名方式:1.sha1
				"paySign" : $paySign ////微信签名
		       },
		       function(res){     
			       
			       //alert(res.err_code+" "+res.err_msg+" "+res.err_desc)
		           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
		           		//alert("页面消息返回:OK");

		           		//查询后台返回结果

		           }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
		       }
		   ); 
		}
		function callpay($appId,$timeStamp,$nonceStr,$package,$paySign){
			if (typeof WeixinJSBridge == "undefined"){
			   if( document.addEventListener ){
			       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
			   }else if (document.attachEvent){
			       document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
			       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
			   }
			}else{
			   onBridgeReady();
			}
		}

		var $appId = "";
		var $timeStamp = "";
		var $nonceStr = "";
		var $package = "";
		var $paySign = "";

			$(".next-btn").click(function(){

				if ($("#id").val()==0) {

					//获取订单字段
					var params = $("#order-form").serializeArray();
		            var j = {};
		            for (var item in params) {
		                j[params[item].name] = params[item].value;
		            }

		            $.ajax({
	                url:'order/createOrder',
	                data: {data:JSON.stringify(j)},
	                type:'post',
	                dataType:'json',
	                success:function(data){
	                	if (data==0) {
	                		alert("请填写完整订单信息！");
	                	}else{
	                		$("#id").val(data.orderid);
		                	$appId = data.appid;
		                	$timeStamp = data.timestamp;
		                	$nonceStr = data.nonce_str;
							$package = "prepay_id=" + data.prepay_id;
							$paySign = data.sign;

		                	callpay();
	                	}
	                	
	                	//window.location.href="mobile/pay";
		                }
		            });

				}else{
					callpay();
				}


			});

			$(".cancel-btn").click(function(){
				history.back();
			});


		});
		

	</script>
	</body>
</html>