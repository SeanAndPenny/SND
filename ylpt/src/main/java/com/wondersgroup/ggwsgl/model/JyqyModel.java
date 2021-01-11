package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class JyqyModel implements BaseEntity{
	private String chargehospital;
	private String name;
	private String signtime;
	private String adddoctor;
	private String chargeteam;
	private String idno;
	private String address;
	private String phone;
	public String getChargehospital() {
		return chargehospital;
	}
	public void setChargehospital(String chargehospital) {
		this.chargehospital = chargehospital;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSigntime() {
		return signtime;
	}
	public void setSigntime(String signtime) {
		this.signtime = signtime;
	}
	public String getAdddoctor() {
		return adddoctor;
	}
	public void setAdddoctor(String adddoctor) {
		this.adddoctor = adddoctor;
	}
	public String getChargeteam() {
		return chargeteam;
	}
	public void setChargeteam(String chargeteam) {
		this.chargeteam = chargeteam;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
