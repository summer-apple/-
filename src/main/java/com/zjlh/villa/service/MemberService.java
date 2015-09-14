package com.zjlh.villa.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.MESSAGEXsend;
import com.zjlh.villa.service.util.message.utils.ConfigLoader;

@Service
public class MemberService {
	@Autowired
	private MemberDaoHibernate4 dao;
	
	public Map<String, Object> qryMembers(int pageNo,int pageSize) {
		List<Member> list = dao.findByPage("FROM Member", pageNo, pageSize);
		long amount = dao.findCount("SELECT COUNT(*) FROM Member");
		
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
		return member;
	}
	
	public Member getMember(int id) {
		return dao.get(Member.class, id);
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
