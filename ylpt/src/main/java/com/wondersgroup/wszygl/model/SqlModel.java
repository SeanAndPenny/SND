package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class SqlModel implements BaseEntity {
  private String rwid;

public String getRwid() {
	return rwid;
}

public void setRwid(String rwid) {
	this.rwid = rwid;
}
  
}
