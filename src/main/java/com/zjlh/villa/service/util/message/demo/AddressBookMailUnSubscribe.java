package com.zjlh.villa.service.util.message.demo;

import com.zjlh.villa.service.util.message.utils.ConfigLoader;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.ADDRESSBOOKMail;

public class AddressBookMailUnSubscribe {

	public static void main(String[] args) {

		AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Mail);
		ADDRESSBOOKMail addressbook = new ADDRESSBOOKMail(config);
		addressbook.setAddress("leo@apple.cn", "leo");
		addressbook.unsubscribe();
	}	
}
