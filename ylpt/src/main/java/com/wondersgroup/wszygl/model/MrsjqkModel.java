package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class MrsjqkModel implements BaseEntity {
  private String zwbm;//中文表名
  private String ywbm;//英文表名
  private String dksj;//到库时间
  private  String sl;
  private  String yljgdm;
  private  String yljgmc;
  
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
public String getZwbm() {
	return zwbm;
}
public void setZwbm(String zwbm) {
	this.zwbm = zwbm;
}
public String getYwbm() {
	return ywbm;
}
public void setYwbm(String ywbm) {
	this.ywbm = ywbm;
}
public String getDksj() {
	return dksj;
}
public void setDksj(String dksj) {
	this.dksj = dksj;
}
public String getSl() {
	return sl;
}
public void setSl(String sl) {
	this.sl = sl;
}
@Override
public String toString() {
	return "MrsjqkModel [zwbm=" + zwbm + ", ywbm=" + ywbm + ", dksj=" + dksj + ", sl=" + sl + "]";
}
  
}
