package com.zjlh.villa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.CommentImgDaoHibernate4;
import com.zjlh.villa.dao.ImgDaoHibernate4;
import com.zjlh.villa.dao.VillaImgDaoHibernate4;
import com.zjlh.villa.entity.CommentImg;
import com.zjlh.villa.entity.Img;
import com.zjlh.villa.entity.VillaImg;

@Service
public class ImgService {

	@Autowired
	private ImgDaoHibernate4 dao;
	@Autowired
	private VillaImgDaoHibernate4 vdao;
	@Autowired
	private CommentImgDaoHibernate4 cdao;

	public int addImg(String url) {
		Img img = new Img(url);
		dao.save(img);
		return img.getId();
	}

//	public void addImg(int id) {
//		dao.delete(Img.class, id);
//	}

	public boolean verifyImg(int id) {
		return dao.exist(Img.class, id);
	}

	public boolean verifyImg(String url) {
		return dao.exist(Img.class, "url", url);
	}



	public List<Img> qryImg() {
		return dao.findAll(Img.class);
	}

	
	
	/**
	 * 根据ID获取一张图片
	 * @param id
	 * @return
	 */
		public Img getImg(int id){
			return dao.get(Img.class, id);
		}
		
	/**
	 * 根据ID列表获取图片列表	
	 * @param args
	 * @return
	 */
		public List<Img> getImgByIDs(String[] args){
			List<Img> imglist = new ArrayList<Img>();
			
			for (int i = 0; i < args.length; i++) {
				int id = Integer.parseInt(args[i]);
				Img img = getImg(id);
				imglist.add(img);
			}
			
			return imglist;
		}		
	
	
	
	
	
	
	
	
	
	
	// 以上img

	// 以下villa_img
	/**
	 * 保存单条图片记录
	 * 
	 * @param villaImg
	 */
	public void addVillaImg(VillaImg villaImg) {
		vdao.save(villaImg);
	}
/**
 * 删除别墅图片
 * @param id
 */
	public void delVillaImg(int id) {
		String sql = "DELETE FROM VillaImg WHERE img="+id;
		dao.sql(sql);
		dao.delete(Img.class, id);
	}	
	
	/**
	 * 保存多条图片记录
	 * 
	 * @param array
	 * @param villaid
	 */
	public void addVillaImgList(List<Img> imglist, int villaid) {
		for (int i = 0; i < imglist.size(); i++) {// 遍历服务id
			int imgid = imglist.get(i).getId();
			if (!verifyVillaImg(villaid, imgid)) {// 验证该别墅是否存在该服务
				VillaImg villaImg = new VillaImg(villaid, imgid);// 实例化别墅服务
				addVillaImg(villaImg);// 保存别墅服务
			}
		}
	}

	 /** 更新多条别墅图片记录	
	 * @param imglist
	 * @param villaid
	 */
		public void updateVillaImgList(List<Img> img,int villaid) {
			String sql = "DELETE FROM VillaImg WHERE villa="+villaid;
			vdao.sql(sql);		
			addVillaImgList(img, villaid);
		}	
	
	
	
	/**
	 * 验证单条图片
	 * 
	 * @param villa
	 * @param img
	 * @return
	 */
	public boolean verifyVillaImg(int villa, int img) {
		List<String> keys = new ArrayList<String>();
		keys.add("villa");
		keys.add("img");
		return vdao.exist("VillaImg", keys, villa, img);
	}
	
	
/****************************以下评论图片
 * 
 * 
 * 
 */
/**
 * 保存单条评论图片
 * @param commentImg
 */
	public void addCommentImg(CommentImg commentImg) {
		cdao.save(commentImg);
	}

	
	public void addCommentImgList(List<Img> imglist, int commentid) {
		for (int i = 0; i < imglist.size(); i++) {// 遍历服务id
			int imgid = imglist.get(i).getId();
			
				CommentImg commentImg = new CommentImg(commentid, imgid);// 实例化别墅服务
				addCommentImg(commentImg);// 保存别墅服务
		}
	}
/**
 * 删除评论图片
 * @param id
 */
	public void delCommentImg(int id) {
		String sql = "DELETE FROM CommentImg WHERE img="+id;
		dao.sql(sql);
		dao.delete(Img.class, id);
	}


	
}
