package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class SslistModel implements BaseEntity {
    private String rs;
    private String ssjb;
    private String ssjbmc;
    private String yljgdm;
    private String yljgmc;
    private String sqks;//手术申请科室
    private String sqksbm;//手术申请科室编码
    private String ssczmc;//手术操作名称
    private String ssqzd;//手术前诊断
    private String sshzd;//手术后诊断
    private String ssysxm;//手术医生姓名
    private String mzysxm;//麻醉医生姓名
    private String rq;//手术开始日期
    
    
    
	public String getSqksbm() {
		return sqksbm;
	}
	public void setSqksbm(String sqksbm) {
		this.sqksbm = sqksbm;
	}
	public String getSsczmc() {
		return ssczmc;
	}
	public void setSsczmc(String ssczmc) {
		this.ssczmc = ssczmc;
	}
	public String getSsqzd() {
		return ssqzd;
	}
	public void setSsqzd(String ssqzd) {
		this.ssqzd = ssqzd;
	}
	public String getSshzd() {
		return sshzd;
	}
	public void setSshzd(String sshzd) {
		this.sshzd = sshzd;
	}
	public String getSsysxm() {
		return ssysxm;
	}
	public void setSsysxm(String ssysxm) {
		this.ssysxm = ssysxm;
	}
	public String getMzysxm() {
		return mzysxm;
	}
	public void setMzysxm(String mzysxm) {
		this.mzysxm = mzysxm;
	}
	public String getRq() {
		return rq;
	}
	public void setRq(String rq) {
		this.rq = rq;
	}
	public String getSqks() {
		return sqks;
	}
	public void setSqks(String sqks) {
		this.sqks = sqks;
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
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getSsjb() {
		return ssjb;
	}
	public void setSsjb(String ssjb) {
		this.ssjb = ssjb;
	}
	public String getSsjbmc() {
		return ssjbmc;
	}
	public void setSsjbmc(String ssjbmc) {
		this.ssjbmc = ssjbmc;
	}
	@Override
	public String toString() {
		return "SslistModel [rs=" + rs + ", ssjb=" + ssjb + ", ssjbmc=" + ssjbmc + ", yljgdm=" + yljgdm + ", yljgmc="
				+ yljgmc + ", sqks=" + sqks + ", sqksbm=" + sqksbm + ", ssczmc=" + ssczmc + ", ssqzd=" + ssqzd
				+ ", sshzd=" + sshzd + ", ssysxm=" + ssysxm + ", mzysxm=" + mzysxm + ", rq=" + rq + "]";
	}
	
    
}
