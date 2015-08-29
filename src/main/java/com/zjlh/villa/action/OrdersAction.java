package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.zjlh.villa.service.MemberService;
import com.zjlh.villa.service.OrdersService;
@Controller
@Namespace("/order")
public class OrdersAction extends ActionSupport {
	@Autowired
	private OrdersService os;
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	
	
	
	@Action("/order/createOrder")
	public void createOrder() throws IOException, ParseException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		
		String data = request.getParameter("data");
		JSONObject obj = JSONObject.fromObject(data);
		
		
		
		
		//更新用户资料
		int memberid = obj.getInt("member");
		String truename = obj.getString("truename");
		String email = obj.getString("email");
		String phone = obj.getString("phone");
		ms.update(memberid, truename, email, phone);
		
		
		
		
		
		//格式化日期
		String startDay = obj.getString("startDay");
		String endDay = obj.getString("endDay");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = sdf.parse(startDay);
		Date d2 = sdf.parse(endDay);
		
		
		Orders orders = (Orders) JSONObject.toBean(obj, Orders.class);
		
		//设置状态、日期
		orders.setState(0);
		orders.setStartDay(d1);
		orders.setEndDay(d2);
		
		int id = os.createOrder(orders);
		
		PrintWriter out = response.getWriter();
		out.print(id);
		out.close();
	}
	
	
	
	
	@Action("/order/calculate")
	public void calculate() throws ParseException, IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		
		Double normalPrice = Double.parseDouble(request.getParameter("normalPrice"));
		Double specialPrice = Double.parseDouble(request.getParameter("specialPrice"));
		
		int startPeriod = Integer.parseInt(request.getParameter("startPeriod"));
		int endPeriod = Integer.parseInt(request.getParameter("endPeriod"));
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startDay = sdf.parse(request.getParameter("startDay"));
		Date endDayDate = sdf.parse(request.getParameter("endDay"));
		
		Double money = os.calculate(startDay, endDayDate, startPeriod, endPeriod, normalPrice, specialPrice);
		
		PrintWriter out = response.getWriter();
		out.print(money);
		out.close();
		
	}
	
	
	
	
}
