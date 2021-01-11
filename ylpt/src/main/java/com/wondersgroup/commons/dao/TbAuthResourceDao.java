package com.wondersgroup.commons.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.commons.model.TbAuthResource;

@Mapper
@Component
public interface TbAuthResourceDao extends BaseMybatisDao<TbAuthResource, String> {
	public List<TbAuthResource> getResourceByUser(@Param(value="loginname")String loginname);
	public List<TbAuthResource> getResourceByUnit(@Param(value="loginname")String loginname);
	public List<TbAuthResource> getResourceByOrg(@Param(value="loginname")String loginname);
	public List<TbAuthResource> getResourceByRole(@Param(value="loginname")String loginname);
	public List<TbAuthResource> getResourceByKeyword(@Param(value="keyword")String keyword);
}