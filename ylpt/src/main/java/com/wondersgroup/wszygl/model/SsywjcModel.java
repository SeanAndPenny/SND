package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class SsywjcModel implements BaseEntity {
	private String jglb;// 机构级别
	private String mzrs;// 门诊人数
	private String jzrs;// 急诊人数
	private String zyrs;// 在院人数
	private String ryrs;// 入院人数
	private String cyrs;// 出院人数
	private String mzfy;// 门诊费用
	private String zyfy;// 住院费用
	private String rq;// 日期
	private String yljgmc;
	private String ryks;
	private String rysj;
	private String xm;
	private String xb;
	private String rs;
	private String yljgdm;
	private String lx;
	private String cyks;
	private String cysj;
	private String ids;
	private String jzksmc;
	private String jzksrq;
	private String zzysxm;
	private String zzysgh;
	private String jzzdsm;
	private String jzksbm;
	private String sj;
 
	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getJzksmc() {
		return jzksmc;
	}

	public void setJzksmc(String jzksmc) {
		this.jzksmc = jzksmc;
	}

	public String getJzksrq() {
		return jzksrq;
	}

	public void setJzksrq(String jzksrq) {
		this.jzksrq = jzksrq;
	}

	public String getZzysxm() {
		return zzysxm;
	}

	public void setZzysxm(String zzysxm) {
		this.zzysxm = zzysxm;
	}

	public String getZzysgh() {
		return zzysgh;
	}

	public void setZzysgh(String zzysgh) {
		this.zzysgh = zzysgh;
	}

	public String getJzzdsm() {
		return jzzdsm;
	}

	public void setJzzdsm(String jzzdsm) {
		this.jzzdsm = jzzdsm;
	}

	public String getJzksbm() {
		return jzksbm;
	}

	public void setJzksbm(String jzksbm) {
		this.jzksbm = jzksbm;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getCyks() {
		return cyks;
	}

	public void setCyks(String cyks) {
		this.cyks = cyks;
	}

	public String getCysj() {
		return cysj;
	}

	public void setCysj(String cysj) {
		this.cysj = cysj;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getYljgdm() {
		return yljgdm;
	}

	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}

	public String getRs() {
		return rs;
	}

	public void setRs(String rs) {
		this.rs = rs;
	}

	public String getYljgmc() {
		return yljgmc;
	}

	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}

	public String getRyks() {
		return ryks;
	}

	public void setRyks(String ryks) {
		this.ryks = ryks;
	}

	public String getRysj() {
		return rysj;
	}

	public void setRysj(String rysj) {
		this.rysj = rysj;
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

	public String getRq() {
		return rq;
	}

	public void setRq(String rq) {
		this.rq = rq;
	}

	public String getJglb() {
		return jglb;
	}

	public void setJglb(String jglb) {
		this.jglb = jglb;
	}

	public String getMzrs() {
		return mzrs;
	}

	public void setMzrs(String mzrs) {
		this.mzrs = mzrs;
	}

	public String getJzrs() {
		return jzrs;
	}

	public void setJzrs(String jzrs) {
		this.jzrs = jzrs;
	}

	public String getZyrs() {
		return zyrs;
	}

	public void setZyrs(String zyrs) {
		this.zyrs = zyrs;
	}

	public String getRyrs() {
		return ryrs;
	}

	public void setRyrs(String ryrs) {
		this.ryrs = ryrs;
	}

	public String getCyrs() {
		return cyrs;
	}

	public void setCyrs(String cyrs) {
		this.cyrs = cyrs;
	}

	public String getMzfy() {
		return mzfy;
	}

	public void setMzfy(String mzfy) {
		this.mzfy = mzfy;
	}

	public String getZyfy() {
		return zyfy;
	}

	public void setZyfy(String zyfy) {
		this.zyfy = zyfy;
	}

	@Override
	public String toString() {
		return "SsywjcModel [jglb=" + jglb + ", mzrs=" + mzrs + ", jzrs=" + jzrs + ", zyrs=" + zyrs + ", ryrs=" + ryrs
				+ ", cyrs=" + cyrs + ", mzfy=" + mzfy + ", zyfy=" + zyfy + ", rq=" + rq + "]";
	}

}
