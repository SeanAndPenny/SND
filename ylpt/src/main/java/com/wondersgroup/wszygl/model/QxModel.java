package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class QxModel implements BaseEntity {
  private String orgid;
  private String yljgmc;
  private String yljgdm;
public String getOrgid() {
	return orgid;
}
public void setOrgid(String orgid) {
	this.orgid = orgid;
}
public String getYljgmc() {
	return yljgmc;
}
public void setYljgmc(String yljgmc) {
	this.yljgmc = yljgmc;
}
public String getYljgdm() {
	return yljgdm;
}
public void setYljgdm(String yljgdm) {
	this.yljgdm = yljgdm;
}
  
}
