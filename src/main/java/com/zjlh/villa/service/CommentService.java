package com.zjlh.villa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.CommentDaoHibernate4;
import com.zjlh.villa.entity.Comment;

@Service
public class CommentService {

	@Autowired
	private CommentDaoHibernate4 dao;
	
/**
 * 添加评论	
 * @param comment
 * @return
 */
	public int addComment(Comment comment) {
		dao.save(comment);
		return comment.getId();
	}
	
/**
 * 查询订单的所有评论	
 * @param orderid
 * @return
 */
	public List<Comment> qryComment(int orderid) {
		String hql = "FROM Comment WHERE order="+orderid;
		return dao.find(hql);
	}
	

	public void delCommentByOrder(int orderid) {
		String sql = "DELETE FROM Comment WHERE order="+orderid;
		dao.sql(sql);
	}

	
	
}
