package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class wdtjModel implements BaseEntity {
	private String wdyw;
	private String wdmc;
	public String getWdyw() {
		return wdyw;
	}
	public void setWdyw(String wdyw) {
		this.wdyw = wdyw;
	}
	public String getWdmc() {
		return wdmc;
	}
	public void setWdmc(String wdmc) {
		this.wdmc = wdmc;
	}
	@Override
	public String toString() {
		return "wdtjModel [wdyw=" + wdyw + ", wdmc=" + wdmc + "]";
	}
	
	 
	

}
