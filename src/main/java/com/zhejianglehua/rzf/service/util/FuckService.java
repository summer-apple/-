package com.zhejianglehua.rzf.service.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FuckService {

	private MailService mailService;

	@Autowired
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}

	public void fuck() {
		mailService.registerMail();
	}

}