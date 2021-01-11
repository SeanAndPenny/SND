package com.wondersgroup.commons.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class LogsModel implements BaseEntity {
	private String id;//id
	private String name;//系统名字
	private String days;//统计时间
	private String cs;//登录次数
	private String removed;//删除标志
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getCs() {
		return cs;
	}
	public void setCs(String cs) {
		this.cs = cs;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	
}