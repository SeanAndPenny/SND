package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Mapper
@Component
public interface LnrGxyTnbXzDao extends BaseMybatisDao<LnrModel,String>{
	List<LnrModel>	getLnrGxyTnbXz (
			 @Param(value="startdate") String startdate,
			 @Param(value="enddate") String enddate, 
			 @Param(value="yljgdm") String yljgdm
			);
}
