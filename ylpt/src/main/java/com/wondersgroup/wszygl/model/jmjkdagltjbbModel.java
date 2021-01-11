package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class jmjkdagltjbbModel implements BaseEntity {
	private String yljgdm;
	private String yljgmc;//医疗机构名称
	private String czrks;//辖区内常住居民数
	private String jdrs;//建档人数
	private String jkdajdl;//健康档案建档率
	private String dtjds;//动态建档数
	private String jkdasyl;//健康档案使用率
	private String 	dzjds;//电子建档数
	private String 	dzjdl;//电子建档率
	private String  tjrq;
	private String  rksl;
	
	public String getTjrq() {
		return tjrq;
	}
	public void setTjrq(String tjrq) {
		this.tjrq = tjrq;
	}
	public String getRksl() {
		return rksl;
	}
	public void setRksl(String rksl) {
		this.rksl = rksl;
	}
	public String getDzjdl() {
		return dzjdl;
	}
	public void setDzjdl(String dzjdl) {
		this.dzjdl = dzjdl;
	}
	public String getDzjds() {
		return dzjds;
	}
	public void setDzjds(String dzjds) {
		this.dzjds = dzjds;
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
	public String getCzrks() {
		return czrks;
	}
	public void setCzrks(String czrks) {
		this.czrks = czrks;
	}
	public String getJdrs() {
		return jdrs;
	}
	public void setJdrs(String jdrs) {
		this.jdrs = jdrs;
	}
	public String getJkdajdl() {
		return jkdajdl;
	}
	public void setJkdajdl(String jkdajdl) {
		this.jkdajdl = jkdajdl;
	}
	public String getDtjds() {
		return dtjds;
	}
	public void setDtjds(String dtjds) {
		this.dtjds = dtjds;
	}
	public String getJkdasyl() {
		return jkdasyl;
	}
	public void setJkdasyl(String jkdasyl) {
		this.jkdasyl = jkdasyl;
	}
	@Override
	public String toString() {
		return "jmjkdagltjbbModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", czrks=" + czrks + ", jdrs=" + jdrs
				+ ", jkdajdl=" + jkdajdl + ", dtjds=" + dtjds + ", jkdasyl=" + jkdasyl + "]";
	}
	
}
