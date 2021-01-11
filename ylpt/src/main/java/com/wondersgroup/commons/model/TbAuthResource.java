package com.wondersgroup.commons.model;

import com.wondersgroup.api.beans.persistence.BaseEntity;


/**
 * 菜单资源(TB_AUTH_RESOURCE)
 * */
@SuppressWarnings("serial")
public class TbAuthResource implements BaseEntity,Comparable<TbAuthResource> {
	private String resid;
	private String presid;
	private String resname;
	private String keyword;
	private String url;
	private String comments;
	private Long res_level;
	private String tree_layer;
	public String getResid() {
		return resid;
	}
	public void setResid(String resid) {
		this.resid = resid;
	}
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Long getRes_level() {
		return res_level;
	}
	public void setRes_level(Long res_level) {
		this.res_level = res_level;
	}
	public String getTree_layer() {
		return tree_layer;
	}
	public void setTree_layer(String tree_layer) {
		this.tree_layer = tree_layer;
	}
	public String getPresid() {
		return presid;
	}
	public void setPresid(String presid) {
		this.presid = presid;
	}
	@Override
	public int compareTo(TbAuthResource o) {
		
		return getTree_layer().compareTo(o.getTree_layer());
	}
	
	
}