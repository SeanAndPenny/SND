package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 
 * */
@SuppressWarnings("serial")
public class YyjsModel implements BaseEntity {
	private String xh;			
	private String jsxmmc;
	private String zddjyq;
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getJsxmmc() {
		return jsxmmc;
	}
	public void setJsxmmc(String jsxmmc) {
		this.jsxmmc = jsxmmc;
	}
	public String getZddjyq() {
		return zddjyq;
	}
	public void setZddjyq(String zddjyq) {
		this.zddjyq = zddjyq;
	}

	
	
}