package com.zjlh.villa.service;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.SvsDaoHibernate4;
import com.zjlh.villa.dao.VillaSvsDaoHibernate4;
import com.zjlh.villa.entity.Svs;
import com.zjlh.villa.entity.VillaSvs;

@Service
public class SvsService {
	@Autowired
	private SvsDaoHibernate4 dao;
	@Autowired
	private VillaSvsDaoHibernate4 vdao;

	/**
	 * 添加别墅
	 * 
	 * @param svs
	 */
	public void addSvs(Svs svs) {
		dao.save(svs);
	}

	/**
	 * 根据内容和类型查找
	 * 
	 * @param content
	 * @param type
	 * @return
	 */
	public List<Svs> qrySvs(String content, int type) {
		
		if (StringUtils.isBlank(content) && type==9) {
			return dao.findAll(Svs.class);
		}else {
			
			List<String> keys = new ArrayList<String>();
			List<Object> values = new ArrayList<Object>();
			
			String hql = "From Svs Where 1=1";
			int i=0;
			
			if (StringUtils.isNotBlank(content)) {		
				content = "%"+ content +"%";
				hql += " and content like ?"+String.valueOf(i);
				keys.add("content");
				values.add(content);
				i++;
			}
			
			if (type!=9) {
				hql += " and type = ?"+String.valueOf(i);
				keys.add("type");
				values.add(type);
				i++;
			}
			
			return dao.execute(hql, keys,values);
		}
	
	}

	/**
	 * 删除单条服务
	 * 
	 * @param id
	 */
	public void delSvs(int id) {
		dao.delete(Svs.class, id);
	}

	/**
	 * 根据ID验证服务是否存在
	 * 
	 * @param id
	 * @return
	 */
	public boolean verifySvs(int id) {
		return dao.exist(Svs.class, id);
	}

	/**
	 * 根据内容验证服务是否存在
	 * 
	 * @param content
	 * @return
	 */
	public boolean verifySvs(String content) {
		return dao.exist(Svs.class, "content", content);
	}

	// 以上svs

	// 以下villa_svs

	/**
	 * 保存单条别墅记录
	 * 
	 * @param villaSvs
	 */
	public void addVillaSvs(VillaSvs villaSvs) {
		vdao.save(villaSvs);
	}

	/**
	 * 保存多条别墅记录
	 * 
	 * @param array
	 * @param villaid
	 */
	public void addVillaSvslist(JSONArray array, int villaid) {
		for (int i = 0; i < array.size(); i++) {// 遍历服务id
			int serviceid = (int) array.get(i);
			if (!verifyVillaSvs(villaid, serviceid)) {// 验证该别墅是否存在该服务
				VillaSvs villaSvs = new VillaSvs(villaid, serviceid);// 实例化别墅服务
				addVillaSvs(villaSvs);// 保存别墅服务
			}
		}
	}

	/**
	 * 根据别墅ID和服务ID判断是否存在
	 * 
	 * @param villa
	 * @param svs
	 * @return
	 */
	public boolean verifyVillaSvs(int villa, int svs) {
		List<String> keys = new ArrayList<String>();
		keys.add("villa");
		keys.add("svs");
		return vdao.exist("VillaSvs", keys, villa, svs);
	}

	/**
	 * 查找该别墅的所有服务
	 * 
	 * @param villaid
	 * @return
	 */
	public List<Svs> qrySvs(int villaid) {
		return dao.find("Svs", new String[] { "villa" }, villaid);
	}

	/**
	 * 删除别墅下的所有服务
	 * 
	 * @param villaid
	 */
	public void delSvsList(int villaid) {
		List<Svs> list = qrySvs(villaid);
		for (int i = 0; i < list.size(); i++) {
			dao.delete(list.get(i));
		}
	}
}
