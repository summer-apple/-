package com.zjlh.villa.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.AdminDaoHibernate4;
import com.zjlh.villa.entity.Admin;
import com.zjlh.villa.service.util.AlgorithmService;

@Service
public class AdminService {
	@Autowired
	private AdminDaoHibernate4 dao;
	@Autowired
	private AlgorithmService as;
	
	public Admin login(String name,String password) {
		
		Admin admin = dao.get(Admin.class, "name", name);
		
		if (admin!=null) {//存在
			password = as.getMD5(password);
			if (password.equals(admin.getPassword())) {
				return admin;
			}
		}
		return null;
	}
	
	
	
	

	
}
