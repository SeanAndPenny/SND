package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.AreaModel;
import com.wondersgroup.wszygl.model.JkdaLogModel;
import com.wondersgroup.wszygl.model.JkdaTjModel;

@Mapper
@Component
public interface JkdaTjDao extends BaseMybatisDao<JkdaTjModel, String> {

	
	
}