package com.zjlh.villa.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.weixin.po.PayReturn;
import com.zjlh.villa.service.MemberService;
import com.zjlh.villa.service.StoreService;
import com.zjlh.villa.service.util.message.utils.StringUtil;

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
	public void qryMember() throws IOException {

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
	
	@Action("/member/updateInfo")
	public void updateInfo() throws ParseException, IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);
		
		Member member = ms.updateInfo(object.getInt("id"), object.getString("truename"), object.getString("email"),  object.getString("phone"),  object.getString("birthday"));
		request.getSession().setAttribute("member", member);
		PrintWriter out = response.getWriter();
		out.print(true);
		out.close();
	}
	
	@Action("/member/messgaeCallBack")
	public void messgaeCallBack() throws UnsupportedEncodingException, IOException{

		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		ServletInputStream in = request.getInputStream();
		String str = inputStream2String(in);
		if (StringUtils.isNotBlank(str)) {
			JSONObject object = JSONObject.fromObject(str);
			System.out.println(object.toString()+"@@@@@@@@@@@@@");
		}
	}
	
	public static final String inputStream2String(InputStream in)
			throws UnsupportedEncodingException, IOException {
		if (in == null)
			return "";

		StringBuffer out = new StringBuffer();
		byte[] b = new byte[4096];
		for (int n; (n = in.read(b)) != -1;) {
			out.append(new String(b, 0, n, "UTF-8"));
		}
		return out.toString();
	}
	
	@Action("/member/messgae")
	public void messgae() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		PrintWriter out = response.getWriter();
		
		
		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);
		
		
		String project = object.getString("project");
		String code = object.getString("code");
		
		if (StringUtils.isBlank(project)) {
			out.print(false);
			out.close();
			return;
		}
		
		
		List<String> phonelist = new ArrayList<String>();
		
		if (StringUtils.isBlank(object.getString("phonelist"))) {
			phonelist = ms.getPhoneList();
		}else {
			String[] array = object.getString("phonelist").split(",");
			phonelist = Arrays.asList(array);
		}

		ms.sendMessage(phonelist, project, code);
		out.print(true);
		out.close();
		
	}
}
