package com.zjlh.villa.action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

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
		
		String folder = request.getParameter("folder");
		System.out.println(folder);
		
		String path = ServletActionContext.getServletContext().getRealPath(
				"/resources/image/"+folder);

		System.out.println(path);

		System.out.println(upload);

		File file = new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		// 循环将批量上传的文件保存到本地
		for (int i = 0; i < upload.size(); i++) {
			
			String url = "resources/image/"+folder+"/"+uploadFileName.get(i);
			
			if (!is.verifyImg(url)) {//不存在
				FileUtils.copyFile(upload.get(i),new File(file, uploadFileName.get(i)));
				is.addImg(url);
			}
			
		}

		result = "上传成功！";

		return null;
		}
	}
	
	
	@Action("/img/delImg")
	public void delImg(){
		request = ServletActionContext.getRequest();
		int id = Integer.parseInt(request.getParameter("id"));
		
		if (is.verifyImg(id)) {//存在
			is.delImg(id);
		}
		
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
