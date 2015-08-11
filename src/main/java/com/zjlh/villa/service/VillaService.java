package com.zjlh.villa.service;


import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.VillaDaoHibernate4;
import com.zjlh.villa.entity.Villa;

@Service
public class VillaService {

	@Autowired
	private VillaDaoHibernate4 dao;
	
/**
 * 	新增别墅
 * @param villa
 * @return
 */
	public int addVilla(Villa villa) {		
		dao.save(villa);
		return villa.getId();
	}
/**
 * 	跟新别墅
 * @param villa
 */
	public void updateVilla(Villa villa) {
		dao.update(villa);
	}
/**
 * 	获取单个别墅
 * @param id
 * @return
 */
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
/**
 * 根据ID删除别墅	
 * @param id
 */
	public void delVilla(int id) {
		dao.delete(Villa.class, id);
	}
	
	public int getPageCount(){
		
		
		return 1;
		
	}
	
/**
 * 分页查询别墅	
 * @param province 省份
 * @param highPrice 最高价
 * @param lowPrice 最低价
 * @param bedroom 卧室数量
 * @param pageNo 页码
 * @param pageSize 每页别墅数量
 * @return
 */
	public List<Villa> qryVilla(String province,String highPrice,String lowPrice,String bedroom, int pageNo,int pageSize){
		
		List<Object> values = new ArrayList<Object>();
		String hql = "From Villa Where 1=1 ";
		int i=0;
		
		if (StringUtils.isNotBlank(province)) {		
			hql += " and province = ?"+String.valueOf(i);
			
			values.add(province);
			i++;
		}
		
		if (StringUtils.isNotBlank(highPrice)) {		
			hql += " and normal_price < ?"+String.valueOf(i);
			
			values.add(province);
			i++;
		}
		if (StringUtils.isNotBlank(lowPrice)) {		
			hql += " and narmal_price > ?"+String.valueOf(i);
			
			values.add(lowPrice);
			i++;
		}
		if (StringUtils.isNotBlank(bedroom)) {		
			hql += " and bedroom = ?"+String.valueOf(i);
			
			values.add(bedroom);
			i++;
		}

		return dao.findByPage(hql, pageNo, pageSize, values);
	}
}







