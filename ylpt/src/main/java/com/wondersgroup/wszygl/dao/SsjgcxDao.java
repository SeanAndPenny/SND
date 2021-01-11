package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SslistModel;
@Component
@Mapper
public interface SsjgcxDao extends BaseMybatisDao<SslistModel, String>{
	 public List<SslistModel> getSsjg();
}
