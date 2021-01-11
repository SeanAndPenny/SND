package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class SjscInfo implements BaseEntity{
	private String id;
	private String jgdm;
	private String jgmc;
	private String tabname;
	private String dataTime;
	private Integer scl;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgdm() {
		return jgdm;
	}

	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}

	public String getJgmc() {
		return jgmc;
	}

	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}

	public String getTabname() {
		return tabname;
	}

	public void setTabname(String tabname) {
		this.tabname = tabname;
	}

	public Integer getScl() {
		return scl;
	}

	public void setScl(Integer scl) {
		this.scl = scl;
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}
	
}
