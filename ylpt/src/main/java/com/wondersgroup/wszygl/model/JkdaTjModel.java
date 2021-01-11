package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 健康档案 日志统计 
 */
@SuppressWarnings("serial")
public class JkdaTjModel implements BaseEntity {
	private String days;
	private String zsum;
	private String dy;
	private String ck;
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getDy() {
		return dy;
	}
	public void setDy(String dy) {
		this.dy = dy;
	}
	public String getCk() {
		return ck;
	}
	public void setCk(String ck) {
		this.ck = ck;
	}
	public String getZsum() {
		return zsum;
	}
	public void setZsum(String zsum) {
		this.zsum = zsum;
	}
	
	

}