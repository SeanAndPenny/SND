package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 
 * */
@SuppressWarnings("serial")
public class SsbmyljgModel implements BaseEntity {
	private String yljgdm;			
	private String yljgmc;
	private String ssmc;
	private String ssbm;
	private List<SsbmyljgModel> children;
	
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getYljgmc() {
		return yljgmc;
	}
	public void setYljgmc(String yljgmc) {
		this.yljgmc = yljgmc;
	}
	public List<SsbmyljgModel> getChildren() {
		return children;
	}
	public void setChildren(List<SsbmyljgModel> children) {
		this.children = children;
	}
	public String getSsmc() {
		return ssmc;
	}
	public void setSsmc(String ssmc) {
		this.ssmc = ssmc;
	}
	public String getSsbm() {
		return ssbm;
	}
	public void setSsbm(String ssbm) {
		this.ssbm = ssbm;
	}			
	
}