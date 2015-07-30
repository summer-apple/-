package com.zhejianglehua.rzf.entity.weixin.po;

import javax.persistence.Entity;

@Entity
public class AccessToken {
	private String token;
	private long expiresTime;//失效时间，不再是微信服务器返回的7200秒有效时间
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public long getExpiresTime() {
		return expiresTime;
	}
	public void setExpiresTime(long expiresTime) {
		this.expiresTime = expiresTime;
	}
	
}
