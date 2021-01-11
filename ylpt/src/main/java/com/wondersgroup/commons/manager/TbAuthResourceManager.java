package com.wondersgroup.commons.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.dao.TbAuthResourceDao;
import com.wondersgroup.commons.model.TbAuthResource;

@Component
public class TbAuthResourceManager extends BaseMybatisManager<TbAuthResource, String> {

	@Autowired
	private TbAuthResourceDao tbAuthResourceDao;

	@Override
	public BaseMybatisDao<TbAuthResource, String> getBaseDao() {
		return tbAuthResourceDao;
	}
	public List<TbAuthResource> getResourceByUser(String loginname){
		return tbAuthResourceDao.getResourceByUser(loginname);
	};
	public List<TbAuthResource> getResourceByUnit(String loginname){
		return tbAuthResourceDao.getResourceByUnit(loginname);
	};
	public List<TbAuthResource> getResourceByOrg(String loginname){
		return tbAuthResourceDao.getResourceByOrg(loginname);
	};
	public List<TbAuthResource> getResourceByRole(String loginname){
		return tbAuthResourceDao.getResourceByRole(loginname);
	};
	public List<TbAuthResource> getResourceByKeyword(String keyword){
		return tbAuthResourceDao.getResourceByKeyword(keyword);
	};
}