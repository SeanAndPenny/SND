package com.wondersgroup.ggwsgl.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;

@SuppressWarnings("serial")
public class FyjkModel implements BaseEntity{
	private String hzxm;//姓名
	private String sfzh;//姓名
	private String csrq;//出生日期
	private String lxdh;//类型电话
	private String bysfy;//地址
	private String cdoctorreporgname;//建卡机构
	private String preregtime;//建卡时间
	private String ijcyz;//孕周
	private String dycrq;//预产期
	public String getHzxm() {
		return hzxm;
	}
	public void setHzxm(String hzxm) {
		this.hzxm = hzxm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public String getCsrq() {
		return csrq;
	}
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	
	public String getBysfy() {
		return bysfy;
	}
	public void setBysfy(String bysfy) {
		this.bysfy = bysfy;
	}
	public String getCdoctorreporgname() {
		return cdoctorreporgname;
	}
	public void setCdoctorreporgname(String cdoctorreporgname) {
		this.cdoctorreporgname = cdoctorreporgname;
	}
	public String getPreregtime() {
		return preregtime;
	}
	public void setPreregtime(String preregtime) {
		this.preregtime = preregtime;
	}
	public String getIjcyz() {
		return ijcyz;
	}
	public void setIjcyz(String ijcyz) {
		this.ijcyz = ijcyz;
	}
	public String getDycrq() {
		return dycrq;
	}
	public void setDycrq(String dycrq) {
		this.dycrq = dycrq;
	}
		
}
