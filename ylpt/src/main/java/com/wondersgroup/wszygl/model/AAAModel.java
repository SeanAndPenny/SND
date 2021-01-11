package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class AAAModel implements BaseEntity {
	private String yw;
	private String zw;
	public String getYw() {
		return yw;
	}
	public void setYw(String yw) {
		this.yw = yw;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	
}
