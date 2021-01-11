package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class TbjdpzModel implements BaseEntity {
  private String id;
  private String mc;
  private String tjbm;
  
public String getTjbm() {
	return tjbm;
}
public void setTjbm(String tjbm) {
	this.tjbm = tjbm;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getMc() {
	return mc;
}
public void setMc(String mc) {
	this.mc = mc;
}
@Override
public String toString() {
	return "TbjdpzModel [id=" + id + ", mc=" + mc + "]";
}
  
}
