package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JtysModel;

@Mapper
@Component
public interface JtysFwbXzTdDao extends BaseMybatisDao<JtysModel,String>{
	List<JtysModel>	getJtysFwbXzTd (@Param(value="qyjgid") String qyjgid,
		 @Param(value="fwbid") String fwbid);
}
