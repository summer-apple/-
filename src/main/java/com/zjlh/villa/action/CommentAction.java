package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
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
import com.zjlh.villa.service.VillaService;

@Namespace("/comment")
@Controller
public class CommentAction {
	@Autowired
	private CommentService cs;
	@Autowired
	private ImgService is;
	@Autowired
	private VillaService vs;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Action("/comment/qryComment")
	public void qryComment() throws IOException {

		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);

		Map<String, Object> map = cs.qryComment(
				Integer.parseInt(object.getString("pageNo")),
				Integer.parseInt(object.getString("pageSize")));

		JSONObject obj = JSONObject.fromObject(map);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();

	}	
	
	@Action("/comment/addComment")
	public void addComment() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
		String[] img = request.getParameter("img").split(",");
		
		
		JSONObject obj = JSONObject.fromObject(data);
		
		Comment comment = (Comment) JSONObject.toBean(obj,Comment.class);
	
		int commentid = 0;
		boolean addImgFlag = false;
		if (!cs.verifyComment(comment.getOrderid())) {
			comment.setCommentDay(new Date());
			if (comment.getContent()==null||comment.getContent().equals("")) {
				comment.setContent("无评价");
			}
			commentid = cs.addComment(comment);
			
			//更新别墅评分
			vs.updateStar(comment.getVilla());
			addImgFlag = true;
		}
		
		
		if (addImgFlag && !img[0].equals("null")) {
			List<Img> imglist = is.getImgByIDs(img);
			is.addCommentImgList(imglist, commentid);
		}
		
		
		PrintWriter out = response.getWriter();
		
		out.print(commentid);
		
		out.close();
		
	}
	
	@Action("/comment/delComment")
	public void delCommentByOrder() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		int orderid = Integer.parseInt(request.getParameter("id"));
		cs.delComment(orderid);
		PrintWriter out = response.getWriter();
		out.print(true);
		out.close();
	}
	
	
	@Action("/comment/qryCommentByVilla")
	public void qryCommentByVilla() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		int orderid = Integer.parseInt(request.getParameter("id"));
		
		List<Comment> list = cs.qryComment(orderid);
		
		JSONArray array = JSONArray.fromObject(list);
		PrintWriter out = response.getWriter();
		out.print(array);
		out.close();
		
	}
}
