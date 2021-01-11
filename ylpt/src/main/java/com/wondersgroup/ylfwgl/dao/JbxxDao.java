package com.wondersgroup.ylfwgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ylfwgl.model.JbxxModel;
import com.wondersgroup.ylfwgl.model.XdsjModel;
import com.wondersgroup.ylfwgl.model.YljgModel;

@Mapper
@Component
public interface JbxxDao extends BaseMybatisDao<JbxxModel, String> {
	
}