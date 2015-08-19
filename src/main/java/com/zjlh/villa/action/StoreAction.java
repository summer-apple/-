package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Store;
import com.zjlh.villa.service.StoreService;
@Controller
@Namespace("/store")
public class StoreAction extends ActionSupport {

	@Autowired
	private StoreService ss;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	
	@Action("/store/addStore")
	public void addStore() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String data = request.getParameter("data");
		JSONObject obj = JSONObject.fromObject(data);
		Store store = (Store) JSONObject.toBean(obj,Store.class);
		int id = ss.addStore(store);

		PrintWriter out = response.getWriter();
		out.print(id);
		out.close();
	}
	
	@Action("/store/updateStore")
	public void updateStore() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String data = request.getParameter("data");
		JSONObject obj = JSONObject.fromObject(data);
		Store store = (Store) JSONObject.toBean(obj,Store.class);
		boolean flag = ss.updateStore(store);
		
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.close();
	}
	
	
	@Action("/store/getStore")
	public void getStore() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		Store store = ss.getStore(id);
		JSONObject obj = JSONObject.fromObject(store);
		
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();
		
	}
	
	
	@Action("/store/qryStore")
	public void qryStore() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);
		
		
		Map<String, Object> map = ss.qryStore(object.getString("address"), object.getString("name"),
				object.getString("id"),
				Integer.parseInt(object.getString("pageNo")),
				Integer.parseInt(object.getString("pageSize")));
		
		JSONObject obj = JSONObject.fromObject(map);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();
		
	}
	
	
	
	@Action("/store/delStore")
	public void delStore() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		ss.delStore(id);
		
		PrintWriter out = response.getWriter();
		out.print(true);
		out.close();
	}
	
}
