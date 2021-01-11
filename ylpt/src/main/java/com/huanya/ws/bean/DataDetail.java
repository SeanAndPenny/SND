package com.huanya.ws.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@XmlType(name = "dataDetail", propOrder = { "jdjgid", "jdjgmc", "tdid", "tdmc", "jdrs", "dadts", "bl" })
public class DataDetail {
	private String jdjgid; // JDJGID 建档机构ID

	private String jdjgmc; // JDJGMC 建档机构名称

	private String tdid; // TDID 团队ID

	private String tdmc; // TDMC 团队名称

	private String jdrs; // JDRS 建档人数

	private String dadts; // DADTS 档案动态数

	private String bl; // BL 档案动态率

	@XmlElement(name = "JDJGID")
	public String getJdjgid() {
		return jdjgid;
	}

	public void setJdjgid(String jdjgid) {
		this.jdjgid = jdjgid;
	}

	@XmlElement(name = "JDJGMC")
	public String getJdjgmc() {
		return jdjgmc;
	}

	public void setJdjgmc(String jdjgmc) {
		this.jdjgmc = jdjgmc;
	}

	@XmlElement(name = "TDID")
	public String getTdid() {
		return tdid;
	}

	public void setTdid(String tdid) {
		this.tdid = tdid;
	}

	@XmlElement(name = "TDMC")
	public String getTdmc() {
		return tdmc;
	}

	public void setTdmc(String tdmc) {
		this.tdmc = tdmc;
	}

	@XmlElement(name = "JDRS")
	public String getJdrs() {
		return jdrs;
	}

	public void setJdrs(String jdrs) {
		this.jdrs = jdrs;
	}

	@XmlElement(name = "DADTS")
	public String getDadts() {
		return dadts;
	}

	public void setDadts(String dadts) {
		this.dadts = dadts;
	}

	@XmlElement(name = "BL")
	public String getBl() {
		return bl;
	}

	public void setBl(String bl) {
		this.bl = bl;
	}
}
