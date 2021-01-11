package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;

@Mapper
@Component
public interface GxyXyXzDao extends BaseMybatisDao<GxysjfxModel,String>{
	List<GxysjfxModel>	getGxyXyXzList (
			 @Param(value="startdate") String startdate,
			 @Param(value="enddate") String enddate,
			 @Param(value="sfxy") String sfxy,
			 @Param(value="yljgdm") String yljgdm
			);
}
