package com.zjlh.villa.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.dao.SvsDaoHibernate4;
import com.zjlh.villa.dao.VillaDaoHibernate4;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.Svs;
import com.zjlh.villa.entity.Villa;

@Service
public class FuckService {
	
	
	@Autowired
	private MemberDaoHibernate4 memberDao;
	
	@Autowired
	private VillaDaoHibernate4 villaDao;
	
	@Autowired SvsDaoHibernate4 svsDao;
	
	public String fuck() {
//		Member member = new Member();
//		//Member member = memberDao.get(Member.class, "openid", "oDVwktxzxJPXEGgXh1RHX47QX6Pw");
//		member.setCity("cao");
//
//		System.out.println(memberDao.save(member));
//		System.out.println();
//		System.out.println("Fuck Service...");
		
		
		//Villa villa= villaDao.get(Villa.class, 11);
		
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
		
		String jstr = "{'bedroom':0,'city':'','description':'','detail':'','district':'','facility':[],'id':51,'img':[],'name':'fuck','normalPrice':0,'people':0,'province':'','specialPrice':0,'star':0,'store':0,'svs':[{'content':'adsfadsf','type':1',id':11,'typeValue':'收费'}],'weight':0}";
		JSONObject json=JSONObject.fromObject(jstr);
		Villa villa = (Villa) JSONObject.toBean(json);
		
		System.out.println("aaaaaaa"+JSONObject.fromObject(villa));
		
		villaDao.save(villa);
		
		JSONObject obj = JSONObject.fromObject(villa);
		System.out.println(obj);
		return obj.toString();
		
		
		
	}
}
