package com.zhejianglehua.rzf.service.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MailService {
	private UtilService utilService;
	

	@Autowired
	public void setUtilService(UtilService utilService) {
		this.utilService = utilService;
	}

	
	
	
	public void  registerMail()  {
		
	 
	    System.out.println(utilService.getRandomString(20));
	    
	}
	
	
	
	
	
	
	
}
