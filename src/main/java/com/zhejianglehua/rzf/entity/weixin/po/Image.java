package com.zhejianglehua.rzf.entity.weixin.po;

import javax.persistence.Entity;

@Entity
public class Image {
	private String MediaId;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
}
