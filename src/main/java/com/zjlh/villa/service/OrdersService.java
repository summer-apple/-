package com.zjlh.villa.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjlh.villa.dao.OrdersDaoHibernate4;
import com.zjlh.villa.entity.Orders;

@Service
public class OrdersService {

	@Autowired
	private OrdersDaoHibernate4 dao;

	
/**
 * 生成订单
 * @param order
 * @return 订单ID
 */
	public int  createOrder(Orders order){
		
		Date order_time = new Date();
		order.setOederTime(order_time);
		dao.save(order);
		return order.getId();
		
	}	
	
}
