package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class SwxxFxModel implements BaseEntity {
	private String swrs;//死亡人数
	private String swnf;//死亡年份 
	private String swdq;//死亡地区
	private String nldrk;//年龄段人口
	private String nld;//年龄段
	private String nldmc;//年龄段名称
	private String nldnf;//年龄段年份
	private String  ers;
	private String  yrs;
	private String  xlqqs;
	private String  xlqs;
	private String  qcs;
	private String  qns;
	private String  zns;
	private String  lns;
	private String  xzrs;//乡镇人数
	private String  dqfl;//地区分类
	private String  jbflmc;//疾病分类名称;
	private String jbflbm;//疾病分类编码
	private String csrq;
	private String age;
	private String name;
	private String xb;
	private String hjdz;
	private String swrq;
	private String swyy;
	 
	

	
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getHjdz() {
		return hjdz;
	}
	public void setHjdz(String hjdz) {
		this.hjdz = hjdz;
	}
	public String getSwrq() {
		return swrq;
	}
	public void setSwrq(String swrq) {
		this.swrq = swrq;
	}
	public String getSwyy() {
		return swyy;
	}
	public void setSwyy(String swyy) {
		this.swyy = swyy;
	}
	public String getJbflbm() {
		return jbflbm;
	}
	public void setJbflbm(String jbflbm) {
		this.jbflbm = jbflbm;
	}
	public String getJbflmc() {
		return jbflmc;
	}
	public void setJbflmc(String jbflmc) {
		this.jbflmc = jbflmc;
	}
	public String getDqfl() {
		return dqfl;
	}
	public void setDqfl(String dqfl) {
		this.dqfl = dqfl;
	}
	public String getXzrs() {
		return xzrs;
	}
	public void setXzrs(String xzrs) {
		this.xzrs = xzrs;
	}
	public String getErs() {
		return ers;
	}
	public void setErs(String ers) {
		this.ers = ers;
	}
	public String getYrs() {
		return yrs;
	}
	public void setYrs(String yrs) {
		this.yrs = yrs;
	}
	public String getXlqqs() {
		return xlqqs;
	}
	public void setXlqqs(String xlqqs) {
		this.xlqqs = xlqqs;
	}
	public String getXlqs() {
		return xlqs;
	}
	public void setXlqs(String xlqs) {
		this.xlqs = xlqs;
	}
	public String getQcs() {
		return qcs;
	}
	public void setQcs(String qcs) {
		this.qcs = qcs;
	}
	public String getQns() {
		return qns;
	}
	public void setQns(String qns) {
		this.qns = qns;
	}
	public String getZns() {
		return zns;
	}
	public void setZns(String zns) {
		this.zns = zns;
	}
	public String getLns() {
		return lns;
	}
	public void setLns(String lns) {
		this.lns = lns;
	}
	public String getNldrk() {
		return nldrk;
	}
	public void setNldrk(String nldrk) {
		this.nldrk = nldrk;
	}
	public String getNld() {
		return nld;
	}
	public void setNld(String nld) {
		this.nld = nld;
	}
	public String getNldmc() {
		return nldmc;
	}
	public void setNldmc(String nldmc) {
		this.nldmc = nldmc;
	}
	public String getNldnf() {
		return nldnf;
	}
	public void setNldnf(String nldnf) {
		this.nldnf = nldnf;
	}
	public String getSwrs() {
		return swrs;
	}
	public void setSwrs(String swrs) {
		this.swrs = swrs;
	}
	public String getSwnf() {
		return swnf;
	}
	public void setSwnf(String swnf) {
		this.swnf = swnf;
	}
	public String getSwdq() {
		return swdq;
	}
	public void setSwdq(String swdq) {
		this.swdq = swdq;
	}
	@Override
	public String toString() {
		return "SwxxFxModel [swrs=" + swrs + ", swnf=" + swnf + ", swdq=" + swdq + ", nldrk=" + nldrk + ", nld=" + nld
				+ ", nldmc=" + nldmc + ", nldnf=" + nldnf + ", ers=" + ers + ", yrs=" + yrs + ", xlqqs=" + xlqqs
				+ ", xlqs=" + xlqs + ", qcs=" + qcs + ", qns=" + qns + ", zns=" + zns + ", lns=" + lns + "]";
	}
	 

}
