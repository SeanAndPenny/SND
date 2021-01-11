package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class PlatLoginModel implements BaseEntity{

	private String operator;
	private String xm;
	private String platform;
	private String attestationtime;
	private String platloginname;
	private String loginnumber;
	private String tabid;
	
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getAttestationtime() {
		return attestationtime;
	}
	public void setAttestationtime(String attestationtime) {
		this.attestationtime = attestationtime;
	}
	public String getPlatloginname() {
		return platloginname;
	}
	public void setPlatloginname(String platloginname) {
		this.platloginname = platloginname;
	}
	public String getLoginnumber() {
		return loginnumber;
	}
	public void setLoginnumber(String loginnumber) {
		this.loginnumber = loginnumber;
	}
	public String getTabid() {
		return tabid;
	}
	public void setTabid(String tabid) {
		this.tabid = tabid;
	}
	
}
