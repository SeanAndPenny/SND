package com.wondersgroup.wszygl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.PlatLoginModel;

@Mapper
@Component
public interface PlatLoginDao extends BaseMybatisDao<PlatLoginModel, String> {

	public List<Map<String, Object>> getXtList();
	
}