package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class XxymZdModel implements BaseEntity {
	private String mcdm;
	private String mc;
	private String bz;
	private String sfsjg;
	
	public String getSfsjg() {
		return sfsjg;
	}
	public void setSfsjg(String sfsjg) {
		this.sfsjg = sfsjg;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getMcdm() {
		return mcdm;
	}
	public void setMcdm(String mcdm) {
		this.mcdm = mcdm;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}

}
