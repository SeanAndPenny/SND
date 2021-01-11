package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class ZwbmModel implements BaseEntity {
	private String zwbm;

	public String getZwbm() {
		return zwbm;
	}

	public void setZwbm(String zwbm) {
		this.zwbm = zwbm;
	}

	@Override
	public String toString() {
		return "ZwbmModel [zwbm=" + zwbm + "]";
	}
	

}
