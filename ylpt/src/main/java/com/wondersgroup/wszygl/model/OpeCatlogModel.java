package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 
 * */
@SuppressWarnings("serial")
public class OpeCatlogModel implements BaseEntity {
	private String id;			
	private String name;			
	private String cataloglevel;			
	private String catalogup;
	private List<OpeCatlogModel> children;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCataloglevel() {
		return cataloglevel;
	}
	public void setCataloglevel(String cataloglevel) {
		this.cataloglevel = cataloglevel;
	}
	public String getCatalogup() {
		return catalogup;
	}
	public void setCatalogup(String catalogup) {
		this.catalogup = catalogup;
	}
	public List<OpeCatlogModel> getChildren() {
		return children;
	}
	public void setChildren(List<OpeCatlogModel> children) {
		this.children = children;
	}			
	
}