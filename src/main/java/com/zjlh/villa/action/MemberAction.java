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
import com.zjlh.villa.service.MemberService;
import com.zjlh.villa.service.StoreService;

@Controller
@Namespace("/member")
public class MemberAction extends ActionSupport {
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@Action("/member/qryMember")
	public void qryStore() throws IOException {

		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);

		Map<String, Object> map = ms.qryMembers(
				Integer.parseInt(object.getString("pageNo")),
				Integer.parseInt(object.getString("pageSize")));

		JSONObject obj = JSONObject.fromObject(map);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();

	}
}
