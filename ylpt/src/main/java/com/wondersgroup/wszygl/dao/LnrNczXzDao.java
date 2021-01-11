package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Mapper
@Component
public interface LnrNczXzDao extends BaseMybatisDao<LnrModel,String>{
	List<LnrModel>	getLnrNczXz (
			 @Param(value="startdate") String startdate,
			 @Param(value="enddate") String enddate, 
			 @Param(value="yljgdm") String yljgdm
			);
}
