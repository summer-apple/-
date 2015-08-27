 package com.zjlh.villa.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.http.ParseException;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.service.util.CheckUtilService;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.weixin.po.AccessToken;
import com.zjlh.villa.entity.weixin.po.TextMessage;
import com.zjlh.villa.service.util.MessageUtilService;
import com.zjlh.villa.service.util.WeixinUtilService;

@Namespace("/weixin")
@Controller
@Results({  
	  @Result(name="test", location="/WEB-INF/content/mobile/test.jsp")
	})
public class WeixinUtilAction extends ActionSupport {
	
	@Autowired
	private WeixinUtilService weixinUtilService;
	@Autowired
	private MessageUtilService messageUtilService;
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	

	
	
	private static final String GET = "GET";
	
	




	private static final String POST = "POST";
	
	//private static Logger logger = Logger.getLogger(WeixinUtilAction.class);
	
/**
 * 检验服务器与微信是否联通	
 */
	
	
	@Action("/weixin/check-signature")
    public void checkSignature(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		System.out.println("检验服务器与微信是否联通");
   
        //获取请求参数
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");

        PrintWriter out = response.getWriter();
		if(CheckUtilService.checkSignature(signature, timestamp, nonce)){
			out.print(echostr);
			out.close();
		}

    }
	

	
	
	@Action("/weixin/main")
	public String execute() throws Exception {
		
		HttpServletRequest request = ServletActionContext.getRequest();//获取request、response对象
	    HttpServletResponse response = ServletActionContext.getResponse();
	    
	    String method = request.getMethod();//获取请求方法

	    PrintWriter  out = response.getWriter();//获取输出
	    
	    
	    
	    
	    if(GET.equals(method)) {//接入响应GET请求
	    	checkSignature(request,response);
		}else {//处理POST请求
System.out.println("post");
			Map<String, String> map = MessageUtilService.xmlToMap(request);//获取消息基本信息，并转为集合类型
			String fromUserName = map.get("FromUserName");
			String toUserName = map.get("ToUserName");
			String msgType = map.get("MsgType");
			String content = map.get("Content");
			
System.out.println("content="+content);
			
			String message=null;//初始化message
			
			//判断消息类型
			switch (msgType) {
			case MessageUtilService.MESSAGE_TEXT://文本消息处理

				switch (content) {
				case "1":
					message = MessageUtilService.initText(toUserName, fromUserName, MessageUtilService.firstMenu());
					
					break;
					
				case "2":
					message = MessageUtilService.initText(toUserName, fromUserName, MessageUtilService.secondMenu());
					break;
					
				case "?":
					message = MessageUtilService.initText(toUserName, fromUserName, MessageUtilService.menuText());
					break;
					
				case "？":
					message = MessageUtilService.initText(toUserName, fromUserName, MessageUtilService.menuText());
					break;

				default:
					message = MessageUtilService.initText(toUserName, fromUserName, "您发送的消息是："+content);
					break;
				}
				
				break;
			case MessageUtilService.MESSAGE_IMAGE:
				break;
				
			case MessageUtilService.MESSAGE_EVNET:
				
				String eventType = map.get("Event");//获取时间类型并加以判断
				switch (eventType) {
				case MessageUtilService.MESSAGE_SUBSCRIBE://关注事件处理
					message = MessageUtilService.initText(toUserName, fromUserName, MessageUtilService.menuText());
					Member member = weixinUtilService.getMemberInfo(fromUserName, weixinUtilService.getAccessToken());
					JSONObject obj = JSONObject.fromObject(member);
					message = messageUtilService.initText(toUserName, fromUserName, obj.toString());
					
					break;
				case MessageUtilService.MESSAGE_UNSUBSCRIBE://取消关注事件处理
					
					weixinUtilService.unSubscribe(fromUserName);
					break;
				default:
					break;
				}
				
			default:
				break;
			}
			
			
			out.print(message);//返回message
			out.close();//关闭输出流
			
			
			
	
			
			
		}
	
		return null;
	}


	
	@Action("/weixin/create-menu")
	public void fuck() throws ParseException, IOException{
		
		String menu = JSONObject.fromObject(WeixinUtilService.initMenu()).toString();		
		String token = weixinUtilService.getAccessToken();
		int result = WeixinUtilService.createMenu(token, menu);
		if (0==result) {
			System.out.println("创建菜单成功！");
		}
		
		 HttpServletResponse response = ServletActionContext.getResponse();
		 PrintWriter  out = response.getWriter();//获取输出  
		 out.print("create menu success");//返回message
		 out.close();//关闭输出流
			
		
	}
	
	
	@Action("/weixin/login")
	public String login() throws ParseException, IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    
	   // String destination = request.getParameter("destination");
	    String code = request.getParameter("code");
	    
	    
	    
	    Member member = (Member) request.getSession().getAttribute("member");
	    
	    if (member==null) {
	    	 member = weixinUtilService.login(code);
		}
	   
	    request.getSession().setAttribute("member", member);
	    
	    return "test";

	}

	
}
