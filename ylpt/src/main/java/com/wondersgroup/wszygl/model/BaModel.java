package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class BaModel implements BaseEntity {
	private String yljgdm;
	private String yljgmc;
	private String jbflbm;
	private String jbflmc;
	private String jbbm;
	private String jbmc;
	private String rs;
	private String ryksbm;
	private String ryksmc;
	
	public String getRyksbm() {
		return ryksbm;
	}
	public void setRyksbm(String ryksbm) {
		this.ryksbm = ryksbm;
	}
	public String getRyksmc() {
		return ryksmc;
	}
	public void setRyksmc(String ryksmc) {
		this.ryksmc = ryksmc;
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
	public String getJbflbm() {
		return jbflbm;
	}
	public void setJbflbm(String jbflbm) {
		this.jbflbm = jbflbm;
	}
	public String getJbflmc() {
		return jbflmc;
	}
	public void setJbflmc(String jbflmc) {
		this.jbflmc = jbflmc;
	}
	public String getJbbm() {
		return jbbm;
	}
	public void setJbbm(String jbbm) {
		this.jbbm = jbbm;
	}
	public String getJbmc() {
		return jbmc;
	}
	public void setJbmc(String jbmc) {
		this.jbmc = jbmc;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	@Override
	public String toString() {
		return "BaModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", jbflbm=" + jbflbm + ", jbflmc=" + jbflmc
				+ ", jbbm=" + jbbm + ", jbmc=" + jbmc + ", rs=" + rs + "]";
	}
	
}
