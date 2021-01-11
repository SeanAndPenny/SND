package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.AreaModel;

@Mapper
@Component
public interface AreaDao extends BaseMybatisDao<AreaModel, String> {

	List<AreaModel> getAll();

	AreaModel getOneByCode(@Param(value="code")String code);

	void insertOne(AreaModel newAreaModel);
	
}