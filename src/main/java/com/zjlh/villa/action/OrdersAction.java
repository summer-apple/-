package com.zjlh.villa.action;

import java.beans.IntrospectionException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.Orders;
import com.zjlh.villa.entity.weixin.po.PayReturn;
import com.zjlh.villa.entity.weixin.po.PrePayReturn;
import com.zjlh.villa.service.MemberService;
import com.zjlh.villa.service.OrdersService;
@Controller
@Namespace("/order")
@Results({  
	  @Result(name="pay", location="/WEB-INF/content/mobile/pay.jsp")
	})  
public class OrdersAction extends ActionSupport {
	@Autowired
	private OrdersService os;
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	// 微信返回  fail 失败，success 成功
		private static final String STATUC_SUCCESS = "success";
		private static final String STATUC_FAIL    = "fail";
	
	
	
	@Action("/order/createOrder")
	public void createOrder() throws IOException, ParseException, org.apache.http.ParseException, IllegalAccessException, InstantiationException, InvocationTargetException, IntrospectionException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		
		String data = request.getParameter("data");
		JSONObject obj = JSONObject.fromObject(data);
		
		
		
		
		//更新用户资料
//		int memberid = obj.getInt("member");
//		String truename = obj.getString("truename");
//		String email = obj.getString("email");
//		String phone = obj.getString("phone");
//		ms.update(memberid, truename, email, phone);
		
		
		
		
		
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
		
		//设置openid
		
		orders.setOpenid(obj.getString("openid"));
		
		//设置别墅名称
		
		orders.setVillaName(obj.getString("villaName"));
		
		
		
		
		String ip = request.getRemoteAddr();
		
		
		//创建订单
		PrePayReturn  prePayReturn= os.createOrder(orders,ip);
		
		//设置session
		request.getSession().setAttribute("data", prePayReturn);
		
		PrintWriter out = response.getWriter();
		out.print(JSONObject.fromObject(prePayReturn));
		out.close();
		
		
//		
//		return "pay";
		
		
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
	
	
	@Action("/order/notify")
	public void payNotify() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		PayReturn payReturn=null;
		
		ServletInputStream in = request.getInputStream();
		// 转换微信post过来的xml内容
		XStream xs = new XStream(new DomDriver());
		xs.alias("xml", PayReturn.class);
		String xmlMsg = inputStream2String(in);
		payReturn = (PayReturn) xs.fromXML(xmlMsg);
		
		
		if ("SUCCESS".equals(payReturn.getResult_code())) {
			os.paidSuccess(Integer.parseInt(payReturn.getOut_trade_no()));
		}
		
		System.out.println(payReturn.getResult_code());
	}
	
    public static final String inputStream2String(InputStream in) throws UnsupportedEncodingException, IOException{
        if(in == null)
            return "";
        
        StringBuffer out = new StringBuffer();
        byte[] b = new byte[4096];
        for (int n; (n = in.read(b)) != -1;) {
            out.append(new String(b, 0, n, "UTF-8"));
        }
        return out.toString();
    }
	
}
