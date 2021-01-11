package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 手术操作记录（）
 * */
@SuppressWarnings("serial")
public class OperationRecordModel implements BaseEntity {
	private String pid;
	private String id;
	private String name;
	private String gradename;
	private String gopename;
	private String opename;
	private String opecode;
	private String gradeid;
	private String updatesql;
	private List<OperationRecordModel> children;
	private String yljgdm;
	private String requestid;
	private String requesttime;
	private String detailid;
	private String sqr;
	private String remark;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<OperationRecordModel> getChildren() {
		return children;
	}
	public void setChildren(List<OperationRecordModel> children) {
		this.children = children;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getGopename() {
		return gopename;
	}
	public void setGopename(String gopename) {
		this.gopename = gopename;
	}
	public String getOpecode() {
		return opecode;
	}
	public void setOpecode(String opecode) {
		this.opecode = opecode;
	}
	public String getGradeid() {
		return gradeid;
	}
	public void setGradeid(String gradeid) {
		this.gradeid = gradeid;
	}
	public String getOpename() {
		return opename;
	}
	public void setOpename(String opename) {
		this.opename = opename;
	}
	public String getUpdatesql() {
		return updatesql;
	}
	public void setUpdatesql(String updatesql) {
		this.updatesql = updatesql;
	}
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getRequestid() {
		return requestid;
	}
	public void setRequestid(String requestid) {
		this.requestid = requestid;
	}
	public String getRequesttime() {
		return requesttime;
	}
	public void setRequesttime(String requesttime) {
		this.requesttime = requesttime;
	}
	public String getDetailid() {
		return detailid;
	}
	public void setDetailid(String detailid) {
		this.detailid = detailid;
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
	
	
}