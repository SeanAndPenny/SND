package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class jkdaglfxModel implements BaseEntity {
       private String yljgdm;
       private String yljgmc;
       private String yjdhjrk;//已建档户籍人口
       private String yjdldrk;//已建档流动人口
       private String yjdqtrk;//已建档其他人口
       private String yjdzb;//已建档占比
       private String bz;
       private String djdczrk;//待建档户籍人口
       private String djdldrk;//待建档流动人口
       private String pcsmc;//派出所名称
       private String jdrq;//建档日期
       private String jdrs;//建档人数
       private String lxmc;//类型名称
       private String xm;//姓名
       private String xbmc;//性别名称
       private String csrq;//出生日期
       private String zjhm;//证件号码
       private String jdjg;//建档机构
       private String gltd;//管理团队
       private String ssxz;//所属乡镇
       private String mz;//名族
       private String hjdz;//户籍地址
       private String hdjrq;//登记日期
       private String xlh;
       
	public String getXlh() {
		return xlh;
	}
	public void setXlh(String xlh) {
		this.xlh = xlh;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getHjdz() {
		return hjdz;
	}
	public void setHjdz(String hjdz) {
		this.hjdz = hjdz;
	}
	public String getHdjrq() {
		return hdjrq;
	}
	public void setHdjrq(String hdjrq) {
		this.hdjrq = hdjrq;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXbmc() {
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getZjhm() {
		return zjhm;
	}
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	public String getJdjg() {
		return jdjg;
	}
	public void setJdjg(String jdjg) {
		this.jdjg = jdjg;
	}
	public String getGltd() {
		return gltd;
	}
	public void setGltd(String gltd) {
		this.gltd = gltd;
	}
	public String getSsxz() {
		return ssxz;
	}
	public void setSsxz(String ssxz) {
		this.ssxz = ssxz;
	}
	public String getJdrs() {
		return jdrs;
	}
	public void setJdrs(String jdrs) {
		this.jdrs = jdrs;
	}
	public String getJdrq() {
		return jdrq;
	}
	public void setJdrq(String jdrq) {
		this.jdrq = jdrq;
	}
	public String getDjdczrk() {
		return djdczrk;
	}
	public void setDjdczrk(String djdczrk) {
		this.djdczrk = djdczrk;
	}
	public String getDjdldrk() {
		return djdldrk;
	}
	public void setDjdldrk(String djdldrk) {
		this.djdldrk = djdldrk;
	}
	public String getPcsmc() {
		return pcsmc;
	}
	public void setPcsmc(String pcsmc) {
		this.pcsmc = pcsmc;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getYjdzb() {
		return yjdzb;
	}
	public void setYjdzb(String yjdzb) {
		this.yjdzb = yjdzb;
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
	public String getYjdhjrk() {
		return yjdhjrk;
	}
	public void setYjdhjrk(String yjdhjrk) {
		this.yjdhjrk = yjdhjrk;
	}
	public String getYjdldrk() {
		return yjdldrk;
	}
	public void setYjdldrk(String yjdldrk) {
		this.yjdldrk = yjdldrk;
	}
	public String getYjdqtrk() {
		return yjdqtrk;
	}
	public void setYjdqtrk(String yjdqtrk) {
		this.yjdqtrk = yjdqtrk;
	}
	@Override
	public String toString() {
		return "jkdaglfxModel [yljgdm=" + yljgdm + ", yljgmc=" + yljgmc + ", yjdhjrk=" + yjdhjrk + ", yjdldrk="
				+ yjdldrk + ", yjdqtrk=" + yjdqtrk + "]";
	}
       
}
