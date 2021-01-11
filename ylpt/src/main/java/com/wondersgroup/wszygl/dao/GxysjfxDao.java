package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;

@Mapper
@Component
public interface GxysjfxDao extends BaseMybatisDao<GxysjfxModel,String>{
	List<GxysjfxModel>	getGxysjLyfx (
			 @Param(value="startdate") String startdate,@Param(value="enddate") String enddate
			 ,@Param(value="yljgdm") String yljgdm);
	
	List<GxysjfxModel>	getGxyXyfxList (
			 @Param(value="startdate") String startdate,@Param(value="enddate") String enddate
			 ,@Param(value="yljgdm") String yljgdm);
	List<GxysjfxModel>	getGxyWxFcList(
			 @Param(value="startdate") String startdate,@Param(value="enddate") String enddate
			 ,@Param(value="yljgdm") String yljgdm);
	
	List<GxysjfxModel> getGxyNlFx(
			 @Param(value="startdate") String startdate,@Param(value="enddate") String enddate
			, @Param(value="yljgdm") String yljgdm);
}
