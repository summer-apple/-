package com.zjlh.villa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.VillaDaoHibernate4;
import com.zjlh.villa.entity.Villa;

@Service
public class VillaService {

	@Autowired
	private VillaDaoHibernate4 dao;
	
	
	public int addVilla(Villa villa) {
		
		
		
		
		return 0;
	}
	
	
//	public boolean verify() {
//		
//	}
}
