package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class GwtnbglbbModel implements BaseEntity {
	private String rs1;
	private String rs2;
    private String rs3;
    private String bl1;
    private String bl2;
    private String  yljgmc;
    
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
	public String getRs3() {
		return rs3;
	}
	public void setRs3(String rs3) {
		this.rs3 = rs3;
	}
	public String getBl1() {
		return bl1;
	}
	public void setBl1(String bl1) {
		this.bl1 = bl1;
	}
	public String getBl2() {
		return bl2;
	}
	public void setBl2(String bl2) {
		this.bl2 = bl2;
	}
	@Override
	public String toString() {
		return "GwtnbglbbModel [rs1=" + rs1 + ", rs2=" + rs2 + ", rs3=" + rs3 + ", bl1=" + bl1 + ", bl2=" + bl2 + "]";
	}
    

}
