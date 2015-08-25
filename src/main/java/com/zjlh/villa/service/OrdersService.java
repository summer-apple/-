package com.zjlh.villa.service;

import java.text.SimpleDateFormat;
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
	 * 
	 * @param order
	 * @return 订单ID
	 */
	public Orders createOrder(Orders orders) {

		Date order_time = new Date();
		orders.setOederTime(order_time);
		dao.save(orders);
		return orders;

	}

	/**
	 * 支付成功，更改状态为已支付
	 * 
	 * @param orderid
	 */

	public void paidSuccess(int orderid) {
		Orders orders = dao.get(Orders.class, orderid);
		orders.setState(1);
		dao.update(orders);
	}

	/**
	 * 
	 * @param date1
	 *            开始日期
	 * @param date2
	 *            结束日期
	 * @param period1
	 *            开始时段
	 * @param period2
	 *            结束时段
	 * @param normalPrice
	 *            普通价格
	 * @param specialPrice
	 *            特殊价格
	 * @return
	 */
	public double calculate(Date date1, Date date2, int period1, int period2,
			double normalPrice, double specialPrice) {
		/**
		 * a 日期差  //b 时段差  //总时段数 c = 2a + b + 1  //总天数 d = a+1
		 */
		int a, b, c, d;
		// double normalPrice = 100.00;
		// double specialPrice = 200.00;
		double price;
		double amount = 0.00;
		// Date date1 = new Date();
		// Date date2 = new Date(date1.getTime() + 0 * 24 * 60 * 60 * 1000);
		// int period1 = 0;
		// int period2 = 1;
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("EEEE");
		String week1 = sdf2.format(date1);
		String week2 = sdf2.format(date2);
		System.out.println("start: " + sdf1.format(date1) + " " + week1);
		System.out.println("start: " + period1);
		System.out.println();
		System.out.println("end week: " + sdf1.format(date2) + " " + week2);
		System.out.println("end period: " + period2);
		System.out.println();
		a = (int) ((date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000));// 间隔天数
		d = a + 1;// 总天数
		b = Math.abs(period1 - period2);// 间隔时段
		if (period1 == 0) {
			c = 2 * a + b + 1;
		} else {
			c = 2 * a + b - 1;
		}
		System.out.println("a=" + a);
		System.out.println("b=" + b);
		System.out.println("c=" + c);
		for (int i = 1; i <= d; i++) {// 循环每一天
			Date today = new Date(date1.getTime() + (24 * 60 * 60 * 1000)
					* (i - 1));// 当前计算的日期
			String w = (sdf2.format(today));// 当前星期
			System.out.println(w + " " + sdf1.format(today) + " i=" + i);
			if (w.equals("星期五") || w.equals("星期六") || w.equals("星期日")) {
				price = specialPrice; // special price
			} else {
				price = normalPrice;
			}
			if (i == 1) {
				if (i == d) {// 是第一天，也是最后一天
					if (period1 == 0) {// 上午开始
						if (period2 == 0) {// 上午开始，上午结束计算一场
							amount += price;
						} else {// 上午开始，下午结束计算两场
							amount += price * 2;
						}
					} else {// 下午开始，计算一场
						amount += price;
					}
				} else {// 是第一天，不是最后一天
					if (period1 == 0) {// 上午开始
						amount += price * 2;
					} else {
						amount += price;
					}
				}
			} else {
				if (i == d) {// 不是第一天，是最后一天
					if (period2 == 0) {// 上午结束，计算一场
						amount += price;
					} else {// 下午结束，计算两场
						amount += price * 2;
					}
				} else {// 不是第一天，不是最后一天
					amount += price * 2;
				}
			}
			System.out.println(amount);
		}
		return amount;
	}

}
