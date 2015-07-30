package com.zhejianglehua.rzf.entity.weixin.po;

import javax.persistence.Entity;

@Entity
public class ImageMessage extends BaseMessage{
	private Image Image;

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}
}
