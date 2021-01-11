package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CwtjModel;
 
@Component
@Mapper
public interface CwtjXzJgDao  extends BaseMybatisDao<CwtjModel, String>{
	public List<CwtjModel>getCwtjXzJg(@Param(value="id") String id);
}
