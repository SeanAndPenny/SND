package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class BassModel implements BaseEntity {
	  private String yljgdm;
	  private String yljgmc;
	  private String nnis;//手术级别
	  private String jbmc;//级别名称
	  private String rs;//人数
	  private String  yjrs ;
	  private String   ejrs;
	  private String   sjrs ;
	  private String   sijrs ;
	  private String   ljrs ;
	  private String   rq;
	  private String ksmc;
	  private String ksbm;
	  
	public String getKsmc() {
		return ksmc;
	}
	public void setKsmc(String ksmc) {
		this.ksmc = ksmc;
	}
	public String getKsbm() {
		return ksbm;
	}
	public void setKsbm(String ksbm) {
		this.ksbm = ksbm;
	}
	public String getYjrs() {
		return yjrs;
	}
	public void setYjrs(String yjrs) {
		this.yjrs = yjrs;
	}
	public String getEjrs() {
		return ejrs;
	}
	public void setEjrs(String ejrs) {
		this.ejrs = ejrs;
	}
	public String getSjrs() {
		return sjrs;
	}
	public void setSjrs(String sjrs) {
		this.sjrs = sjrs;
	}
	public String getSijrs() {
		return sijrs;
	}
	public void setSijrs(String sijrs) {
		this.sijrs = sijrs;
	}
	public String getLjrs() {
		return ljrs;
	}
	public void setLjrs(String ljrs) {
		this.ljrs = ljrs;
	}
	public String getRq() {
		return rq;
	}
	public void setRq(String rq) {
		this.rq = rq;
	}
	public String getJbmc() {
		return jbmc;
	}
	public void setJbmc(String jbmc) {
		this.jbmc = jbmc;
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
	public String getNnis() {
		return nnis;
	}
	public void setNnis(String nnis) {
		this.nnis = nnis;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	  
}
