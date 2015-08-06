package com.zjlh.villa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.ServiceDaoHibernate4;

@Service
public class ServiceService {
	@Autowired
	private ServiceDaoHibernate4 dao;

	public void addService(com.zjlh.villa.entity.Service service) {
			dao.save(service);
	}// addService end

	public void delService(int id) {
			dao.delete(com.zjlh.villa.entity.Service.class,id);
	}//delService end
	
	
	public List<com.zjlh.villa.entity.Service> qryService(){
		return dao.findAll(com.zjlh.villa.entity.Service.class);
	}
	
	
	public boolean verifyService(int id){
		return dao.exist(com.zjlh.villa.entity.Service.class, id);
	}
	
	public boolean verifyService(String content){
		return dao.exist(com.zjlh.villa.entity.Service.class, "content",content);
	}

}
