package com.zjlh.villa.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Admin;
import com.zjlh.villa.service.AdminService;
@Controller
@Namespace("/admin")
@Results({ 
		@Result(name = "svs", location = "/WEB-INF/content/dashboard/svs.jsp"),
		@Result(name = "login", location = "/WEB-INF/content/dashboard/login.jsp")
		})
public class AdminAction extends ActionSupport {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private AdminService as;
	
	@Action("/admin/login")
	public String login() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		Admin  admin = as.login(name, password);
		if (admin!=null) {
			request.getSession().setAttribute("admin", admin);
			request.removeAttribute("result");
			return "svs";
		}else {
			request.setAttribute("result", "用户名或密码错误！");
			return "login";
		}
			
			
		
		
	}
	
	
	@Action("/admin/logout")
	public String logout() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		request.getSession().removeAttribute("admin");
		return "login";
	}
	
}
