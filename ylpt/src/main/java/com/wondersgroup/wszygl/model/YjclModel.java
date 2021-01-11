package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class YjclModel implements BaseEntity {
  private String sl;
  private String yljgdm;
  private String yljgmc;
  private String dyccl;//当月出车量
  private String ccpjxjsj;//出车平均响应时间
  private String rwlx;
  private String ccsj;
  private String cph;
  private String szjgmc;
  private String jsyxm;
 

public String getJsyxm() {
	return jsyxm;
}

public void setJsyxm(String jsyxm) {
	this.jsyxm = jsyxm;
}

public String getRwlx() {
	return rwlx;
}

public void setRwlx(String rwlx) {
	this.rwlx = rwlx;
}

public String getCcsj() {
	return ccsj;
}

public void setCcsj(String ccsj) {
	this.ccsj = ccsj;
}

public String getCph() {
	return cph;
}

public void setCph(String cph) {
	this.cph = cph;
}

public String getSzjgmc() {
	return szjgmc;
}

public void setSzjgmc(String szjgmc) {
	this.szjgmc = szjgmc;
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

public String getDyccl() {
	return dyccl;
}

public void setDyccl(String dyccl) {
	this.dyccl = dyccl;
}

public String getCcpjxjsj() {
	return ccpjxjsj;
}

public void setCcpjxjsj(String ccpjxjsj) {
	this.ccpjxjsj = ccpjxjsj;
}

public String getSl() {
	return sl;
}

public void setSl(String sl) {
	this.sl = sl;
}
  
}
