package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class YwbpzModel  implements BaseEntity {
  private String zwbm;//中文表名
  private String ywbm;//英文表名
  private String zdm;//字段名
  private String zdlx;//字段类型
  private String zdcd;//字段长度
  private String zdjs;//字段解释
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
public String getZdm() {
	return zdm;
}
public void setZdm(String zdm) {
	this.zdm = zdm;
}
public String getZdlx() {
	return zdlx;
}
public void setZdlx(String zdlx) {
	this.zdlx = zdlx;
}
public String getZdcd() {
	return zdcd;
}
public void setZdcd(String zdcd) {
	this.zdcd = zdcd;
}
public String getZdjs() {
	return zdjs;
}
public void setZdjs(String zdjs) {
	this.zdjs = zdjs;
}
@Override
public String toString() {
	return "YwbpzModel [zwbm=" + zwbm + ", ywbm=" + ywbm + ", zdm=" + zdm + ", zdlx=" + zdlx + ", zdcd=" + zdcd
			+ ", zdjs=" + zdjs + "]";
}
  
}
