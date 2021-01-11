package com.wondersgroup.ggwsgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.TjxxDetailModel;
import com.wondersgroup.ggwsgl.model.TjxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Mapper
@Component
public interface TjxxDao extends BaseMybatisDao<TjxxModel,String>{
	
	List<YljgModel> getAllYljg();
	List<TbModel>getAllTb(@Param(value="yljgdm")String yljgdm,@Param(value="startdate")String startdate,@Param(value="enddate")String enddate);
	List<TjxxDetailModel>getTjxxDetail(@Param(value="tjbh")String tjbh,@Param(value="yljgdm")String yljgdm);
}
