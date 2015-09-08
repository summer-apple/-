package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zjlh.villa.entity.Comment;
import com.zjlh.villa.entity.Img;
import com.zjlh.villa.entity.Villa;
import com.zjlh.villa.service.CommentService;
import com.zjlh.villa.service.ImgService;

@Namespace("/comment")
@Controller
public class CommentAction {
	@Autowired
	private CommentService cs;
	@Autowired
	private ImgService is;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	
	
	@Action("/comment/addComment")
	public void addComment() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
		String[] img = request.getParameter("img").split(",");
		
		
		JSONObject obj = JSONObject.fromObject(data);
		
		Comment comment = (Comment) JSONObject.toBean(obj,Comment.class);
		

		
		int commentid = 0;
		comment.setCommentDay(new Date());
		commentid = cs.addComment(comment);
		
		
		List<Img> imglist = is.getImgByIDs(img);
		
		is.addCommentImgList(imglist, commentid);
		
		PrintWriter out = response.getWriter();
		
		out.print(commentid);
		
		out.close();
		
		
		
		
	}
}
