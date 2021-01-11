package com.wondersgroup.commons.model;

import java.util.List;

import com.wondersgroup.api.beans.persistence.BaseEntity;


/**
 * 
 * */
@SuppressWarnings("serial")
public class TbAuthResourceTree implements BaseEntity, Comparable<TbAuthResourceTree> {
	private String resid;
	private String presid;
	private String resname;
	private String keyword;
	private String url;
	private String comments;
	private Long resLevel;
	private String treelayer;
	private List<TbAuthResource> childs;
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
	public Long getResLevel() {
		return resLevel;
	}
	public void setResLevel(Long resLevel) {
		this.resLevel = resLevel;
	}
	public String getTreelayer() {
		return treelayer;
	}
	public void setTreelayer(String treelayer) {
		this.treelayer = treelayer;
	}
	public String getPresid() {
		return presid;
	}
	public void setPresid(String presid) {
		this.presid = presid;
	}
	public List<TbAuthResource> getChilds() {
		return childs;
	}
	public void setChilds(List<TbAuthResource> childs) {
		this.childs = childs;
	}
	@Override
	public int compareTo(TbAuthResourceTree o) {
			if(o.getTreelayer()!=null&&getTreelayer()!=null)
		return getTreelayer().compareTo(o.getTreelayer());
				return 0;
				
	}
	
	
}