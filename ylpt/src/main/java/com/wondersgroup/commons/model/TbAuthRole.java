package com.wondersgroup.commons.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 角色信息(TB_AUTH_ROLE)
 * */
@SuppressWarnings("serial")
public class TbAuthRole implements BaseEntity {
	private String roleid;
	private String rolename;
	private String isChecked;//判断角色是否已经被授权
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}
	
}