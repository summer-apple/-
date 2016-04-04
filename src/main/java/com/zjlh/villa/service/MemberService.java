package com.zjlh.villa.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.MESSAGEXsend;
import com.zjlh.villa.service.util.message.utils.ConfigLoader;

import net.sf.json.JSONObject;

@Service
public class MemberService {
	@Autowired
	private MemberDaoHibernate4 dao;
	Logger logger = Logger.getLogger(MemberService.class);  
	
	
	
	public Member addMemberFromJson(JSONObject object) {
		
		String openid = object.getString("openid");
		String nickname = object.getString("nickname");
		Integer sex = object.getInt("sex");
		String city = object.getString("city");
		String country = object.getString("country");
		String province = object.getString("province");
		String headimgurl = object.getString("headimgurl");		 
		
		
		Member member = new Member(openid, nickname, sex, city, country, province, null, headimgurl, 0, null, null, null, null, null, null, 1);
		Member member2 = dao.get(Member.class, "openid", openid);//查询数据库看该用户是否存在
		
		if (member2==null) {
			dao.save(member);//保存新用户
			return dao.get(Member.class, "openid", openid);//从数据库里查询出带ID的用户信息并返回
		}else {
			member2.setNickname(nickname);
			member2.setHeadimgurl(headimgurl);
			dao.update(member2);
			return member2;
		}
	}
	
	public Map<String, Object> qryMembers(int pageNo,int pageSize) {
		
		List<Member> list = new ArrayList<Member>();
		long amount = 0;
		
		try {
			list = dao.findByPage("FROM Member ORDER BY id DESC", pageNo, pageSize);
			amount = dao.findCount("SELECT COUNT(*) FROM Member");
		} catch (Exception e) {
			logger.debug(e);
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("amount", amount/pageSize+1);
		return map;
	}
	
	
	public void update(int id,String truename,String email,String phone) {
		Member member = dao.get(Member.class, id);
		if (StringUtils.isBlank(member.getTruename())) {
			member.setTruename(truename);
		}
		if (StringUtils.isBlank(member.getEmail())) {
			member.setEmail(email);
		}
		if (StringUtils.isBlank(member.getPhone())) {
			member.setPhone(phone);
		}
		logger.info("根据订单更新用户信息："+ id +truename+" "+email+" "+phone);
		dao.update(member);
	}
	
	
	
	public Member updateInfo(int id,String truename,String email,String phone,String birthday) throws ParseException {
		Member member = dao.get(Member.class, id);
		member.setTruename(truename);
		member.setEmail(email);
		member.setPhone(phone);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(birthday);
		member.setBirthday(date);
		dao.update(member);
		logger.info("更新用户信息："+ id +truename+" "+email+" "+phone+" "+birthday);
		return member;
	}
	
	public Member getMember(int id) {
		return dao.get(Member.class, id);
	}
	
	public Member getMember(String openid) {
		return dao.get(Member.class, "openid", openid);
	}
	
	public List<String> getPhoneList() {
		String sql = "select phone from Member where phone is not null and char_length(phone)=11";
		List<String> phoneList =  (List<String>) dao.sqlQryList(sql);
		return phoneList;
	}
	
	public List<String> getBirthdayPhoneList() {	
		String sql = "select m.phone from Member m where m.phone is not null and char_length(m.phone)=11 and MONTH(m.birthday)=MONTH(NOW()) and  DAYOFMONTH(m.birthday)=DAYOFMONTH(NOW())";
		List<String> phoneList =  (List<String>) dao.sqlQryList(sql);
		return phoneList;
	}
	
	public void sendMessage(List<String> phonelist,String project,String code){
		for (int i = 0; i < phonelist.size(); i++) {
			AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
			MESSAGEXsend submail = new MESSAGEXsend(config);
			submail.addTo(phonelist.get(i));
			submail.setProject(project);
			submail.addVar("code", code);
			submail.xsend();
		}
	}
}
