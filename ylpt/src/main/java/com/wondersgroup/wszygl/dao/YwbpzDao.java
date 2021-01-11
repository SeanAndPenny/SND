package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YwbpzModel;

@Mapper
@Component
public interface YwbpzDao extends BaseMybatisDao<YwbpzModel,String> {

}
