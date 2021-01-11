package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class JcFxModel implements BaseEntity{
	private String yljgdm;
	private String yljgmc;
	private String jcrs;
	private String jclx;
	private String yylb;
	public String getYylb() {
		return yylb;
	}
	public void setYylb(String yylb) {
		this.yylb = yylb;
	}
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public String getJcrs() {
		return jcrs;
	}
	public void setJcrs(String jcrs) {
		this.jcrs = jcrs;
	}
	public String getJclx() {
		return jclx;
	}
	public void setJclx(String jclx) {
		this.jclx = jclx;
	}
	@Override
	public String toString() {
		return "JcFxModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", jcrs=" + jcrs + ", jclx=" + jclx + "]";
	}
	 
}
