package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JgdagxxxModel;

@Mapper
@Component
public interface JgdagxxxDao  extends BaseMybatisDao<JgdagxxxModel,String>{

}
