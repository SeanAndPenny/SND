package com.wondersgroup.commons.model;


import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
/**
 * 平台日志
 * @author Wangzifeng
 *
 */
public class PtLog implements BaseEntity {
	private String logid;			
	private String operationname;			
	private String operator;			
	private String actionclassname;			
	private String actionmethodname;			
	private String ip;			
	private String ssproject;			
	private String projectname;			
	private Date operationsj;
	public String getLogid() {
		return logid;
	}
	public void setLogid(String logid) {
		this.logid = logid;
	}
	public String getOperationname() {
		return operationname;
	}
	public void setOperationname(String operationname) {
		this.operationname = operationname;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getActionclassname() {
		return actionclassname;
	}
	public void setActionclassname(String actionclassname) {
		this.actionclassname = actionclassname;
	}
	public String getActionmethodname() {
		return actionmethodname;
	}
	public void setActionmethodname(String actionmethodname) {
		this.actionmethodname = actionmethodname;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSsproject() {
		return ssproject;
	}
	public void setSsproject(String ssproject) {
		this.ssproject = ssproject;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public Date getOperationsj() {
		return operationsj;
	}
	public void setOperationsj(Date operationsj) {
		this.operationsj = operationsj;
	}
	
		
}