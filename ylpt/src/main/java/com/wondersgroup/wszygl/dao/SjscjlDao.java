package com.wondersgroup.wszygl.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.github.pagehelper.Page;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SjscInfo;

@Mapper
@Component
public interface SjscjlDao extends BaseMybatisDao<SjscInfo, String>{

	public List<Map<String, Object>> getAllYljg();

	public Page<SjscInfo> getData(Map<String, Object> filters);

	public List<Map<String, Object>> gatAllTable();


}
