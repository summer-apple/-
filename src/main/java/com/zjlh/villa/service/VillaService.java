package com.zjlh.villa.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.VillaDaoHibernate4;
import com.zjlh.villa.entity.Villa;

@Service
public class VillaService {

	@Autowired
	private VillaDaoHibernate4 dao;
	
	
	public int addVilla(Villa villa) {		
		dao.save(villa);
		return villa.getId();
	}
	
	public void editVilla(Villa villa) {
		dao.update(villa);
	}
	
	public Villa getVilla(int id) {
		return dao.get(Villa.class, id);
	}
/**
 * 查询同名别墅	
 * @param name
 * @return
 */
	public List<Villa> findVillaByName(String name) {
		return dao.find("Villa", "name", name);
	}
/**
 * 判断同一商家是否有相同名称的别墅
 * @param store
 * @param name
 * @return
 */
	public boolean verifyVilla(int store,String name) {		
		List<String> keys = new ArrayList<String>();
		keys.add("store");
		keys.add("name");
		
		return dao.exist("Villa", keys, store,name);
	}
/**
 * 根据ID判断别墅是否存在	
 * @param id
 * @return
 */
	public boolean verifyVilla(int id){
		return dao.exist(Villa.class, id);
	}
	
	public void delVilla(int id) {
		dao.delete(Villa.class, id);
	}
	
	
}
