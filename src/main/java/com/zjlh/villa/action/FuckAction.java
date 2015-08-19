package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.service.FuckService;
import com.zjlh.villa.service.util.WeixinUtilService;
@Namespace("/fuck")
@Controller
public class FuckAction extends ActionSupport {

	@Autowired
	private FuckService fuckService;
	
	@Autowired
	private WeixinUtilService weixinUtilService;
	
	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	private HttpServletRequest request;


	@Action("/fuck/fuck")
	public String fuck() throws IOException {
		
		response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript; charset=utf-8");
		System.out.println("Fuck Action...");
//		JSONObject jsonObject=new JSONObject();
//		jsonObject.put("city", "杭州");
//		jsonObject.put("country","中国");
//		jsonObject.put("headimgurl","http://wx.qlogo.cn/mmopen/kXQeGr6u5Mqf5vAe5ahjn2pYZic4OtvFP0j5jM02AcaXINYGhfM6Y65vNSHWqriaBxuD610QIwnOkT0f8gPXPgFaEia9xhvMCZF/0");
//		jsonObject.put("language","zh_CN");
//		jsonObject.put("nickname","五花肉");
//		jsonObject.put("openid","oDVwktxzxJPXEGgXh1RHX47QX6Pw");
//		jsonObject.put("province","浙江");
//		jsonObject.put("remark","");
//		jsonObject.put("sex",1);
//		jsonObject.put("subscribe",1);
//		jsonObject.put("subscribeTime",1438788246);
//		
//		weixinUtilService.moni(jsonObject);
		PrintWriter out = response.getWriter();
		out.print(fuckService.fuck());
		out.close();
		
		return null;
	}
	
	
	@Action("/fuck/fuckVilla")
	public void fuckVilla() throws IOException {
		response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/javascript; charset=utf-8");
		
		request = ServletActionContext.getRequest();
		
		String sss[] = request.getParameterValues("sss");
		
		
		PrintWriter out = response.getWriter();
		out.print(sss);
		out.close();
	}
	
}
