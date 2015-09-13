package com.zjlh.villa.service.util.message.demo;

import com.zjlh.villa.service.util.message.utils.ConfigLoader;
import com.zjlh.villa.service.util.message.config.AppConfig;
import com.zjlh.villa.service.util.message.lib.ADDRESSBOOKMessage;

public class AddressBookMessageUnSubscribe {

	public static void main(String[] args) {

		AppConfig config = ConfigLoader.load(ConfigLoader.ConfigType.Message);
		ADDRESSBOOKMessage addressbook = new ADDRESSBOOKMessage(config);
		addressbook.setAddress("186****1889");
		addressbook.unsubscribe();
	}	
}
