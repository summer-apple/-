package com.zjlh.villa.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.text.StrBuilder;
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
	public Map<String,Object> qryVilla(String province,String highPrice,String lowPrice,String bedroom, int pageNo,int pageSize){
		
		List<Object> values = new ArrayList<Object>();
		String hql = "FROM Villa WHERE 1=1 ";
		//String hql = "FROM Villa  WHERE 1=1 ";
		int i=0;
		StrBuilder sb = new StrBuilder(hql);
		
		if (StringUtils.isNotBlank(province)) {		
			sb.append(" and province = ?"+String.valueOf(i));
			
			values.add(province);
			i++;
		}
		
		if (StringUtils.isNotBlank(highPrice)) {		
			sb.append(" and normal_price < ?"+String.valueOf(i));
			
			values.add(highPrice);
			i++;
		}
		if (StringUtils.isNotBlank(lowPrice)) {		
			sb.append(" and narmal_price > ?"+String.valueOf(i));
			
			values.add(lowPrice);
			i++;
		}
		if (StringUtils.isNotBlank(bedroom)) {		
			sb.append(" and bedroom = ?"+String.valueOf(i));
			values.add(Integer.parseInt(bedroom));
			i++;
		}
		
		sb.append(" order by weight desc");
		List<Villa> list = dao.findByPage(sb.toString(), pageNo, pageSize, values);
		int amount = dao.findCount(sb.toString(), values);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("amount", amount);
		return map;
	}
}







