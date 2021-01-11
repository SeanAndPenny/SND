package com.wondersgroup.wszygl.model;

import java.util.ArrayList;
import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 行政区划修改申请记录表(T_AREA_SQJL)
 * */
@SuppressWarnings("serial")
public class AreaSqjlModel implements BaseEntity {
	private String id;
	private String whocreateid;
	private String flag;
	private String createdate;
	private String updatesql;
	private String removed;
	private String updatetime;
	private String whoupdateid;
	private String oldxx;
	private String newxx;
	private String whocreatename;
	private String whoupdatename;
	private String code;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWhocreateid() {
		return whocreateid;
	}
	public void setWhocreateid(String whocreateid) {
		this.whocreateid = whocreateid;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getUpdatesql() {
		return updatesql;
	}
	public void setUpdatesql(String updatesql) {
		this.updatesql = updatesql;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getWhoupdateid() {
		return whoupdateid;
	}
	public void setWhoupdateid(String whoupdateid) {
		this.whoupdateid = whoupdateid;
	}
	public String getOldxx() {
		return oldxx;
	}
	public void setOldxx(String oldxx) {
		this.oldxx = oldxx;
	}
	public String getNewxx() {
		return newxx;
	}
	public void setNewxx(String newxx) {
		this.newxx = newxx;
	}
	public String getWhocreatename() {
		return whocreatename;
	}
	public void setWhocreatename(String whocreatename) {
		this.whocreatename = whocreatename;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getWhoupdatename() {
		return whoupdatename;
	}
	public void setWhoupdatename(String whoupdatename) {
		this.whoupdatename = whoupdatename;
	}
	
}