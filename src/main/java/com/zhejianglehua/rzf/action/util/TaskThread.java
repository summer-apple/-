//package com.zhejianglehua.rzf.action.util;
//
//import java.io.IOException;
//import java.util.TimerTask;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.http.ParseException;
//import org.apache.struts2.ServletActionContext;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.zhejianglehua.rzf.entity.weixin.po.AccessToken;
//import com.zhejianglehua.rzf.service.util.MailService;
//import com.zhejianglehua.rzf.service.util.MessageUtilService;
//import com.zhejianglehua.rzf.service.util.WeixinUtilService;
//@Service
//public class TaskThread extends TimerTask {
//
//	private MailService mailService;
//	
//	
//	@Autowired
//	public void setMailService(MailService mailService) {
//		this.mailService = mailService;
//	}
//
//
//	private HttpServletRequest request;
//
//	private WeixinUtilService weixinUtilService;
//	
//	@Autowired
//	public void setWeixinUtilService(WeixinUtilService weixinUtilService) {
//		this.weixinUtilService = weixinUtilService;
//	}
//
//	public static TaskThread taskThread = null;
//	
//
//
//	@SuppressWarnings("unused")
//	private ServletContext context = null;
//
//	public TaskThread(ServletContext context) {
//		this.context = context;
//	}
//
//	public static TaskThread GetTaskThread(ServletContext context) {
//		if (taskThread == null)
//			taskThread = new TaskThread(context);
//		return taskThread;
//	}
//
//	public void run() { // 在此添加要执行的任务
//		
//		
//		mailService.registerMail();
//		
////		try {
////			System.out.println("刷新token");
////
////			//weixinUtilService = new WeixinUtilService();
////			AccessToken accessToken = weixinUtilService.getAccessToken();
////			
////			request = ServletActionContext.getRequest();
////			request.getServletContext().setAttribute("access_token",accessToken.getToken());
////		} catch (ParseException | IOException e) {
////			e.printStackTrace();
////		}
//		
//		//System.out.println("fuck you");
//	}
//}