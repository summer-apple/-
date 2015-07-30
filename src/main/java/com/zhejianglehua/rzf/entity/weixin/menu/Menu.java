package com.zhejianglehua.rzf.entity.weixin.menu;

import javax.persistence.Entity;

@Entity
public class Menu {
	private Button[] button;

	public Button[] getButton() {
		return button;
	}

	public void setButton(Button[] button) {
		this.button = button;
	}
	
}
