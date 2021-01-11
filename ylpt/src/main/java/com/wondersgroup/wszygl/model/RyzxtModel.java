package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class RyzxtModel  implements BaseEntity {
	 
	private String lx;
	private String grs;
	private String zrs;
	private String crs;
	private String lx2;
	private String org_name;
	private String name; 
	private String dept_name; 
	private String sex_name;
	private String sfzh;
	private String nation; 
	private String highstudy; 
	private String title;
	private String org_code;
	private String rs;
	private String dept_code;
    private String xlrs;//学历人数
    private String xllx;//学历类型
    
	
	public String getXlrs() {
		return xlrs;
	}
	public void setXlrs(String xlrs) {
		this.xlrs = xlrs;
	}
	public String getXllx() {
		return xllx;
	}
	public void setXllx(String xllx) {
		this.xllx = xllx;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getLx() {
		return lx;
	}
	public void setLx(String lx) {
		this.lx = lx;
	}
	public String getGrs() {
		return grs;
	}
	public void setGrs(String grs) {
		this.grs = grs;
	}
	public String getZrs() {
		return zrs;
	}
	public void setZrs(String zrs) {
		this.zrs = zrs;
	}
	public String getCrs() {
		return crs;
	}
	public void setCrs(String crs) {
		this.crs = crs;
	}
	public String getLx2() {
		return lx2;
	}
	public void setLx2(String lx2) {
		this.lx2 = lx2;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getSex_name() {
		return sex_name;
	}
	public void setSex_name(String sex_name) {
		this.sex_name = sex_name;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getHighstudy() {
		return highstudy;
	}
	public void setHighstudy(String highstudy) {
		this.highstudy = highstudy;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "RyzxtModel [dept_code=" + dept_code + "]";
	}
	
	
	
	
	
	

}
