package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class zyfxModel implements BaseEntity {
 private String yljgdm;
 private String yljgmc;
 private String ryrs;
 private String zyrs;
 private String cyrs;
 private String rq;
 
public String getRq() {
	return rq;
}
public void setRq(String rq) {
	this.rq = rq;
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
public String getRyrs() {
	return ryrs;
}
public void setRyrs(String ryrs) {
	this.ryrs = ryrs;
}
public String getZyrs() {
	return zyrs;
}
public void setZyrs(String zyrs) {
	this.zyrs = zyrs;
}
public String getCyrs() {
	return cyrs;
}
public void setCyrs(String cyrs) {
	this.cyrs = cyrs;
}
 
}
