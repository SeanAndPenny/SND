package com.wondersgroup.commons.model;

import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;
import com.wondersgroup.api.commons.DateUtils;

@SuppressWarnings("serial")
public class TbAuthUnit implements BaseEntity {
	private Long unitid;
	private String unitname;
	private String unitcode;
	private String jgjm;
	private String jgsm;
	private Integer px;
	private Integer jgbz;
	
	private Long resLevel;
	private String treelayer;
	public Long getUnitid() {
		return unitid;
	}
	public void setUnitid(Long unitid) {
		this.unitid = unitid;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getUnitcode() {
		return unitcode;
	}
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	public String getJgjm() {
		return jgjm;
	}
	public void setJgjm(String jgjm) {
		this.jgjm = jgjm;
	}
	public String getJgsm() {
		return jgsm;
	}
	public void setJgsm(String jgsm) {
		this.jgsm = jgsm;
	}
	public Integer getPx() {
		return px;
	}
	public void setPx(Integer px) {
		this.px = px;
	}
	public Integer getJgbz() {
		return jgbz;
	}
	public void setJgbz(Integer jgbz) {
		this.jgbz = jgbz;
	}
	public Long getResLevel() {
		return resLevel;
	}
	public void setResLevel(Long resLevel) {
		this.resLevel = resLevel;
	}
	public String getTreelayer() {
		return treelayer;
	}
	public void setTreelayer(String treelayer) {
		this.treelayer = treelayer;
	}
	
	
}