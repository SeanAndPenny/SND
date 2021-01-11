package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class CwtjModel implements BaseEntity {
	private String org_code;//机构代码
	private String 	yljgmc;//医疗机构名称
	private String lxmc;//机构类型名称
	private String id;//机构类型编码
	private String hdcws;//核定床位数
	private String kfcws;//开发床位数
	private String dqsycws;//当前使用床位数
	private String sycws;//剩余床位数
	private String cwsyl;//床位使用率
	private String bl;
	private String yljgdm;
	private String bed_name;//病床名
	private String bq_name;//病区名
	private String hzxm;
	private String jzksmc;
	private String rysj;
	private String sl;
	private String bq_code;
	private String cwlxmc;//床位类型名称
	
	public String getCwlxmc() {
		return cwlxmc;
	}
	public void setCwlxmc(String cwlxmc) {
		this.cwlxmc = cwlxmc;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHdcws() {
		return hdcws;
	}
	public void setHdcws(String hdcws) {
		this.hdcws = hdcws;
	}
	public String getKfcws() {
		return kfcws;
	}
	public void setKfcws(String kfcws) {
		this.kfcws = kfcws;
	}
	public String getDqsycws() {
		return dqsycws;
	}
	public void setDqsycws(String dqsycws) {
		this.dqsycws = dqsycws;
	}
	public String getSycws() {
		return sycws;
	}
	public void setSycws(String sycws) {
		this.sycws = sycws;
	}
	public String getCwsyl() {
		return cwsyl;
	}
	public void setCwsyl(String cwsyl) {
		this.cwsyl = cwsyl;
	}
	public String getBl() {
		return bl;
	}
	public void setBl(String bl) {
		this.bl = bl;
	}
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getBed_name() {
		return bed_name;
	}
	public void setBed_name(String bed_name) {
		this.bed_name = bed_name;
	}
	public String getBq_name() {
		return bq_name;
	}
	public void setBq_name(String bq_name) {
		this.bq_name = bq_name;
	}
	public String getHzxm() {
		return hzxm;
	}
	public void setHzxm(String hzxm) {
		this.hzxm = hzxm;
	}
	public String getJzksmc() {
		return jzksmc;
	}
	public void setJzksmc(String jzksmc) {
		this.jzksmc = jzksmc;
	}
	public String getRysj() {
		return rysj;
	}
	public void setRysj(String rysj) {
		this.rysj = rysj;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getBq_code() {
		return bq_code;
	}
	public void setBq_code(String bq_code) {
		this.bq_code = bq_code;
	}
	@Override
	public String toString() {
		return "CwtjModel [org_code=" + org_code + ", yljgmc=" + yljgmc + ", lxmc=" + lxmc + ", id=" + id + ", hdcws="
				+ hdcws + ", kfcws=" + kfcws + ", dqsycws=" + dqsycws + ", sycws=" + sycws + ", cwsyl=" + cwsyl
				+ ", bl=" + bl + ", yljgdm=" + yljgdm + ", bed_name=" + bed_name + ", bq_name=" + bq_name + ", hzxm="
				+ hzxm + ", jzksmc=" + jzksmc + ", rysj=" + rysj + ", sl=" + sl + ", bq_code=" + bq_code + "]";
	}

	
	 
}
