package com.wondersgroup.wszygl.model;

import java.util.ArrayList;
import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 行政区划表(T_AREA)
 * */
@SuppressWarnings("serial")
public class AreaModel implements BaseEntity {
	private String name;
	private String code;
	private String lelevel;
	private String pid;
	private String id;
	private String version;
	private String updatetime;
	private String remark;
	private String removed;
	private String childs;
	private List<AreaModel> children= new ArrayList<AreaModel>();
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLelevel() {
		return lelevel;
	}
	public void setLelevel(String lelevel) {
		this.lelevel = lelevel;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public List<AreaModel> getChildren() {
		return children;
	}
	public void setChildren(List<AreaModel> children) {
		this.children = children;
	}
	public void addChildren(AreaModel child) {
		this.children.add(child);
	}
	 public void setEntity(AreaModel module){
		 setName(module.getName());
		 setPid(module.getPid());
		 setCode(module.getCode());
		 setLelevel(module.getLelevel());
		 setId(module.getCode());
	  }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChilds() {
		return childs;
	}
	public void setChilds(String childs) {
		this.childs = childs;
	}
	
}