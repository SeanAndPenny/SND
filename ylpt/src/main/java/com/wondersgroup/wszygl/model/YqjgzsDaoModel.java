package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class YqjgzsDaoModel implements BaseEntity {
   private String rs;//人数
   private String jcfl;//基层分类
   private String hospital_type;
   private String pid;
   private String id_name;
   private String unitname;
   private String  col_create_time;
   private String bus_address;
   private String link_person;
   private String jyxz;
   private String zl;
   private String bl;
   
   
public String getZl() {
	return zl;
}
public void setZl(String zl) {
	this.zl = zl;
}
public String getBl() {
	return bl;
}
public void setBl(String bl) {
	this.bl = bl;
}
public String getRs() {
	return rs;
}
public void setRs(String rs) {
	this.rs = rs;
}
public String getJcfl() {
	return jcfl;
}
public void setJcfl(String jcfl) {
	this.jcfl = jcfl;
}
public String getHospital_type() {
	return hospital_type;
}
public void setHospital_type(String hospital_type) {
	this.hospital_type = hospital_type;
}
public String getPid() {
	return pid;
}
public void setPid(String pid) {
	this.pid = pid;
}
public String getId_name() {
	return id_name;
}
public void setId_name(String id_name) {
	this.id_name = id_name;
}
public String getUnitname() {
	return unitname;
}
public void setUnitname(String unitname) {
	this.unitname = unitname;
}
public String getCol_create_time() {
	return col_create_time;
}
public void setCol_create_time(String col_create_time) {
	this.col_create_time = col_create_time;
}
public String getBus_address() {
	return bus_address;
}
public void setBus_address(String bus_address) {
	this.bus_address = bus_address;
}
public String getLink_person() {
	return link_person;
}
public void setLink_person(String link_person) {
	this.link_person = link_person;
}
public String getJyxz() {
	return jyxz;
}

@Override
public String toString() {
	return "YqjgzsDaoModel [rs=" + rs + ", jcfl=" + jcfl + ", hospital_type=" + hospital_type + ", pid=" + pid
			+ ", id_name=" + id_name + ", unitname=" + unitname + ", col_create_time=" + col_create_time
			+ ", bus_address=" + bus_address + ", link_person=" + link_person + ", jyxz=" + jyxz + ", zl=" + zl
			+ ", bl=" + bl + "]";
}
public void setJyxz(String jyxz) {
	this.jyxz = jyxz;
}
    

   
}
