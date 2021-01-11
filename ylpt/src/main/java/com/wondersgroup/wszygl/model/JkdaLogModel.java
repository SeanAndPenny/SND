package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 健康档案 日志(TB_JKDA_LOG)
 * */
@SuppressWarnings("serial")
public class JkdaLogModel implements BaseEntity {
	private String logid;//			
	private String dyz;//			
	private String orgname;//			
	private String unitname;//			
	private String bdyz;//			
	private String kh;//			
	private String klx;//			
	private String dysj;//			
	private String dyksmc;//			
	private String ysmc;//			
	private String ip;//			
	private String gh;//			
	private String yljgdm;//			
	private String ywlx;//1:调阅；2:查看
	private String loginname;
	private String lnam;
	private String orgcode;
	public String getLogid() {
		return logid;
	}
	public void setLogid(String logid) {
		this.logid = logid;
	}
	public String getDyz() {
		return dyz;
	}
	public void setDyz(String dyz) {
		this.dyz = dyz;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getBdyz() {
		return bdyz;
	}
	public void setBdyz(String bdyz) {
		this.bdyz = bdyz;
	}
	public String getKh() {
		return kh;
	}
	public void setKh(String kh) {
		this.kh = kh;
	}
	public String getKlx() {
		return klx;
	}
	public void setKlx(String klx) {
		this.klx = klx;
	}
	public String getDysj() {
		return dysj;
	}
	public void setDysj(String dysj) {
		this.dysj = dysj;
	}
	public String getDyksmc() {
		return dyksmc;
	}
	public void setDyksmc(String dyksmc) {
		this.dyksmc = dyksmc;
	}
	public String getYsmc() {
		return ysmc;
	}
	public void setYsmc(String ysmc) {
		this.ysmc = ysmc;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getGh() {
		return gh;
	}
	public void setGh(String gh) {
		this.gh = gh;
	}
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getLnam() {
		return lnam;
	}
	public void setLnam(String lnam) {
		this.lnam = lnam;
	}
	public String getOrgcode() {
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	
	

}