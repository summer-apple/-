package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Orders;
import com.zjlh.villa.service.OrdersService;
@Controller
@Namespace("/order")
public class OrdersAction extends ActionSupport {
	@Autowired
	private OrdersService os;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	
	
	
	@Action("/order/createOrder")
	public void createOrder() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		
		String data = request.getParameter("data");
		JSONObject obj = JSONObject.fromObject(data);
		
		
		
		Orders orders = (Orders) JSONObject.toBean(obj, Orders.class);
		orders.setState(0);
		orders = os.createOrder(orders);
		
		PrintWriter out = response.getWriter();
		out.print(JSONObject.fromObject(orders));
		out.close();
	}
	
	
	
	
	
	
	
	
	
}
