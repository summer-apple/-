package com.zjlh.villa.service;

import java.beans.IntrospectionException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;

import org.apache.http.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.zjlh.villa.dao.OrdersDaoHibernate4;
import com.zjlh.villa.entity.Orders;
import com.zjlh.villa.entity.Villa;
import com.zjlh.villa.entity.weixin.po.PayParam;
import com.zjlh.villa.entity.weixin.po.PrePayReturn;
import com.zjlh.villa.service.util.AlgorithmService;
import com.zjlh.villa.service.util.MapToBean;
import com.zjlh.villa.service.util.WeixinUtilService;
import com.zjlh.villa.test.MyXppDriver;

import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.text.StrBuilder;
@Service
public class OrdersService {

	@Autowired
	private OrdersDaoHibernate4 dao;
	@Autowired
	private AlgorithmService algorithm;
	@Autowired
	private WeixinUtilService weixinUtilService;
	@Autowired
	private MapToBean mapToBean;
	@Autowired
	private CommentService cs;
	
	private static final String KEY = "zhejianglehuazhejianglehuaonegoo";
	private static final String APPID = "wxdbc2bbdebe5808ab";
	private static final String MCH_ID = "1241486402";
	private static final String UNIFIEDORDER = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	private static final String CDATAPREFIX = "<![CDATA[";   
	private static final String CDATABACKFIX = "]]>";   
	
	/**
	 * 生成订单
	 * 
	 * @param order
	 * @return 订单ID
	 * @throws IOException 
	 * @throws ParseException 
	 * @throws IntrospectionException 
	 * @throws InvocationTargetException 
	 * @throws InstantiationException 
	 * @throws IllegalAccessException 
	 */
	public PrePayReturn createOrder(Orders orders,String ip) throws ParseException, IOException, IllegalAccessException, InstantiationException, InvocationTargetException, IntrospectionException {

		dao.save(orders);
		
		
		Map<String,String> params = setPrePayParam(orders, ip);//所有需要的参数，包括sign

		PayParam payParam  = (PayParam) mapToBean.convertMap(PayParam.class, params);
		

		payParam.setAppid(CDATAPREFIX+ payParam.getAppid() +CDATABACKFIX);
		payParam.setBody(CDATAPREFIX+ payParam.getBody() +CDATABACKFIX);
		payParam.setMch_id(CDATAPREFIX+ payParam.getMch_id() +CDATABACKFIX);
		payParam.setNonce_str(CDATAPREFIX+ payParam.getNonce_str() +CDATABACKFIX);
		payParam.setNotify_url(CDATAPREFIX+ payParam.getNotify_url() +CDATABACKFIX);
		payParam.setOut_trade_no(CDATAPREFIX+ payParam.getOut_trade_no()+CDATABACKFIX);
		payParam.setSign(CDATAPREFIX+ payParam.getSign() +CDATABACKFIX);
		payParam.setSpbill_create_ip(CDATAPREFIX+ payParam.getSpbill_create_ip() +CDATABACKFIX);
		payParam.setTotal_fee(CDATAPREFIX+ payParam.getTotal_fee() +CDATABACKFIX);
		payParam.setTrade_type(CDATAPREFIX+ payParam.getTrade_type() +CDATABACKFIX);
		payParam.setOpenid(CDATAPREFIX+ payParam.getOpenid() +CDATABACKFIX);
		

		
		XStream xstream = new XStream(new MyXppDriver()); 
		
		xstream.alias("xml", payParam.getClass());
		
System.out.println(xstream.toXML(payParam).replace("__", "_"));
		
		//请求预支付接口
		String result = weixinUtilService.post(UNIFIEDORDER,xstream.toXML(payParam).replace("__", "_"));
System.out.println(result);
		//格式化返回数据
		XStream xStream2 = new XStream(new DomDriver());
		xStream2.alias("xml", PrePayReturn.class);
		PrePayReturn prePayReturn = (PrePayReturn) xStream2.fromXML(result);
		
		
		
		
		//设置ID
		prePayReturn.setOrderid(orders.getOpenid());
		
		//设置时间戳
		String timestamp = Long.toString(new Date().getTime()/1000);
		prePayReturn.setTimestamp(timestamp);
		
System.out.println(timestamp);		
		
		prePayReturn.setSign(getPaySign(prePayReturn));
System.out.println(prePayReturn.getSign());
		return prePayReturn;
		
		

	}
	
	
	
		/**
	 * 组装参数
	 * @param orders
	 * @param ip
	 * @return
	 */
	public Map<String, String> setPrePayParam(Orders orders,String ip) {
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("appid", APPID);
		params.put("mch_id", MCH_ID);
		params.put("nonce_str", algorithm.getRandomString(32));
		params.put("trade_type", "JSAPI");		
		params.put("body", orders.getVillaName());
		
		params.put("out_trade_no", orders.getId()+"");
		
		
		int i=(int)(orders.getMoney()*100/2);
		
		params.put("total_fee",i+"");
		params.put("spbill_create_ip", ip);
		params.put("notify_url", "http://gmcfe.tunnel.mobi/villa/order/notify");
		params.put("openid", orders.getOpenid());
		
		String sign = getSign(params);
		
		
		params.put("sign", sign);
		
		return params;
		
	}
	
