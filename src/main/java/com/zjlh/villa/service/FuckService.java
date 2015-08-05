package com.zjlh.villa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.entity.Member;

@Service
public class FuckService {
	
	
	@Autowired
	private MemberDaoHibernate4 memberDao;
	
	
	public void fuck() {
		Member member = new Member();
		//Member member = memberDao.get(Member.class, "openid", "oDVwktxzxJPXEGgXh1RHX47QX6Pw");
		member.setCity("cao");

		System.out.println(memberDao.save(member));
		System.out.println();
		System.out.println("Fuck Service...");
	}
}
