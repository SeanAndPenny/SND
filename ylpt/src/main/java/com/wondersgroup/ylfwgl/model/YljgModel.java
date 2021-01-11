package com.wondersgroup.ylfwgl.model;



import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 医疗机构数据
 * */
@SuppressWarnings("serial")
public class YljgModel implements BaseEntity {
	private String jgdm;//医疗机构代码
	private String jgmc;//机构名称
	public String getJgdm() {
		return jgdm;
	}
	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}
	public String getJgmc() {
		return jgmc;
	}
	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}
	
}