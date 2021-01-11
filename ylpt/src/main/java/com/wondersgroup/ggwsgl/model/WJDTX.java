package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class WJDTX implements BaseEntity{
	private String sjhm;
	private String dxnr;
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	public String getDxnr() {
		return dxnr;
	}
	public void setDxnr(String dxnr) {
		this.dxnr = dxnr;
	}
	@Override
	public String toString() {
		return "WJDTX [sjhm=" + sjhm + ", dxnr=" + dxnr + "]";
	}
	
	
	

}
