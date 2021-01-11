package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class JkDaDyCsModel  implements BaseEntity{
	 private String orgname;//机构名称
	 private String unitname;//科室名称
	 private String dyz;//调阅者姓名
	 private String bdyz;//被调阅者
	 private String kh;
	 private String dysj;//调阅时间
	 private String ywlx;//调阅类型
	 private String ip;//电脑ip
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getUnitname() {
		return unitname;
	}
	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}
	public String getDyz() {
		return dyz;
	}
	public void setDyz(String dyz) {
		this.dyz = dyz;
	}
	public String getBdyz() {
		return bdyz;
	}
	public void setBdyz(String bdyz) {
		this.bdyz = bdyz;
	}
	public String getKh() {
		return kh;
	}
	public void setKh(String kh) {
		this.kh = kh;
	}
	public String getDysj() {
		return dysj;
	}
	public void setDysj(String dysj) {
		this.dysj = dysj;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "JkDaDyCsModel [orgname=" + orgname + ", unitname=" + unitname + ", dyz=" + dyz + ", bdyz=" + bdyz
				+ ", kh=" + kh + ", dysj=" + dysj + ", ywlx=" + ywlx + ", ip=" + ip + "]";
	}
	 
}
