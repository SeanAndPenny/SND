package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;

@Mapper
@Component
public interface WcxzDao extends BaseMybatisDao<YqjgzsDaoModel, String> {

}
