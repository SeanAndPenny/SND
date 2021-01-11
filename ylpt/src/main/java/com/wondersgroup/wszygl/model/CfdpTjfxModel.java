package com.wondersgroup.wszygl.model;


import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 
 * */
@SuppressWarnings("serial")
public class CfdpTjfxModel implements BaseEntity {
	private String yljgdm;			
	private String jgmc;			
	private int zs;			
	private int dps;
	private int hgs;
	private int bhgs;
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getJgmc() {
		return jgmc;
	}
	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}
	public int getZs() {
		return zs;
	}
	public void setZs(int zs) {
		this.zs = zs;
	}
	public int getDps() {
		return dps;
	}
	public void setDps(int dps) {
		this.dps = dps;
	}
	public int getBhgs() {
		return bhgs;
	}
	public void setBhgs(int bhgs) {
		this.bhgs = bhgs;
	}
	public int getHgs() {
		return hgs;
	}
	public void setHgs(int hgs) {
		this.hgs = hgs;
	}
	
}