package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.zjlh.villa.entity.Villa;
import com.zjlh.villa.entity.VillaFacility;
import com.zjlh.villa.entity.VillaImg;
import com.zjlh.villa.entity.VillaSvs;
import com.zjlh.villa.service.FacilityService;
import com.zjlh.villa.service.ImgService;
import com.zjlh.villa.service.SvsService;
import com.zjlh.villa.service.VillaService;
@Namespace("/villa")
@Controller
public class VillaAction extends ActionSupport {

	
	@Autowired
	private VillaService vs;
	@Autowired
	private SvsService ss;
	@Autowired
	private FacilityService fs;
	@Autowired
	private ImgService is;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@Action("/villa/addVilla")
	public String addVilla() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		String data = request.getParameter("data");
		String svslist = request.getParameter("svslist");
		String facilitylist = request.getParameter("facilitylist");
		String imglist = request.getParameter("imglist");
		
		
		JSONArray svsarray = JSONArray.fromObject(svslist);
		JSONArray facilityarray = JSONArray.fromObject(facilitylist);
		JSONArray imgarray = JSONArray.fromObject(imglist);
		
		boolean addFlag=false;//是否需要新增服务、设施、图片
		
		
		if (data==null) {
			return INPUT;
		}else {
			PrintWriter out = response.getWriter();
			
			JSONObject obj = JSONObject.fromObject(data);
			Villa villa = (Villa)JSONObject.toBean(obj, Villa.class);
		
			int villaid=0;
			
			if (villa.getId()==null){//新增
				if (!vs.verifyVilla(villa.getStore(), villa.getName())) {//同一商户下不存在相同名称的别墅
					villaid = vs.addVilla(villa);//保存villa并获得ID
					addFlag = true;
				}
			}else {//编辑
				
				villaid = villa.getId();
				
				List<Villa> villalist = vs.findVillaByName(villa.getName());
				
				if (villalist.size()==1) {//存在该名称的别墅
					if (villalist.get(0).getId()==villaid) {//该名称别墅即为本别墅
						vs.editVilla(villa);
						addFlag = true;
					}
				}else {
					vs.editVilla(villa);
					addFlag = true;
				}
			}
				
			if (addFlag) {
				ss.addVillaSvslist(svsarray, villaid);
				fs.addVillaFacilityList(facilityarray, villaid);
				is.addVillaImgList(imgarray, villaid);
				out.print(true);
			}else {
				out.print(false);
			}
			out.close();
			
			return null;
		}
		
	}//addVilla end
	
	
	@Action("/villa/delVilla")
	public void delVilla() throws IOException{
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		PrintWriter out = response.getWriter();
	
		if (vs.verifyVilla(id)) {
			vs.delVilla(id);//删除别墅
			
			ss.delSvsList(id);
			fs.delFacilityList(id);
			is.delImgList(id);
			
			
			
			
			out.print(true);
		}else {
			out.print(false);
		}
		out.close();
		
	}
//	
//	@Action("/villa/qryVilla")
//	public void qryVilla() throws IOException{
//		response = ServletActionContext.getResponse();
//		List<Villa> list = fs.qryVilla();
//		
//		JSONArray array = JSONArray.fromObject(list);
//		PrintWriter out = response.getWriter();
//		out.print(array);
//		out.close();
//	}
//	
//	
//	
//	
}
