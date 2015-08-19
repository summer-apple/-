package com.zjlh.villa.service;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.text.StrBuilder;
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
	public List<Svs> qrySvs(String content, String type) {
		
		if (StringUtils.isBlank(content) && StringUtils.isBlank(type)) {
			return dao.findAll(Svs.class);
		}else {
			
			List<Object> values = new ArrayList<Object>();
			
			String hql = "From Svs Where 1=1";
			int i=0;
			StrBuilder sb = new StrBuilder(hql);
			
			if (StringUtils.isNotBlank(content)) {		
				content = "%"+ content +"%";
				sb.append(" and content like ?"+String.valueOf(i));
				values.add(content);
				i++;
			}
			
			if (StringUtils.isNotBlank(type)) {
				sb.append(" and type = ?"+String.valueOf(i));	
				values.add(Integer.parseInt(type));
				i++;
			}
			
			return dao.execute(sb.toString(),values);
		}
	
	}

	/**
	 * 删除单条服务
	 * 
	 * @param id
	 */
	public void delSvs(int id) {
		String sql = "DELETE FROM VillaSvs WHERE svs="+id;
		dao.sql(sql);
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
/**
 * 根据ID获取一项服务
 * @param id
 * @return
 */
	public Svs getSvs(int id){
		return dao.get(Svs.class, id);
	}
	
/**
 * 根据ID列表获取服务列表	
 * @param args
 * @return
 */
	public List<Svs> getSvsByIDs(String[] args){
		List<Svs> svslist = new ArrayList<Svs>();
		
		for (int i = 0; i < args.length; i++) {
			int id = Integer.parseInt(args[i]);
			Svs svs = getSvs(id);
			svslist.add(svs);
		}
		
		return svslist;
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
	public void addVillaSvsList(List<Svs> svslist, int villaid) {
		for (int i = 0; i < svslist.size(); i++) {// 遍历服务id
			int serviceid = svslist.get(i).getId();
			if (!verifyVillaSvs(villaid, serviceid)) {// 验证该别墅是否存在该服务
				VillaSvs villaSvs = new VillaSvs(villaid, serviceid);// 实例化别墅服务
				addVillaSvs(villaSvs);// 保存别墅服务
			}
		}
	}

/**
 * 更新多条别墅服务记录	
 * @param svslist
 * @param villaid
 */
	public void updateVillaSvsList(List<Svs> svslist,int villaid) {
		String sql = "DELETE FROM VillaSvs WHERE villa="+villaid;
		vdao.sql(sql);		
		addVillaSvsList(svslist, villaid);
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
	public List<VillaSvs> qryVillaSvs(int villaid) {
		return vdao.getList(VillaSvs.class,"villa", villaid);
	}

	/**
	 * 删除别墅下的所有服务
	 * 
	 * @param villaid
	 */
	public void delSvsList(int villaid) {
		List<VillaSvs> list = qryVillaSvs(villaid);
		for (int i = 0; i < list.size(); i++) {
			vdao.delete(list.get(i));
		}
	}
}
