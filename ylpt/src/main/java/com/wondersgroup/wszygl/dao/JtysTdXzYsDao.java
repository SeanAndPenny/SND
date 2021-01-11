package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JtysModel;
import com.wondersgroup.wszygl.model.SslistModel;
@Mapper
@Component
public interface JtysTdXzYsDao  extends BaseMybatisDao<JtysModel,String>{
	List<JtysModel>	getJtysTdXzYs (@Param(value="tdbh") String tdbh);
}
