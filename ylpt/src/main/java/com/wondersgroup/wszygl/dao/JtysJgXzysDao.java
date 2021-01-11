package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JtysModel;
@Mapper
@Component
public interface JtysJgXzysDao extends BaseMybatisDao<JtysModel,String>{
	List<JtysModel>	getJtysJgXzys (@Param(value="tdbh") String tdbh,
			@Param(value="qyjgid") String qyjgid);
}
