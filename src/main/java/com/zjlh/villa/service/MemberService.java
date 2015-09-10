package com.zjlh.villa.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.entity.Member;

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
}
