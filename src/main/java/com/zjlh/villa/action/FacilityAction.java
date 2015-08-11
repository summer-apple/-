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
import com.zjlh.villa.entity.Facility;
import com.zjlh.villa.service.FacilityService;
@Namespace("/facility")
@Controller
public class FacilityAction extends ActionSupport {

	
	@Autowired
	private FacilityService fs;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Action("/facility/addFacility")
	public String addFacility() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String data = request.getParameter("data");

		
		
		
		if (data==null) {
			return INPUT;
		}else {
			PrintWriter out = response.getWriter();
			JSONObject obj = JSONObject.fromObject(data);
			Facility facility = (Facility)JSONObject.toBean(obj,Facility.class);
			
			boolean flag = fs.verifyFacility(facility.getContent());
			
			if (!flag) {
				fs.addFacility(facility);
				out.print(true);
			}else {
				out.print(false);
			}
			out.close();
			
			return null;
		}
		
	}//addFacility end
	
	
	@Action("/facility/delFacility")
	public void delFacility() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
		boolean flag = fs.verifyFacility(id);
		
		if (flag) {
			fs.delFacility(id);
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
		
	}
	
	@Action("/facility/qryFacility")
	public void qryFacility() throws IOException{
		response = ServletActionContext.getResponse();
		request = ServletActionContext.getRequest();
		
		String content = request.getParameter("content");
		String type = request.getParameter("type");
		List<Facility> list = fs.qryFacility(content,type);
		
		JSONArray array = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(array);
		out.close();
	}
	
	
	
	
}
