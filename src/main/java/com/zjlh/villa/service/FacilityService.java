package com.zjlh.villa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.FacilityDaoHibernate4;
import com.zjlh.villa.entity.Facility;

@Service
public class FacilityService {
	@Autowired
	private FacilityDaoHibernate4 dao;

	public void addFacility(Facility service) {
		dao.save(service);
	}// addFacility end

	public void delFacility(int id) {
		dao.delete(Facility.class,id);
	}//delService end
	
	
	public List<Facility> qryFacility(){
		return dao.findAll(Facility.class);
	}
	
	public boolean verifyFacility(int id) {
		return dao.exist(Facility.class, id);
	}
	
	public boolean verifyFacility(String content) {
		return dao.exist(Facility.class, "content",content);
	}

}
