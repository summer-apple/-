package com.zjlh.villa.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.text.StrBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.StoreDaoHibernate4;
import com.zjlh.villa.entity.Store;

@Service
public class StoreService {

	@Autowired
	private StoreDaoHibernate4 dao;
	
/**
 * 	新增商户
 * @param store
 * @return
 */
	public int addStore(Store store) {	
		if (!verifyStore(store.getName())) {
			dao.save(store);
			return store.getId();
		}else {
			return 0;
		}
		
	}
/**
 * 	跟新商户
 * @param store
 */
	public boolean updateStore(Store store) {
		if (verifyStore(store.getId())) {
			dao.update(store);
			return true;
		}else {
			return false;
		}
	}
/**
 * 	获取单个商户
 * @param id
 * @return
 */
	public Store getStore(int id) {
		return dao.get(Store.class, id);
	}

/**
 * 判断否有相同名称的商户
 * @param name
 * @return
 */
	public boolean verifyStore(String name) {		
		List<String> keys = new ArrayList<String>();
		keys.add("name");
		return dao.exist("Store", keys, name);
	}
/**
 * 根据ID判断商户是否存在	
 * @param id
 * @return
 */
	public boolean verifyStore(int id){
		return dao.exist(Store.class, id);
	}
/**
 * 根据ID删除商户	
 * @param id
 */
	public void delStore(int id) {
		dao.delete(Store.class, id);
	}
	
/**
 * 分页查询商户
 * @param province 省份
 * @param name 商户名称
 * @param id 商户ID
 * @param pageNo 页码
 * @param pageSize 每页商户数量
 * @return
 */
	public Map<String,Object> qryStore(String address,String name,String id, int pageNo,int pageSize){
		
		List<Object> values = new ArrayList<Object>();
		String hql = "FROM Store WHERE 1=1 ";
		int i=0;
		StrBuilder sb = new StrBuilder(hql);
		
		if (StringUtils.isNotBlank(address)) {		
			sb.append(" and address like ?"+String.valueOf(i));
			
			values.add("%"+address+"%");
			i++;
		}
		
		if (StringUtils.isNotBlank(name)) {		
			sb.append(" and name like ?"+String.valueOf(i));
			name = "%"+name+"%";
			values.add(name);
			i++;
		}
		if (StringUtils.isNotBlank(id)) {		
			sb.append(" and id like ?"+String.valueOf(i));
			id = "%"+id+"%";
			values.add(id);
			i++;
		}
		
		List<Store> list = dao.findByPage(sb.toString(), pageNo, pageSize, values);
		long amount = dao.findCount("SELECT COUNT(*) "+sb.toString(), values);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("amount", amount);
		return map;
		
	}
}







