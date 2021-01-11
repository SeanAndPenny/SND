package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class TbModel implements BaseEntity{
	private String jgmc;
	private String jgdm;
	private String rs;
	private String ypzl;
	public String getJgmc() {
		return jgmc;
	}
	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}
	public String getJgdm() {
		return jgdm;
	}
	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getYpzl() {
		return ypzl;
	}
	public void setYpzl(String ypzl) {
		this.ypzl = ypzl;
	}
	
}
