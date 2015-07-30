//package com.zhejianglehua.rzf.action;
//
//import java.io.PrintWriter;
//import java.sql.Date;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//
//import org.apache.struts2.ServletActionContext;
//import org.apache.struts2.convention.annotation.Namespace;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//
//import com.mysql.fabric.Response;
//import com.opensymphony.xwork2.ActionSupport;
//import com.zhejianglehua.rzf.entity.Member;
//@Namespace("/test")
//@Controller
//public class TestAction extends ActionSupport {
//
//	@Autowired
//	private HttpServletRequest request;
//	@Autowired
//	private HttpServletResponse response;
//	
//	@Override
//	public String execute() throws Exception {
//		
//		 HttpServletRequest request = ServletActionContext.getRequest();
//	     HttpServletResponse response = ServletActionContext.getResponse();
//		
//		Member member = new Member("adsf", "summer", 1, "zhejiang", "hangzhou", "china", "asdf", "adsf", "adsf", "asdf", "adsf", "summer@gmcil.com", "Asdf");
//		
//		
//		Member member2 = member;
//		
//		
//		List<Member> memberlist = new ArrayList<Member>();
//		
//		memberlist.add(member);
//		memberlist.add(member2);
//		
//		
//		JSONArray jsonArray = JSONArray.fromObject(memberlist);
//		
//		
//		Member member3 = (Member) JSONObject.toBean(jsonArray.getJSONObject(0), Member.class);
//		
//		System.out.println(member3.getNikename());
//		
//		System.out.println(jsonArray);
//		
//		
//		JSONObject object = JSONObject.fromObject(member3);
//		
//		object.accumulate("fuck", "fuckyou");
//		System.out.println(object.get("province"));
//		
//		jsonArray.add(object);
//		
//		PrintWriter out = response.getWriter();
//		out.print(jsonArray);
//		out.close();
//	
//		
//		
//		return null;
//	}
//
//
//	
//	
//	
//}
