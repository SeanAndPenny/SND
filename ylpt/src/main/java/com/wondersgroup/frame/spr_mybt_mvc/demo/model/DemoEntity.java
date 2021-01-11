package com.wondersgroup.frame.spr_mybt_mvc.demo.model;

import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;
import com.wondersgroup.api.commons.DateUtils;

@SuppressWarnings("serial")
public class DemoEntity implements BaseEntity {

	private String id;
	private String demoname;
	private Date demoDate;

	public DemoEntity() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDemoname() {
		return demoname;
	}

	public void setDemoname(String demoname) {
		this.demoname = demoname;
	}

	public String getDemoDateStr() {
		return DateUtils.format(this.demoDate);
	}

	public void setDemoDateStr(String demoDate) {
		this.demoDate = DateUtils.parse(demoDate);
	}

	public Date getDemoDate() {
		return demoDate;
	}

	public void setDemoDate(Date demoDate) {
		this.demoDate = demoDate;
	}

}