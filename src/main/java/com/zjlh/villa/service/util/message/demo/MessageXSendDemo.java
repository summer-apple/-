package com.zjlh.villa.service.util.message.demo;

import com.zjlh.villa.service.util.message.utils.ConfigLoader;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.MESSAGEXsend;

public class MessageXSendDemo {

	public static void main(String[] args) {
		AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
		MESSAGEXsend submail = new MESSAGEXsend(config);
		submail.addTo("15757135741");
		submail.setProject("UHIom3");
		submail.addVar("code", "hello you ~");
		submail.xsend();
	}	
}
