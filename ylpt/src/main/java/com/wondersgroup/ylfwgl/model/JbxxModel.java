package com.wondersgroup.ylfwgl.model;


import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 基本信息（CEN_CORE_V20.JKDA_GR_JBXX）
 * */
@SuppressWarnings("serial")
public class JbxxModel implements BaseEntity {
	private String yljgdm;//医疗机构代码
	private String jlbh;//记录编号
	private String jtbh;//家庭编号
	private String grbh;//个人编号
	private String jbxx_xm;//基本信息_姓名
	private String jbxx_xb;//基本信息_性别
	private String jbxx_csrq;//基本信息_出生日期
	private String jbxx_sfzh;//基本信息_身份证号
	private String jbxx_gzdw;//基本信息_工作单位
	private String jbxx_brdh;//基本信息_本人电话
	private String jbxx_lxrxm;//基本信息_联系人姓名
	private String jbxx_lxrdh;//基本信息_联系人电话	
	private String jbxx_mz;//基本信息_民族		
	private String etlbz;//个档完整性：1、完整；2、不完整
	private String etlbzxx;
	
	public String getYljgdm() {
		return yljgdm;
	}
	public void setYljgdm(String yljgdm) {
		this.yljgdm = yljgdm;
	}
	public String getJlbh() {
		return jlbh;
	}
	public void setJlbh(String jlbh) {
		this.jlbh = jlbh;
	}
	public String getJtbh() {
		return jtbh;
	}
	public void setJtbh(String jtbh) {
		this.jtbh = jtbh;
	}
	public String getGrbh() {
		return grbh;
	}
	public void setGrbh(String grbh) {
		this.grbh = grbh;
	}
	public String getJbxx_xm() {
		return jbxx_xm;
	}
	public void setJbxx_xm(String jbxx_xm) {
		this.jbxx_xm = jbxx_xm;
	}
	public String getJbxx_xb() {
		return jbxx_xb;
	}
	public void setJbxx_xb(String jbxx_xb) {
		this.jbxx_xb = jbxx_xb;
	}
	public String getJbxx_csrq() {
		return jbxx_csrq;
	}
	public void setJbxx_csrq(String jbxx_csrq) {
		this.jbxx_csrq = jbxx_csrq;
	}
	public String getJbxx_sfzh() {
		return jbxx_sfzh;
	}
	public void setJbxx_sfzh(String jbxx_sfzh) {
		this.jbxx_sfzh = jbxx_sfzh;
	}
	public String getJbxx_gzdw() {
		return jbxx_gzdw;
	}
	public void setJbxx_gzdw(String jbxx_gzdw) {
		this.jbxx_gzdw = jbxx_gzdw;
	}
	public String getJbxx_brdh() {
		return jbxx_brdh;
	}
	public void setJbxx_brdh(String jbxx_brdh) {
		this.jbxx_brdh = jbxx_brdh;
	}
	public String getJbxx_lxrxm() {
		return jbxx_lxrxm;
	}
	public void setJbxx_lxrxm(String jbxx_lxrxm) {
		this.jbxx_lxrxm = jbxx_lxrxm;
	}
	public String getJbxx_lxrdh() {
		return jbxx_lxrdh;
	}
	public void setJbxx_lxrdh(String jbxx_lxrdh) {
		this.jbxx_lxrdh = jbxx_lxrdh;
	}
	public String getJbxx_mz() {
		return jbxx_mz;
	}
	public void setJbxx_mz(String jbxx_mz) {
		this.jbxx_mz = jbxx_mz;
	}
	public String getEtlbz() {
		return etlbz;
	}
	public void setEtlbz(String etlbz) {
		this.etlbz = etlbz;
	}
	public String getEtlbzxx() {
		return etlbzxx;
	}
	public void setEtlbzxx(String etlbzxx) {
		this.etlbzxx = etlbzxx;
	}
	
	

}