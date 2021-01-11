package com.wondersgroup.ylfwgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ylfwgl.model.XdsjModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Mapper
@Component
public interface XdsjDao extends BaseMybatisDao<XdsjModel, String> {

	List<YljgModel> getAllYljg();
	YljgModel getByYljgdm(@Param(value="yljgdm")String yljgdm);
	
}