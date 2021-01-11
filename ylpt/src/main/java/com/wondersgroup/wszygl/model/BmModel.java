package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class BmModel implements BaseEntity {
	private String bm;
	private String  bmc;
	public String getBm() {
		return bm;
	}
	public void setBm(String bm) {
		this.bm = bm;
	}
	public String getBmc() {
		return bmc;
	}
	public void setBmc(String bmc) {
		this.bmc = bmc;
	}
	
}
