package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class JjsjFxModel implements BaseEntity {
	private String sl; 
    private String xbdm;
    private String xbmc;
    private String nllx; //年龄段类型:0~10,10~20,20~30......
    private String nsl;//男性数量
    private String vsl;//女性数量
    private String name;//患者姓名
    private String nl;//年龄
    private String zs;//主诉
    private String fzsj;//分诊时间
    private String fzhs;//分诊护士
    private String fzks;//分诊科室
    private String fzjg;// 分诊结果
    private String fzjb;//分诊级别
    private String fzjbmc;//分诊级别名称
    private String zdblx;//字典表类型
    private String ids;
    private String fzzs;
    private String dyccl;
    private String ccpjxjsj; 
  private String yljgmc;
  
	public String getYljgmc() {
	return yljgmc;
}
public void setYljgmc(String yljgmc) {
	this.yljgmc = yljgmc;
}
	public String getDyccl() {
		return dyccl;
	}
	public void setDyccl(String dyccl) {
		this.dyccl = dyccl;
	}
	public String getCcpjxjsj() {
		return ccpjxjsj;
	}
	public void setCcpjxjsj(String ccpjxjsj) {
		this.ccpjxjsj = ccpjxjsj;
	}
	public String getFzzs() {
		return fzzs;
	}
	public void setFzzs(String fzzs) {
		this.fzzs = fzzs;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getZdblx() {
		return zdblx;
	}
	public void setZdblx(String zdblx) {
		this.zdblx = zdblx;
	}
	public String getFzjbmc() {
		return fzjbmc;
	}
	public void setFzjbmc(String fzjbmc) {
		this.fzjbmc = fzjbmc;
	}
	public String getFzjb() {
		return fzjb;
	}
	public void setFzjb(String fzjb) {
		this.fzjb = fzjb;
	}
	public String getSl() {
		return sl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNl() {
		return nl;
	}
	public void setNl(String nl) {
		this.nl = nl;
	}
	public String getZs() {
		return zs;
	}
	public void setZs(String zs) {
		this.zs = zs;
	}
	public String getFzsj() {
		return fzsj;
	}
	public void setFzsj(String fzsj) {
		this.fzsj = fzsj;
	}
	public String getFzhs() {
		return fzhs;
	}
	public void setFzhs(String fzhs) {
		this.fzhs = fzhs;
	}
	public String getFzks() {
		return fzks;
	}
	public void setFzks(String fzks) {
		this.fzks = fzks;
	}
	public String getFzjg() {
		return fzjg;
	}
	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getXbdm() {
		return xbdm;
	}
	public void setXbdm(String xbdm) {
		this.xbdm = xbdm;
	}
	public String getXbmc() {
		return xbmc;
	}
	public void setXbmc(String xbmc) {
		this.xbmc = xbmc;
	}
	public String getNllx() {
		return nllx;
	}
	public void setNllx(String nllx) {
		this.nllx = nllx;
	}
	public String getNsl() {
		return nsl;
	}
	public void setNsl(String nsl) {
		this.nsl = nsl;
	}
	public String getVsl() {
		return vsl;
	}
	public void setVsl(String vsl) {
		this.vsl = vsl;
	}
	@Override
	public String toString() {
		return "JjsjFxModel [sl=" + sl + ", xbdm=" + xbdm + ", xbmc=" + xbmc + ", nllx=" + nllx + ", nsl=" + nsl
				+ ", vsl=" + vsl + ", name=" + name + ", nl=" + nl + ", zs=" + zs + ", fzsj=" + fzsj + ", fzhs=" + fzhs
				+ ", fzks=" + fzks + ", fzjg=" + fzjg + ", fzjb=" + fzjb + ", fzjbmc=" + fzjbmc + ", zdblx=" + zdblx
				+ ", ids=" + ids + ", fzzs=" + fzzs + ", dyccl=" + dyccl + ", ccpjxjsj=" + ccpjxjsj + ", yljgmc="
				+ yljgmc + "]";
	}
    
    
}
