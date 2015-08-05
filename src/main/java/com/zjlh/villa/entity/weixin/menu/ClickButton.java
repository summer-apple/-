package com.zjlh.villa.entity.weixin.menu;

import javax.persistence.Entity;
 
@Entity
public class ClickButton extends Button{
	private String key;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
}
