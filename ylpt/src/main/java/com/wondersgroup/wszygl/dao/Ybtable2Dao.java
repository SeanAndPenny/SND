package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Mapper
@Component
public interface Ybtable2Dao extends BaseMybatisDao<YbFytjModel,String> {

}
