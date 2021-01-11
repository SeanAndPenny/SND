package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class PlatLoginDetailModel implements BaseEntity{

	private String platloginname;
	private String logintime;
	
	public String getPlatloginname() {
		return platloginname;
	}
	public void setPlatloginname(String platloginname) {
		this.platloginname = platloginname;
	}
	public String getLogintime() {
		return logintime;
	}
	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}
	
}
