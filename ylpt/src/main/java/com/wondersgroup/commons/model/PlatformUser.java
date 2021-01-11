package com.wondersgroup.commons.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class PlatformUser implements BaseEntity {
	
	private String id;			
	private String userid;//权限表账号
	private String otherlogname;//其他系统账号
	private String otherlogpsw;//其他系统密码
	private String otherplatkey;//其他系统key
	private String otherplatname;//其他系统描述
	private String authenticatetime;//认证时间
	private String removedtime;//删除时间
	private String removed;//删除标志0：有效；1：删除
	private String otherlogxm;//其他系统用户姓名
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOtherlogname() {
		return otherlogname;
	}
	public void setOtherlogname(String otherlogname) {
		this.otherlogname = otherlogname;
	}
	public String getOtherlogpsw() {
		return otherlogpsw;
	}
	public void setOtherlogpsw(String otherlogpsw) {
		this.otherlogpsw = otherlogpsw;
	}
	public String getOtherplatkey() {
		return otherplatkey;
	}
	public void setOtherplatkey(String otherplatkey) {
		this.otherplatkey = otherplatkey;
	}
	public String getOtherplatname() {
		return otherplatname;
	}
	public void setOtherplatname(String otherplatname) {
		this.otherplatname = otherplatname;
	}
	public String getAuthenticatetime() {
		return authenticatetime;
	}
	public void setAuthenticatetime(String authenticatetime) {
		this.authenticatetime = authenticatetime;
	}
	public String getRemovedtim() {
		return removedtime;
	}
	public void setRemovedtim(String removedtim) {
		this.removedtime = removedtim;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public String getOtherlogxm() {
		return otherlogxm;
	}
	public void setOtherlogxm(String otherlogxm) {
		this.otherlogxm = otherlogxm;
	}
	
}