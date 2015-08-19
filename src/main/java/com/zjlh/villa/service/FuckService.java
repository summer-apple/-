package com.zjlh.villa.service;

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
	private MemberDaoHibernate4 memberDao;
	
	@Autowired
	private VillaDaoHibernate4 villaDao;
	
	@Autowired 
	private SvsDaoHibernate4 svsDao;
	
	@Autowired
	private FacilityDaoHibernate4 facilityDao;
	
	@Autowired
	private ImgDaoHibernate4 imgDao;
	
	@Autowired
	private VillaService villaService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MemberService memberService;
	
	public String fuck() {
		Map<String, Object> map = villaService.qryVilla("", "100", "", "", 1, 10);
		//villaService.qryVilla(province, highPrice, lowPrice, bedroom, pageNo, pageSize)
		//Map<String, Object> map = storeService.qryStore("", "", "", 0, 10);
		
		//Map<String, Object> map = memberService.qryMembers(0, 10);
		
		JSONObject obj = JSONObject.fromObject(map);
		
		System.out.println(obj);
		
//for (int i = 0; i < 111; i++) {
//	Villa villa= villaDao.get(Villa.class, 11);
//	villa.getSvs().add(svsDao.get(Svs.class, 1));
//	villa.getSvs().add(svsDao.get(Svs.class, 2));
//	villa.getSvs().add(svsDao.get(Svs.class, 3));
//	villa.getSvs().add(svsDao.get(Svs.class, 4));
//	villa.getSvs().add(svsDao.get(Svs.class, 5));
//	villa.getSvs().add(svsDao.get(Svs.class, 6));
//	
//	
//	
//	
//	
//	villa.getFacility().add(facilityDao.get(Facility.class, 1));
//	villa.getFacility().add(facilityDao.get(Facility.class, 2));
//	villa.getFacility().add(facilityDao.get(Facility.class, 3));
//	villa.getFacility().add(facilityDao.get(Facility.class, 4));
//	villa.getFacility().add(facilityDao.get(Facility.class, 5));
//	villa.getFacility().add(facilityDao.get(Facility.class, 6));
//	
//	
//	villa.getImg().add(imgDao.get(Img.class, 1));
//	villa.getImg().add(imgDao.get(Img.class, 2));
//	villa.getImg().add(imgDao.get(Img.class, 3));
//	villa.getImg().add(imgDao.get(Img.class, 4));
//	villa.getImg().add(imgDao.get(Img.class, 5));
//	villa.getImg().add(imgDao.get(Img.class, 6));
//	
//	
//	villa.setName("Villa-"+String.valueOf(i));
//	
//	villaDao.save(villa);
//	
//}
		
		
		
		
		
		
		//villaDao.delete(Villa.class, 13);
		//Svs svs = new Svs("test", 1);
		//Svs svs2 = new  Svs("test2",0);
//		Villa villa = new Villa();
//		
//		villa.setName("TestVillaNamea");
//		villa.getSvs().add(svsDao.get(Svs.class, 7));
//		villa.getSvs().add(svsDao.get(Svs.class, 8));
//		villa.getSvs().add(new Svs("ddd", 0));
//		
//		
		//villaDao.save(villa);
		
		//Svs svs = svsDao.get(Svs.class, 5);
		
//		Villa villa = new Villa();
//		villa.setName("fuck");
//		
//		villa.getSvs().add(svsDao.get(Svs.class, 11));
//		//villa.getSvs().add(new Svs("aaaaaaaaaaa", 1));
//		
//		villaDao.save(villa);
//		
//		Set<Svs> svslist = villa.getSvs();
//		
//		for (Iterator iterator = svslist.iterator(); iterator.hasNext();) {
//			Svs svs = (Svs) iterator.next();
//			System.out.println(svs.getId());
//		}
		
//		String jstr = "{'bedroom':0,'city':'','description':'','detail':'','district':'','facility':[],'id':51,'img':[],'name':'fuck','normalPrice':0,'people':0,'province':'','specialPrice':0,'star':0,'store':0,'svs':[{'content':'adsfadsf','type':1',id':11,'typeValue':'收费'}],'weight':0}";
//		JSONObject json=JSONObject.fromObject(jstr);
//		Villa villa = (Villa) JSONObject.toBean(json);
//		
//		System.out.println("aaaaaaa"+JSONObject.fromObject(villa));
//		
//		villaDao.save(villa);
//		
//		JSONObject obj = JSONObject.fromObject(villa);
//		System.out.println(obj);
//		return obj.toString();
		
		return obj.toString();
		
	}
}
