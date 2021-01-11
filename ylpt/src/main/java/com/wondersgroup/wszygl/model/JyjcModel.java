package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 处方点评
 * */
@SuppressWarnings("serial")
public class JyjcModel implements BaseEntity {
	private String yljgdm;
	private String checkserialnum;
	private String diagrptid;
	private String patientname;
	private String idnumber;
	private String studytime;
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getCheckserialnum() {
		return checkserialnum;
	}
	public void setCheckserialnum(String checkserialnum) {
		this.checkserialnum = checkserialnum;
	}
	public String getDiagrptid() {
		return diagrptid;
	}
	public void setDiagrptid(String diagrptid) {
		this.diagrptid = diagrptid;
	}
	public String getPatientname() {
		return patientname;
	}
	public void setPatientname(String patientname) {
		this.patientname = patientname;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public String getStudytime() {
		return studytime;
	}
	public void setStudytime(String studytime) {
		this.studytime = studytime;
	}
	
	
	
	
}