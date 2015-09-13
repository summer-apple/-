package com.zjlh.villa.service.util.message.lib.base;

import com.zjlh.villa.service.util.message.entity.DataStore;

public abstract class SenderWapper {

	protected DataStore requestData = new DataStore();

	public abstract ISender getSender();
}
