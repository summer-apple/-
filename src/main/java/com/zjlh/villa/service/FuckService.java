package com.zjlh.villa.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.FacilityDaoHibernate4;
import com.zjlh.villa.dao.ImgDaoHibernate4;
import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.dao.SvsDaoHibernate4;
import com.zjlh.villa.dao.VillaDaoHibernate4;
import com.zjlh.villa.entity.Facility;
import com.zjlh.villa.entity.Img;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.Svs;
import com.zjlh.villa.entity.Villa;

@Service
public class FuckService {
	
	
	@Autowired
	private OrdersService os;
	
	@Autowired
	private CommentService cs;
	
	@Autowired
	private VillaService vs;
	
	
	public String fuck() {
		
		os.commented(134);
		
		
		
		
		return JSONArray.fromObject(cs.qryComment(44)).toString();
		
	}
}
