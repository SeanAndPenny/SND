package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JtysModel;

@Component
@Mapper
public interface JtysJgxzDao extends BaseMybatisDao<JtysModel, String>{
	List<JtysModel>getJtysFwbXz(@Param(value="qyjgid") String qyjgid);
}