	public String getPaySign(PrePayReturn prePayReturn) {
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("appId", prePayReturn.getAppid());
		params.put("timeStamp", prePayReturn.getTimestamp());
		params.put("nonceStr", prePayReturn.getNonce_str());
		params.put("package", "prepay_id="+prePayReturn.getPrepay_id());
		params.put("signType", "MD5");
		
		return getSign(params);

	}

	
	/**
	 * 生成签名
	 */
	public String getSign(Map<String, String> params) {
		
		
		
		
		//排序
		 Set<String> keysSet = params.keySet();
	        Object[] keys = keysSet.toArray();
	        Arrays.sort(keys);
	        StringBuffer temp = new StringBuffer();
	        boolean first = true;
	        for (Object key : keys) {
	            if (first) {
	                first = false;
	            } else {
	                temp.append("&");
	            }
	            temp.append(key).append("=");
	            Object value = params.get(key);
	            String valueString = "";
	            if (null != value) {
	                valueString = value.toString();
	            }
	            temp.append(valueString);
	        }
	        
	        String StringA = temp.toString();
	       
	        
	      //拼接API秘钥
	        String stringSignTemp=StringA+"&key="+KEY;
	        String  sign = algorithm.getMD5(stringSignTemp).toUpperCase();
	        
		
		
		return sign;
	}
	
	

	
	

	/**
	 * 支付成功，更改状态为已支付
	 * 
	 * @param orderid
	 */

	public void paidSuccess(int orderid) {
		Orders orders = dao.get(Orders.class, orderid);
		orders.setState(1);
		orders.setPayTime(new Date());
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
	public String calculate(Date date1, Date date2, int period1, int period2,
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
		return new java.text.DecimalFormat("#.00").format(amount);
	}
	
	
	public Map<String, Object> qryOrder(String id,String orderTimeStart,String orderTimeEnd,String useTimeStart,String useTimeEnd,String state,int pageNo,int pageSize ){
		
		List<Object> values = new ArrayList<Object>();
		String hql = "FROM Orders WHERE 1=1 ";
		
		int i=0;
		StrBuilder sb = new StrBuilder(hql);
		
		
		if (StringUtils.isNotBlank(id)) {		
			sb.append(" and id = ?"+String.valueOf(i));
			
			values.add(Integer.parseInt(id));
			i++;
		}
		
		if (StringUtils.isNotBlank(orderTimeStart)) {		
			sb.append(" and  order_time >= ?"+String.valueOf(i));
			
			values.add(orderTimeStart+" 00:00:00");
			i++;
		}
		
		if (StringUtils.isNotBlank(orderTimeEnd)) {		
			sb.append(" and  order_time <= ?"+String.valueOf(i));
			
			values.add(orderTimeEnd+" 23:59:59");
			i++;
		}
		
		if (StringUtils.isNotBlank(useTimeStart)) {		
			sb.append(" and  start_day >= ?"+String.valueOf(i));
			
			values.add(useTimeStart+" 00:00:00");
			i++;
		}
		
		if (StringUtils.isNotBlank(useTimeEnd)) {		
			sb.append(" and  end_day <= ?"+String.valueOf(i));
			
			values.add(useTimeEnd+" 23:59:59");
			i++;
		}
		
		if (StringUtils.isNotBlank(state)) {		
			sb.append(" and state = ?"+String.valueOf(i));
			
			values.add(Integer.parseInt(state));
			i++;
		}
		
		sb.append(" order by id");
		
		List<Orders> list = dao.findByPage(sb.toString(), pageNo, pageSize, values);
		long amount = dao.findCount("SELECT COUNT(*) "+sb.toString(), values);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("amount", amount/pageSize+1);
		return map;
	}

	public Map<String, Object> qryOrderByMember(int memberid,int pageNo,int pageSize) {
		List<Object> values = new ArrayList<Object>();
		String hql = "FROM Orders o WHERE 1=1 ";
		
		int i=0;
		StrBuilder sb = new StrBuilder(hql);
		
		sb.append(" and o.member = ?"+String.valueOf(i));
		values.add(memberid);
		
		sb.append(" and o.state>0 order by o.id desc");
		
		List<Orders> list = dao.findByPage(sb.toString(), pageNo, pageSize,values);
		long amount = dao.findCount("SELECT COUNT(*) "+sb.toString(), values);
		Map<String,Object> map = new HashMap<String, Object>();
		if (amount==0) {
			map.put("amount", 0);
		}else if (amount <= pageSize) {
			map.put("amount", 1);
		}else {
			map.put("amount", amount/pageSize+1);
		}
		map.put("list", list);
		return map;
	}
	
	
	public void delOrder(int id) {
		cs.delCommentByOrder(id);
		dao.delete(Orders.class, id);
	}
	
	public void complete(int id) {
		Orders orders = dao.get(Orders.class, id);
		orders.setState(2);
		dao.update(orders);
	}
	public void commented(int id) {
		Orders orders = dao.get(Orders.class, id);
		orders.setState(3);
		dao.update(orders);
	}
}
