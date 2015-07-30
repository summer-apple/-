package com.zhejianglehua.rzf.action.util;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.ParseException;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.If;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.zhejianglehua.rzf.entity.weixin.po.AccessToken;
import com.zhejianglehua.rzf.service.util.WeixinUtilService;

@Namespace("/weixin")
@Controller
public class GetAccessTokenAction implements ApplicationListener<ContextRefreshedEvent>  {
	
	
	private HttpServletRequest request;
	private Timer timer =null;
	
	@Autowired
	private WeixinUtilService weixinUtilService;
	
	@Autowired
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}


	




	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		
//		if(event.getApplicationContext().getParent() == null){
//			System.out.println("启动定时获取Access Token任务...");
//			
//			timer = new Timer(true);
//			
//			timer.schedule(new TimerTask() {
//				
//				@Override
//				public void run() {
//					try {
//						AccessToken token = weixinUtilService.getAccessToken();
//						request.getServletContext().setAttribute("token", token);
//					} catch (ParseException | IOException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//			}, 10000, 5000);// 延迟0s后执行，每55分钟执行一次
//		}
	}


//	@Action("/weixin/refresh-access-token")
//	public String refreshAccessToken() throws ParseException, IOException {
//
//		String token = null;
//		try {
//			
//			AccessToken accessToken = weixinUtilService.getAccessToken();
//			token =  accessToken.getToken();
//			
//			//request = ServletActionContext.getRequest();
//			
//			request.getServletContext().setAttribute("access_token",token);
//		
//			
//			System.out.println(token);
//			
//			System.out.println("刷新token...");
//			
//		} catch (ParseException | IOException e) {
//			e.printStackTrace();
//		}
//		return token;
//	}

}