package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CwtjModel;
@Mapper
@Component
public interface CwtjDao extends BaseMybatisDao<CwtjModel,String>{
	 public List<CwtjModel>getCwbxt();
	 public List<CwtjModel>getCwtj();
}
