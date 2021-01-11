package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 处方点评
 * */
@SuppressWarnings("serial")
public class Cfdp implements BaseEntity {
	private String yljgdm;
	private String cfbh;
	private String cfmxh;
	private String cfdpnr;
	private String hgbz;
	private String type;
	private String id;
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getCfbh() {
		return cfbh;
	}
	public void setCfbh(String cfbh) {
		this.cfbh = cfbh;
	}
	public String getCfmxh() {
		return cfmxh;
	}
	public void setCfmxh(String cfmxh) {
		this.cfmxh = cfmxh;
	}
	public String getCfdpnr() {
		return cfdpnr;
	}
	public void setCfdpnr(String cfdpnr) {
		this.cfdpnr = cfdpnr;
	}
	public String getHgbz() {
		return hgbz;
	}
	public void setHgbz(String hgbz) {
		this.hgbz = hgbz;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
}