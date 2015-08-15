package com.zjlh.villa.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

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
import com.zjlh.villa.entity.Facility;
import com.zjlh.villa.entity.Img;
import com.zjlh.villa.entity.Svs;
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
	public void addVilla() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
		

		boolean addFlag = false;// 是否需要新增服务、设施、图片

		
			PrintWriter out = response.getWriter();

			JSONObject obj = JSONObject.fromObject(data);
			Villa villa = (Villa) JSONObject.toBean(obj, Villa.class);
			
			List<Svs> svslist = (List<Svs>) villa.getSvs();
			List<Facility> facilitylist =  (List<Facility>) villa.getFacility();
			List<Img> imglist = (List<Img>) villa.getImg();
			
			int villaid = 0;

			if (!vs.verifyVilla(villa.getStore(), villa.getName())) {// 同一商户下不存在相同名称的别墅
					villaid = vs.addVilla(villa);// 保存villa并获得ID
					addFlag = true;
			}
		
			if (addFlag) {
				ss.addVillaSvslist(svslist, villaid);
				fs.addVillaFacilityList(facilitylist, villaid);
				is.addVillaImgList(imglist, villaid);
				out.print(villaid);
			} else {
				out.print(false);
			}
			out.close();

		}// addVilla end

	
	
	@Action("/villa/updateVilla")
	public void updateVilla() throws IOException{
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
		
		JSONObject obj = JSONObject.fromObject(data);
		
		Villa villa = (Villa) JSONObject.toBean(obj, Villa.class);
		
		List<Svs> svslist = (List<Svs>) villa.getSvs();
		List<Facility> facilitylist =  (List<Facility>) villa.getFacility();
		List<Img> imglist = (List<Img>) villa.getImg();
		
		
		PrintWriter out = response.getWriter();
		int villaid = villa.getId();
		boolean addFlag = false;// 是否需要新增服务、设施、图片
		
		List<Villa> villalist = vs.findVillaByName(villa.getName());

		if (villalist.size() == 1) {// 存在该名称的别墅
			if (villalist.get(0).getId() == villaid) {// 该名称别墅即为本别墅
				vs.updateVilla(villa);
				addFlag = true;
			}
		} else {
			vs.updateVilla(villa);
			addFlag = true;
		}
		
		if (addFlag) {
			ss.addVillaSvslist(svslist, villaid);
			fs.addVillaFacilityList(facilitylist, villaid);
			is.addVillaImgList(imglist, villaid);
			out.print(true);
		} else {
			out.print(false);
		}
		out.close();
		
	}
	
	
	
	
	
	
	@Action("/villa/delVilla")
	public void delVilla() throws IOException {

		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		int id = Integer.parseInt(request.getParameter("id"));

		PrintWriter out = response.getWriter();

		if (vs.verifyVilla(id)) {
			vs.delVilla(id);// 删除别墅

			ss.delSvsList(id);
			fs.delFacilityList(id);
			// is.delImgList(id);

			out.print(true);
		} else {
			out.print(false);
		}
		out.close();

	}

	@Action("/villa/qryVilla")
	public void qryVilla() throws IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		String data = request.getParameter("data");
		JSONObject object = JSONObject.fromObject(data);

		Map<String,Object> map = vs.qryVilla(object.getString("province"),
				object.getString("highPrice"), object.getString("lowPrice"),
				object.getString("bedroom"),
				Integer.parseInt(object.getString("pageNo")),
				Integer.parseInt(object.getString("pageSize")));

		JSONObject obj = JSONObject.fromObject(map);
		PrintWriter out = response.getWriter();
		out.print(obj);
		out.close();
	}
}
