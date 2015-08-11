package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Svs;
import com.zjlh.villa.service.SvsService;
@Namespace("/svs")
@Controller
public class SvsAction extends ActionSupport {

	
	@Autowired
	private SvsService ss;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Action("/svs/addSvs")
	public String addSvs() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String data = request.getParameter("data");


		if (data==null) {
			return INPUT;
		}else {
			
			JSONObject obj = JSONObject.fromObject(data);
			Svs svs = (Svs) JSONObject.toBean(obj,Svs.class);
			
			PrintWriter out = response.getWriter();
			
			boolean flag = ss.verifySvs(svs.getContent());//判断内容是否存在
			
			if (!flag) {
				ss.addSvs(svs);
				out.print(true);
			}else {
				out.print(false);
			}
			out.close();
			
			return null;
		}
		
	}//addService end
	
	
	@Action("/svs/delSvs")
	public void delSvs() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
		
		boolean flag = ss.verifySvs(id);//判断是否存在
	
		if (flag) {
			ss.delSvs(id);
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
		
	}
	
	@Action("/svs/qrySvs")
	public void qrySvs() throws IOException{
		response = ServletActionContext.getResponse();
		request = ServletActionContext.getRequest();
		
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		
		List<Svs> list = ss.qrySvs(content,type);
		
		
		JSONArray array = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(array);
		out.close();
	}
	
	
//以上service
	
	
//以下villa_service
	
	
	@Action("/svs/addVillaSvs")
	public String addVillaService() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String content = request.getParameter("content");
		int type = Integer.parseInt(request.getParameter("type"));
		
		
		
		if (content==null) {
			return INPUT;
		}else {
			PrintWriter out = response.getWriter();
			Svs svs = new Svs(content, type);
			
			boolean flag = ss.verifySvs(content);//判断内容是否存在
			
			if (!flag) {
				ss.addSvs(svs);
				out.print(true);
			}else {
				out.print(false);
			}
			out.close();
			
			return null;
		}
		
	}//addVilla Svs end
	
	
	
	
	
}
