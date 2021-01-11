package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JdtjModel;
 
@Mapper
@Component
public interface JdtjDao extends BaseMybatisDao<JdtjModel, String>{
	public JdtjModel getJdtj();
	public List<JdtjModel> getJdxx();
	public List<JdtjModel> getJdTjxxecharts();
	public List<JdtjModel> jdtjXzxx(@Param(value="jdlx")String jdlx);
}
