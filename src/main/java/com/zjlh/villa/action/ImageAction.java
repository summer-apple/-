package com.zjlh.villa.action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Img;
import com.zjlh.villa.service.ImgService;
import com.zjlh.villa.service.util.AlgorithmService;

//@ParentPackage("default")
@Namespace("/img")
@Controller
//@InterceptorRef("myDefault")
//@InterceptorRefs({  
//    @InterceptorRef(value="fileUpload",params={"allowedTypes", "image/x-png,image/jpeg", "maximumSize", "2048"}),  
//    //@InterceptorRef("myDefault")   
//}) 
public class ImageAction extends ActionSupport {
	@Autowired
	private ImgService is;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private AlgorithmService as;
	
	
	private List<File> upload;

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private List<String> uploadContentType;

	private List<String> uploadFileName;

	private String result;


	
	@Action("/img/upload")
	public String upload() throws IOException {

		if (upload==null) {
			return INPUT;
		}else {
			
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String folder = request.getParameter("folder");
System.out.println(folder);
		
		String path = ServletActionContext.getServletContext().getRealPath(
				"/resources/images/"+folder);

System.out.println(path);

System.out.println(upload);

		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		// 循环将批量上传的文件保存到本地
		for (int i = 0; i < upload.size(); i++) {
			
			String filename = null;			
			Date date = new Date();	
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			filename = sdf.format(date);
			filename += as.getMD5(uploadFileName.get(i));date.toString();
			filename += uploadFileName.get(i).substring(uploadFileName.get(i).lastIndexOf("."));
			
			
System.out.println(filename);
			
			
			String url = "resources/images/"+folder+"/"+filename;
			
		
			FileUtils.copyFile(upload.get(i),new File(file, filename));
			int id = is.addImg(url);
			JSONObject object = new JSONObject();
			object.put("id", id);
			object.put("url", url);
System.out.println(object);			
			PrintWriter out = response.getWriter();
			out.print(object);
			out.close();
		}
		
		return null;
		}
	}
	
	
	@Action("/img/delVillaImg")
	public void delVillaImg() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		if (is.verifyImg(id)) {//存在
			is.delVillaImg(id);
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
	}
	@Action("/img/delCommentImg")
	public void delCommentImg() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		int id = Integer.parseInt(request.getParameter("id"));
		PrintWriter out = response.getWriter();
		if (is.verifyImg(id)) {//存在
			is.delVillaImg(id);
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
	}	
	@Action("/img/qryImg")
	public void qryImg() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		List<Img> list = is.qryImg();
		JSONArray array = JSONArray.fromObject(list);
		
		PrintWriter out = response.getWriter();
		out.print(array);
		out.close();
	}
	
	
	
}
