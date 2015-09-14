package com.zjlh.villa.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.zjlh.villa.service.MemberService;

@Service
public class BirthdayMessageSender implements  ApplicationListener<ContextRefreshedEvent> {

	
	
	private Timer timer = null;
	
@Autowired
private MemberService ms;



	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 17); // get 和 set 的字段数字，指示一天中的小时。
		calendar.set(Calendar.MINUTE, 30); // get 和 set 的字段数字，指示一小时中的分钟。
											// calendar.set(Calendar.SECOND, 0);
											// get 和 set 的字段数字，指示一分钟中的秒。
		Date time = calendar.getTime(); // 创建一个新计时器，可以指定其相关的线程作为守护程序运行。如果计时器将用于安排重复的“维护活动”，则调用守护线程，在应用程序运行期间必须调用守护线程，但是该操作不应延长程序的生命周期。
		timer = new Timer(true);// 创建一个新计时器，可以指定其相关的线程作为守护程序运行。 //设置任务计划，启动和间隔时间
		timer.schedule(new TimerTask() {
			
			@Override
			public void run() {
				List<String> phoneList = ms.getBirthdayPhoneList();
				if (phoneList.size()>0) {
					ms.sendMessage(phoneList, "WT8BF2", "");
				}
			}
		}, time,  5 * 60 * 1000);// 安排在指定的时间执行指定的任务。执行任务前的延迟时间，单位是毫秒。
	}

}


