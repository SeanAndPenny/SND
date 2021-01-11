package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class McpzModel implements BaseEntity {
	  private String mc;
	  private String lj;
	  private String ywzw;
	  private String ywbz;
	  private String ljyxbz;
	  
	public String getLjyxbz() {
		return ljyxbz;
	}
	public void setLjyxbz(String ljyxbz) {
		this.ljyxbz = ljyxbz;
	}
	public String getYwzw() {
		return ywzw;
	}
	public void setYwzw(String ywzw) {
		this.ywzw = ywzw;
	}
	public String getLj() {
		return lj;
	}
	public void setLj(String lj) {
		this.lj = lj;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getMc() {
		return mc;
	}
	public void setMc1(String mc) {
		this.mc = mc;
	}
	public String getYwbz() {
		return ywbz;
	}
	public void setYwbz(String ywbz) {
		this.ywbz = ywbz;
	}
	@Override
	public String toString() {
		return "McpzModel [mc=" + mc + ", lj=" + lj + ", ywzw=" + ywzw + ", ywbz=" + ywbz + ", ljyxbz=" + ljyxbz + "]";
	}
	 
	 
	  
	 
} 
