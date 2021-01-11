package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 合同提醒
 * @author asus
 *
 */
@SuppressWarnings("serial")
public class TbDxRshtx implements BaseEntity{
	private String yljgmc;
	private String xm;
	private String sjhm;
	private String dqrq;
	private String zjhm;
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSjhm() {
		return sjhm;
	}
	public void setSjhm(String sjhm) {
		this.sjhm = sjhm;
	}
	public String getDqrq() {
		return dqrq;
	}
	public void setDqrq(String dqrq) {
		this.dqrq = dqrq;
	}
	public String getZjhm() {
		return zjhm;
	}
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	@Override
	public String toString() {
		return "TbDxRshtx [yljgmc=" + yljgmc + ", xm=" + xm + ", sjhm=" + sjhm + ", dqrq=" + dqrq + ", zjhm=" + zjhm
				+ "]";
	}
	
    
}
