package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Mapper
@Component
public interface YyssbmDao extends BaseMybatisDao<SsbmyljgModel,String> {
	List<YljgModel> getAllYljg(@Param(value="yljgdm")String yljgdm);
}
