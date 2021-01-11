package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class TjxxDetailModel implements BaseEntity{
	private String ksmc;
	private String xmmc;
	private String xmjcjg;
	private String sfyc;
	public String getKsmc() {
		return ksmc;
	}
	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getXmjcjg() {
		return xmjcjg;
	}
	public void setXmjcjg(String xmjcjg) {
		this.xmjcjg = xmjcjg;
	}
	public String getSfyc() {
		return sfyc;
	}
	public void setSfyc(String sfyc) {
		this.sfyc = sfyc;
	}
	
}
