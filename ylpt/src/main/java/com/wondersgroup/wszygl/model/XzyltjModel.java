package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class XzyltjModel implements BaseEntity {
	 private String sfzh;//
	 private String yljgdm;//医疗机构的吗
	 private String yljgmc;//医疗机构名称
	 private String xzdm;//乡镇代码
	 private String xzmc;//乡镇名称
	 private String rq;//日期
	 private String mzrs;//门诊人数
	 private String zyrs;//住院人数
	 private String rs;//住院人数
	 private String ywlx;//业务类型
	 
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getMzrs() {
		return mzrs;
	}
	public void setMzrs(String mzrs) {
		this.mzrs = mzrs;
	}
	public String getZyrs() {
		return zyrs;
	}
	public void setZyrs(String zyrs) {
		this.zyrs = zyrs;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
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
	public String getXzdm() {
		return xzdm;
	}
	public void setXzdm(String xzdm) {
		this.xzdm = xzdm;
	}
	public String getXzmc() {
		return xzmc;
	}
	public void setXzmc(String xzmc) {
		this.xzmc = xzmc;
	}
	public String getRq() {
		return rq;
	}
	public void setRq(String rq) {
		this.rq = rq;
	}
	@Override
	public String toString() {
		return "XzyltjModel [sfzh=" + sfzh + ", yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", xzdm=" + xzdm + ", xzmc="
				+ xzmc + ", rq=" + rq + ", mzrs=" + mzrs + ", zyrs=" + zyrs + "]";
	}
	 
	 
	 

}
