package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 
 * */
@SuppressWarnings("serial")
public class OpeHospitalModel implements BaseEntity {		
	private String id;		
	private String yljgdm;		
	private String yljgmc;
	private String detailid;
	private String name;
	private String gopename;
	private String gradename;
	private String zt;
	private String sqr;
	private String remark;
	private String sqsj;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getDetailid() {
		return detailid;
	}
	public void setDetailid(String detailid) {
		this.detailid = detailid;
	}
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGopename() {
		return gopename;
	}
	public void setGopename(String gopename) {
		this.gopename = gopename;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getSqr() {
		return sqr;
	}
	public void setSqr(String sqr) {
		this.sqr = sqr;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSqsj() {
		return sqsj;
	}
	public void setSqsj(String sqsj) {
		this.sqsj = sqsj;
	}			
	
	
}