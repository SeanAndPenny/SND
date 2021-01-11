package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class GwetjkglbbModel implements BaseEntity {
    private String rs1;
    private String rs2;
    private String bl1;
    private String rs3;
    private String yljgdm;
    private String yljgmc;
    
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
	public String getRs1() {
		return rs1;
	}
	public void setRs1(String rs1) {
		this.rs1 = rs1;
	}
	public String getRs2() {
		return rs2;
	}
	public void setRs2(String rs2) {
		this.rs2 = rs2;
	}
	public String getBl1() {
		return bl1;
	}
	public void setBl1(String bl1) {
		this.bl1 = bl1;
	}
	public String getRs3() {
		return rs3;
	}
	public void setRs3(String rs3) {
		this.rs3 = rs3;
	}
	@Override
	public String toString() {
		return "GwetjkglbbModel [rs1=" + rs1 + ", rs2=" + rs2 + ", bl1=" + bl1 + ", rs3=" + rs3 + "]";
	}
    
}
