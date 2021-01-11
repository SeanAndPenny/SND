package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class BasycxModel implements BaseEntity {
   private String yljgdm;
   private String yljgmc;
   private String ksdm;//科室代码
   private String ksmc;//科室名称
   private String jbdm;//级别代码
   private String jbmc;//级别名称
   private String ssmc;//手术名称
   private String zfy;
   private String xm;
   private String xb;
   private String csrq;
   private String xzmc;//乡镇名称
   private String rs;
   private String rq;
   private String nl;
   private String rysj;//入院时间
   private String ssbm;//手术编码
  private String ssys;//手术医生
  private String  ssrq;//手术日期
  private String mzsxm;//麻醉是姓名
  private String ssjb;//手术级别
  
   
   
public String getSsjb() {
	return ssjb;
}
public void setSsjb(String ssjb) {
	this.ssjb = ssjb;
}
public String getMzsxm() {
	return mzsxm;
}
public void setMzsxm(String mzsxm) {
	this.mzsxm = mzsxm;
}
public String getSsrq() {
	return ssrq;
}
public void setSsrq(String ssrq) {
	this.ssrq = ssrq;
}
public String getSsys() {
	return ssys;
}
public void setSsys(String ssys) {
	this.ssys = ssys;
}
public String getSsbm() {
	return ssbm;
}
public void setSsbm(String ssbm) {
	this.ssbm = ssbm;
}
public String getRysj() {
	return rysj;
}
public void setRysj(String rysj) {
	this.rysj = rysj;
}
public String getNl() {
	return nl;
}
public void setNl(String nl) {
	this.nl = nl;
}
public String getRq() {
	return rq;
}
public void setRq(String rq) {
	this.rq = rq;
}
public String getRs() {
	return rs;
}
public void setRs(String rs) {
	this.rs = rs;
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
public String getKsdm() {
	return ksdm;
}
public void setKsdm(String ksdm) {
	this.ksdm = ksdm;
}
public String getKsmc() {
	return ksmc;
}
public void setKsmc(String ksmc) {
	this.ksmc = ksmc;
}
public String getJbdm() {
	return jbdm;
}
public void setJbdm(String jbdm) {
	this.jbdm = jbdm;
}
public String getJbmc() {
	return jbmc;
}
public void setJbmc(String jbmc) {
	this.jbmc = jbmc;
}
public String getSsmc() {
	return ssmc;
}
public void setSsmc(String ssmc) {
	this.ssmc = ssmc;
}
public String getZfy() {
	return zfy;
}
public void setZfy(String zfy) {
	this.zfy = zfy;
}
public String getXm() {
	return xm;
}
public void setXm(String xm) {
	this.xm = xm;
}
public String getXb() {
	return xb;
}
public void setXb(String xb) {
	this.xb = xb;
}
public String getCsrq() {
	return csrq;
}
public void setCsrq(String csrq) {
	this.csrq = csrq;
}
public String getXzmc() {
	return xzmc;
}
public void setXzmc(String xzmc) {
	this.xzmc = xzmc;
}
@Override
public String toString() {
	return "BasycxModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", ksdm=" + ksdm + ", ksmc=" + ksmc + ", jbdm="
			+ jbdm + ", jbmc=" + jbmc + ", ssmc=" + ssmc + ", zfy=" + zfy + ", xm=" + xm + ", xb=" + xb + ", csrq="
			+ csrq + ", xzmc=" + xzmc + ", rs=" + rs + ", rq=" + rq + ", nl=" + nl + ", rysj=" + rysj + ", ssbm=" + ssbm
			+ ", ssys=" + ssys + ", ssrq=" + ssrq + ", mzsxm=" + mzsxm + ", ssjb=" + ssjb + "]";
}
 
   
}
