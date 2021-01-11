package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class CkztModel implements BaseEntity {
  private String id;
  private String mc;
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
	return "CkztModel [id=" + id + ", mc=" + mc + "]";
}
  
}
