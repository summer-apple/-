package com.zjlh.villa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zjlh.villa.service.CommentService;

@Namespace("/comment")
@Controller
public class CommentAction {
	@Autowired
	private CommentService cs;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	
	@Action("/comment/addComment")
	public void addComment() {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
	}
}
