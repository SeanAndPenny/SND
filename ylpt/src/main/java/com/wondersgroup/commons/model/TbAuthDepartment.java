package com.wondersgroup.commons.model;

import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;
import com.wondersgroup.api.commons.DateUtils;

@SuppressWarnings("serial")
public class TbAuthDepartment implements BaseEntity {
	private Long depid;
	private String depbm;
	private String depmc;
	public Long getDepid() {
		return depid;
	}
	public void setDepid(Long depid) {
		this.depid = depid;
	}
	public String getDepbm() {
		return depbm;
	}
	public void setDepbm(String depbm) {
		this.depbm = depbm;
	}
	public String getDepmc() {
		return depmc;
	}
	public void setDepmc(String depmc) {
		this.depmc = depmc;
	}
	
	
}