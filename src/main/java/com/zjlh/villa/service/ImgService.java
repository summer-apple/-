package com.zjlh.villa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.ImgDaoHibernate4;
import com.zjlh.villa.entity.Img;

@Service
public class ImgService {

	@Autowired
	private ImgDaoHibernate4 dao;
	
	public void addImg(String url){
		Img img = new Img(url);
		dao.save(img);
	}
	
	
	public void addImg(int id){
		dao.delete(Img.class, id);
	}
	
	public boolean verifyImg(int id){
		return dao.exist(Img.class, id);
	}
	
	public boolean verifyImg(String url){
		return dao.exist(Img.class, "url", url);
	}
	
	
	public void delImg(int id) {
		dao.delete(Img.class,id);
	}
	
	public List<Img> qryImg() {
		return dao.findAll(Img.class);
	}
	
}
