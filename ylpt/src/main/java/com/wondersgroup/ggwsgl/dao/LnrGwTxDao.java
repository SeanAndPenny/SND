package com.wondersgroup.ggwsgl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.LnrGwTxModel;

@Mapper
@Component
public interface LnrGwTxDao extends BaseMybatisDao<LnrGwTxModel,String>{

}
