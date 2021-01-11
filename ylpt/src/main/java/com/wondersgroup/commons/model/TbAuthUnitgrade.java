package com.wondersgroup.commons.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;


@SuppressWarnings("serial")
public class TbAuthUnitgrade implements BaseEntity {
	private String gradekey;
	private String gradename;
	public String getGradekey() {
		return gradekey;
	}
	public void setGradekey(String gradekey) {
		this.gradekey = gradekey;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	
}