package com.wondersgroup.commons.model;

import java.util.Date;

import com.wondersgroup.api.beans.persistence.BaseEntity;
import com.wondersgroup.api.commons.DateUtils;

@SuppressWarnings("serial")
public class TbAuthOrganization implements BaseEntity {
	private Long orgid;
	private String orgname;  //机构名称
	private String orgcode; //编码
	private String orgjc;   //简称
	private String orgsm;  //说明
	private TbAuthDicOrgType tbAuthDicOrgType; //机构类型

	private String status; //"0",待审核，"1",审核通过，"2"审核不通过
	private Date checkDate;//审核日期
	public Long getOrgid() {
		return orgid;
	}
	public void setOrgid(Long orgid) {
		this.orgid = orgid;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getOrgcode() {
		return orgcode;
	}
	public void setOrgcode(String orgcode) {
		this.orgcode = orgcode;
	}
	public String getOrgjc() {
		return orgjc;
	}
	public void setOrgjc(String orgjc) {
		this.orgjc = orgjc;
	}
	public String getOrgsm() {
		return orgsm;
	}
	public void setOrgsm(String orgsm) {
		this.orgsm = orgsm;
	}
	public TbAuthDicOrgType getTbAuthDicOrgType() {
		return tbAuthDicOrgType;
	}
	public void setTbAuthDicOrgType(TbAuthDicOrgType tbAuthDicOrgType) {
		this.tbAuthDicOrgType = tbAuthDicOrgType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	
	
}