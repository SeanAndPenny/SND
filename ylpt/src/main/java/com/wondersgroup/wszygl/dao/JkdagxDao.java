package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.model.JkdagxModel;
 

public interface JkdagxDao extends BaseMybatisDao<JkdagxModel,String>{
	List<YljgModel> getAllYljg(@Param(value="yljgdm") String yljgdm);
	 List<JkdagxModel> getJkdagxxx(@Param(value="yljgdm") String yljgdm,@Param(value="startdate") String startdate,
			   @Param(value="enddate") String enddate);
}
