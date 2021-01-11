package com.wondersgroup.ggwsgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.JyqyModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Mapper
@Component
public interface JyqyDao extends BaseMybatisDao<JyqyModel,String>{
	
	List<YljgModel> getAllYljg();
	List<TbModel>getAllTb(@Param(value="yljgdm")String yljgdm,@Param(value="startdate")String startdate,@Param(value="enddate")String enddate);
}
