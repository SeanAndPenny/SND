package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class RylbModel implements BaseEntity {
   private String lbdm;
   private String lbmc;
public String getLbdm() {
	return lbdm;
}
public void setLbdm(String lbdm) {
	this.lbdm = lbdm;
}
public String getLbmc() {
	return lbmc;
}
public void setLbmc(String lbmc) {
	this.lbmc = lbmc;
}
   
}
