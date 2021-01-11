package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Param;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CszmModel;
 

public interface CszmDao extends BaseMybatisDao<CszmModel,String>{
	CszmModel getCszm(@Param(value="cszm") String cszm );
}
