package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 手术目录表（TB_OPE_CATALOG）
 * */
@SuppressWarnings("serial")
public class OperationCatalogModel implements BaseEntity {
	private  String id;//目录id
	private String catalogname;//目录名称
	private String cataloglevel;//目录级别
	private String catalogup;//上级目录
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCatalogname() {
		return catalogname;
	}
	public void setCatalogname(String catalogname) {
		this.catalogname = catalogname;
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
}