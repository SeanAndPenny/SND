package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class YljgMcModel implements BaseEntity {
	private String jgdm;//医疗机构代码
	private String jgmc;//机构名称
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
	@Override
	public String toString() {
		return "YljgMcModel [jgdm=" + jgdm + ", jgmc=" + jgmc + "]";
	}
	
}
