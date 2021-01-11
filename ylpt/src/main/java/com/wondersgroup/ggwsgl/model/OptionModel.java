package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class OptionModel implements BaseEntity{
 private String ywbz;
 private String wdyw;
 private String zddm;
 private String zdmc;
 private String dm;
 private String mc;
 private String sfsjg;
 
 
public String getSfsjg() {
	return sfsjg;
}
public void setSfsjg(String sfsjg) {
	this.sfsjg = sfsjg;
}
public String getDm() {
	return dm;
}
public void setDm(String dm) {
	this.dm = dm;
}
public String getMc() {
	return mc;
}
public void setMc(String mc) {
	this.mc = mc;
}
public String getYwbz() {
	return ywbz;
}
public void setYwbz(String ywbz) {
	this.ywbz = ywbz;
}
public String getWdyw() {
	return wdyw;
}
public void setWdyw(String wdyw) {
	this.wdyw = wdyw;
}
public String getZddm() {
	return zddm;
}
public void setZddm(String zddm) {
	this.zddm = zddm;
}
public String getZdmc() {
	return zdmc;
}
public void setZdmc(String zdmc) {
	this.zdmc = zdmc;
}
 
}
