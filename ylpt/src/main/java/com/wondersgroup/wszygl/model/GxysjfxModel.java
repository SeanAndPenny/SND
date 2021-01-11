package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class GxysjfxModel implements BaseEntity {
    private String lyrs;
    private String xxlybm;//信息来源编码
    private String xxlymc;//信息来源名称
    private String yljgdm;
    private String yljgmc;
    private String xm;//姓名
    private String xb;//性别
    private String jksj;//建卡时间
    private String jkysxm;//建卡医生
    private String  xzmc;//乡镇名称
	private String shzlnlmc;//生活自理能力名称
	private String sfxy;//是否吸烟
	private String sfxymc;//是否吸烟名称
	private String xyrs;//吸烟人数
	private String wxfcbm;//危险分层编码
	private String wxfcrs;//危险分层人数
	private String wxfcmc;//危险分层名称
	private String nllx;//年龄段
	private String nlrs;//年龄人数
	private String nl;//年龄
	
	
	public String getNl() {
		return nl;
	}
	public void setNl(String nl) {
		this.nl = nl;
	}
	public String getNlrs() {
		return nlrs;
	}
	public void setNlrs(String nlrs) {
		this.nlrs = nlrs;
	}
	public String getNllx() {
		return nllx;
	}
	public void setNllx(String nllx) {
		this.nllx = nllx;
	}
	public String getWxfcmc() {
		return wxfcmc;
	}
	public void setWxfcmc(String wxfcmc) {
		this.wxfcmc = wxfcmc;
	}
	public String getWxfcbm() {
		return wxfcbm;
	}
	public void setWxfcbm(String wxfcbm) {
		this.wxfcbm = wxfcbm;
	}
	public String getWxfcrs() {
		return wxfcrs;
	}
	public void setWxfcrs(String wxfcrs) {
		this.wxfcrs = wxfcrs;
	}
	public String getXyrs() {
		return xyrs;
	}
	public void setXyrs(String xyrs) {
		this.xyrs = xyrs;
	}
	public String getSfxymc() {
		return sfxymc;
	}
	public void setSfxymc(String sfxymc) {
		this.sfxymc = sfxymc;
	}
	public String getSfxy() {
		return sfxy;
	}
	public void setSfxy(String sfxy) {
		this.sfxy = sfxy;
	}
	public String getShzlnlmc() {
		return shzlnlmc;
	}
	public void setShzlnlmc(String shzlnlmc) {
		this.shzlnlmc = shzlnlmc;
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
	public String getJksj() {
		return jksj;
	}
	public void setJksj(String jksj) {
		this.jksj = jksj;
	}
	public String getJkysxm() {
		return jkysxm;
	}
	public void setJkysxm(String jkysxm) {
		this.jkysxm = jkysxm;
	}
	public String getXzmc() {
		return xzmc;
	}
	public void setXzmc(String xzmc) {
		this.xzmc = xzmc;
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
	public String getLyrs() {
		return lyrs;
	}
	public void setLyrs(String lyrs) {
		this.lyrs = lyrs;
	}
	public String getXxlybm() {
		return xxlybm;
	}
	public void setXxlybm(String xxlybm) {
		this.xxlybm = xxlybm;
	}
	public String getXxlymc() {
		return xxlymc;
	}
	public void setXxlymc(String xxlymc) {
		this.xxlymc = xxlymc;
	}
	@Override
	public String toString() {
		return "GxysjfxModel [lyrs=" + lyrs + ", xxlybm=" + xxlybm + ", xxlymc=" + xxlymc + ", yljgdm=" + yljgdm
				+ ", yljgmc=" + yljgmc + ", xm=" + xm + ", xb=" + xb + ", jksj=" + jksj + ", jkysxm=" + jkysxm
				+ ", xzmc=" + xzmc + ", shzlnlmc=" + shzlnlmc + ", sfxy=" + sfxy + ", sfxymc=" + sfxymc + ", xyrs="
				+ xyrs + ", wxfcbm=" + wxfcbm + ", wxfcrs=" + wxfcrs + ", wxfcmc=" + wxfcmc + "]";
	}
	 
	 
    
}
