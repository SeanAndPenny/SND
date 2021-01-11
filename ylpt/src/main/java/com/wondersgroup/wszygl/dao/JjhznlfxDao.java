package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;
@Mapper
@Component
public interface JjhznlfxDao extends BaseMybatisDao<JjsjFxModel,String>{
	List<JjsjFxModel>	getJjhznlfxList (
			 @Param(value="startdate") String startdate,@Param(value="enddate") String enddate
			);
}
