<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>微信支付页面</title>
	</head>
	<body>
	<%-- 公众号：${data.appid}<br/>
	时间戳：${data.timestamp}<br/>
	随机串：${data.nonce_str}<br/>
	扩展包：prepay_id=${data.prepay_id}<br/>
	微信签名：${data.sign}<br/> --%>
	</body>
	<script type="text/javascript">
		function onBridgeReady(){
		   WeixinJSBridge.invoke(
		       'getBrandWCPayRequest', {
		      	"appId" : "${data.appid}", //公众号名称，由商户传入
				"timeStamp" : "${data.timestamp}", //时间戳
				"nonceStr" : "${data.nonce_str}", //随机串
				"package" : "prepay_id="+"${data.prepay_id}", ////扩展包
				"signType" : "MD5", //微信签名方式:1.sha1
				"paySign" : "${data.sign}" ////微信签名
		       },
		       function(res){     
			       
		           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
		           		alert("页面消息返回:OK");
		           }     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
		       }
		   ); 
		}

		
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
	</script>
</html>