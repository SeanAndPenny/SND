package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class JyFxModel implements BaseEntity{
	private String yljgdm;
	private String yljgmc;
	private String jyrs;
	private String jylx;
	private String yylb;
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
	public String getJyrs() {
		return jyrs;
	}
	public void setJyrs(String jyrs) {
		this.jyrs = jyrs;
	}
	public String getJylx() {
		return jylx;
	}
	public void setJylx(String jylx) {
		this.jylx = jylx;
	}
	public String getYylb() {
		return yylb;
	}
	public void setYylb(String yylb) {
		this.yylb = yylb;
	}
	@Override
	public String toString() {
		return "JyFxModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", jyrs=" + jyrs + ", jylx=" + jylx + ", yylb="
				+ yylb + "]";
	}
	
}
