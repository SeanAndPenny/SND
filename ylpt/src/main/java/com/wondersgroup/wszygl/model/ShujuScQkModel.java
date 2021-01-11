package com.wondersgroup.wszygl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;
@SuppressWarnings("serial")
public class ShujuScQkModel implements BaseEntity {
	private String zwm;//表中文名
	private String ywm;//表英文名
	private String ywlx;//业务类型
	private String jlgxsj;//记录更新时间
	private String dbjg;//对比结果
	private String sjc;//时间差
	private String jg;//对比结果
	private String ywsj;//
	private String ywlxmc;//业务类型名称
	
	
	public String getYwsj() {
		return ywsj;
	}

	public void setYwsj(String ywsj) {
		this.ywsj = ywsj;
	}

	public String getYwlxmc() {
		return ywlxmc;
	}

	public void setYwlxmc(String ywlxmc) {
		this.ywlxmc = ywlxmc;
	}

	@Override
	public String toString() {
		return "ShujuScQkModel [zwm=" + zwm + ", ywm=" + ywm + ", ywlx=" + ywlx + ", jlgxsj=" + jlgxsj + ", dbjg="
				+ dbjg + ", sjc=" + sjc + ", jg=" + jg + "]";
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getSjc() {
		return sjc;
	}
	public void setSjc(String sjc) {
		this.sjc = sjc;
	}
	public String getZwm() {
		return zwm;
	}
	public void setZwm(String zwm) {
		this.zwm = zwm;
	}
	public String getYwm() {
		return ywm;
	}
	public void setYwm(String ywm) {
		this.ywm = ywm;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getJlgxsj() {
		return jlgxsj;
	}
	public void setJlgxsj(String jlgxsj) {
		this.jlgxsj = jlgxsj;
	}
	public String getDbjg() {
		return dbjg;
	}
	public void setDbjg(String dbjg) {
		this.dbjg = dbjg;
	}
	 
	
}
