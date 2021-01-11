package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GxqHmcModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
@Mapper
@Component
public interface GxqHmcDao extends BaseMybatisDao<GxqHmcModel,String>{
	List<GxqHmcModel>	getgGxqhmcList (@Param(value="yljgdm") String yljgdm,
			@Param(value="tbrq")	String tbrq);
	List<GxqHmcModel>	getZsGxqhmcList(@Param(value="yljgdm") String yljgdm,
			@Param(value="tbrq")	String tbrq);
	List<SwxxJgdmModel>	getjgList();
}
