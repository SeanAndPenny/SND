package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 手术操作目录表（TB_OPE_DETAIL）
 * */
@SuppressWarnings("serial")
public class OperationGradeModel implements BaseEntity {
	private String id;//手术分级id
	private String gradeid;//手术操作id
	private String opecode;//手术操作编码
	private String opename;//手术操作名称
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGradeid() {
		return gradeid;
	}
	public void setGradeid(String gradeid) {
		this.gradeid = gradeid;
	}
	public String getOpecode() {
		return opecode;
	}
	public void setOpecode(String opecode) {
		this.opecode = opecode;
	}
	public String getOpename() {
		return opename;
	}
	public void setOpename(String opename) {
		this.opename = opename;
	}
			

}