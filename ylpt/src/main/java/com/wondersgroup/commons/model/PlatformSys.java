package com.wondersgroup.commons.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class PlatformSys implements BaseEntity {
	
	private String id;			
	private String platfromkey;			
	private String platfromname;			
	private String removed;			
	private String url;//跳转url
	private String loginname;//跳转登录名 参数名
	private String password;//跳转密码  参数名（么个平台可能不一样：psw  或者  password 或者 passWord  所以自己要配值）
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPlatfromkey() {
		return platfromkey;
	}
	public void setPlatfromkey(String platfromkey) {
		this.platfromkey = platfromkey;
	}
	public String getPlatfromname() {
		return platfromname;
	}
	public void setPlatfromname(String platfromname) {
		this.platfromname = platfromname;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
		
}