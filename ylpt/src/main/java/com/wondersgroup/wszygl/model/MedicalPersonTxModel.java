package com.wondersgroup.wszygl.model;


import com.wondersgroup.api.beans.persistence.BaseEntity;

/**
 * 人事合同提醒记录表（T_JSQY_TX）
 * */
@SuppressWarnings("serial")
public class MedicalPersonTxModel implements BaseEntity {
	private String id;//id
	private String personid;//
	private String txdate;// 提醒日期
	private String removed;//删除标志 0 有效 1无效
	private String txcs;//提醒次数
	private String txnr;//提醒内容
	
	
	
	public String getTxnr() {
		return txnr;
	}
	public void setTxnr(String txnr) {
		this.txnr = txnr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPersonid() {
		return personid;
	}
	public void setPersonid(String personid) {
		this.personid = personid;
	}
	public String getTxdate() {
		return txdate;
	}
	public void setTxdate(String txdate) {
		this.txdate = txdate;
	}
	public String getRemoved() {
		return removed;
	}
	public void setRemoved(String removed) {
		this.removed = removed;
	}
	public String getTxcs() {
		return txcs;
	}
	public void setTxcs(String txcs) {
		this.txcs = txcs;
	}
	

}