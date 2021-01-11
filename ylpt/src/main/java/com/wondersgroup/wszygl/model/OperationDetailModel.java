package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 手术分级表（TB_OPE_GRADE）
 * */
@SuppressWarnings("serial")
public class OperationDetailModel implements BaseEntity {
	private String id;//目录id
	private String gradenum;//手术序列号
	private String catalogid;//手术分级id
	private String gradename;//手术名称
	private String gradelevel;//手术级别
	private String graderemark;//备注
	private String gopename;//手术操作名称
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGradenum() {
		return gradenum;
	}
	public void setGradenum(String gradenum) {
		this.gradenum = gradenum;
	}
	public String getCatalogid() {
		return catalogid;
	}
	public void setCatalogid(String catalogid) {
		this.catalogid = catalogid;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getGradelevel() {
		return gradelevel;
	}
	public void setGradelevel(String gradelevel) {
		this.gradelevel = gradelevel;
	}
	public String getGraderemark() {
		return graderemark;
	}
	public void setGraderemark(String graderemark) {
		this.graderemark = graderemark;
	}
	public String getGopename() {
		return gopename;
	}
	public void setGopename(String gopename) {
		this.gopename = gopename;
	}
	
	
}