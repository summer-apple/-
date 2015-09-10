package com.zjlh.villa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.CommentDaoHibernate4;
import com.zjlh.villa.entity.Comment;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.Svs;

@Service
public class CommentService {

	@Autowired
	private CommentDaoHibernate4 dao;
	@Autowired
	private OrdersService os;

/**
 * 分页查询评价	
 * @param pageNo
 * @param pageSize
 * @return
 */
	public Map<String, Object> qryComment(int pageNo,int pageSize) {
		List<Comment> list = dao.findByPage("FROM Comment ORDER BY id DESC", pageNo, pageSize);
		long amount = dao.findCount("SELECT COUNT(*) FROM Comment");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("amount", amount/pageSize+1);
		return map;
	}
	
	
	
	
/**
 * 添加评论	
 * @param comment
 * @return
 */
	public int addComment(Comment comment) {
		dao.save(comment);
		os.commented(comment.getOrderid());
		return comment.getId();
	}

	
/**
 * 根据订单号检验评论是否存在
 * @param orderid
 * @return
 */
	public boolean verifyComment(int orderid) {
		return dao.exist(Comment.class, "orderid", orderid);
	}
/**
 * 查询别墅的所有评论	
 * @param orderid
 * @return
 */
	public List<Comment> qryComment(int villaid) {
		String hql = "FROM Comment WHERE villa="+villaid+"  ORDER BY comment_day DESC";
		return dao.find(hql);
	}
	
/**
 * 根据订单删除评论
 * @param orderid
 */
	public void delCommentByOrder(int orderid) {
		String sql = "DELETE FROM Comment WHERE order="+orderid;
		dao.sql(sql);
	}

/**
 * 删除单条评论	
 */
	public void delComment(int id) {
		String sql = "DELETE FROM CommentImg WHERE comment="+id;
		dao.sql(sql);
		dao.delete(Comment.class, id);
	}
}
