package com.zjlh.villa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		member.setTruename(truename);
		member.setEmail(email);
		member.setPhone(phone);
		dao.update(member);
	}
}
