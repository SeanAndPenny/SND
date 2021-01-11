package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class JcModel implements BaseEntity {
	 private String rs;//人数
	 private String sfws;//是否外送
	 private String yljgdm;//机构代码
	 private String yljgmc;//机构名称
	 private String lbmc;//类别名称
	 private String brxb;//病人性别
	 private String brxm;//病人姓名
	 private String sqks;//科室代码
	 private String sqksmc;//科室名称
	 private String jcmc;//检查名称 
	 private String bglsh;//报告流水号
	 private String jch;//检查号
	 private String  bgrxm;//报告人姓名
	 
	 
	public String getBgrxm() {
		return bgrxm;
	}
	public void setBgrxm(String bgrxm) {
		this.bgrxm = bgrxm;
	}
	public String getSqks() {
		return sqks;
	}
	public void setSqks(String sqks) {
		this.sqks = sqks;
	}
	public String getBglsh() {
		return bglsh;
	}
	public void setBglsh(String bglsh) {
		this.bglsh = bglsh;
	}
	public String getJch() {
		return jch;
	}
	public void setJch(String jch) {
		this.jch = jch;
	}
	public String getBrxb() {
		return brxb;
	}
	public void setBrxb(String brxb) {
		this.brxb = brxb;
	}
	public String getBrxm() {
		return brxm;
	}
	public void setBrxm(String brxm) {
		this.brxm = brxm;
	}
	public String getSqksmc() {
		return sqksmc;
	}
	public void setSqksmc(String sqksmc) {
		this.sqksmc = sqksmc;
	}
	public String getJcmc() {
		return jcmc;
	}
	public void setJcmc(String jcmc) {
		this.jcmc = jcmc;
	}
	public String getLbmc() {
		return lbmc;
	}
	public void setLbmc(String lbmc) {
		this.lbmc = lbmc;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getSfws() {
		return sfws;
	}
	public void setSfws(String sfws) {
		this.sfws = sfws;
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
	 
}
