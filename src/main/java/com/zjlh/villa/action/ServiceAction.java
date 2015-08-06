package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Service;
import com.zjlh.villa.service.ServiceService;
@Namespace("/service")
@Controller
public class ServiceAction extends ActionSupport {

	
	@Autowired
	private ServiceService ss;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Action("/service/addService")
	public String addService() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String content = request.getParameter("content");
		int type = Integer.parseInt(request.getParameter("type"));
		
		
		
		if (content==null) {
			return INPUT;
		}else {
			PrintWriter out = response.getWriter();
			Service service = new Service(content, type);
			
			boolean flag = ss.verifyService(content);//判断内容是否存在
			
			if (!flag) {
				ss.addService(service);
				out.print(true);
			}else {
				out.print(false);
			}
			out.close();
			
			return null;
		}
		
	}//addService end
	
	
	@Action("/service/delService")
	public void delService() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
		
		boolean flag = ss.verifyService(id);//判断是否存在
	
		if (flag) {
			ss.delService(id);
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
		
	}
	
	@Action("/service/qryService")
	public void qryService() throws IOException{
		response = ServletActionContext.getResponse();
		List<Service> list = ss.qryService();
		
		JSONArray array = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(array);
		out.close();
	}
	
	
	
	
}
