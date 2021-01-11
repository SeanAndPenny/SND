package com.wondersgroup.wszygl.dao;
 
import java.util.HashMap;
import java.util.List;
 

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SqlModel;
 
@Component
@Mapper
public interface SqlYjcxDao extends BaseMybatisDao<SqlModel, String>{
	List<HashMap<String, Object>>  getsqlyjcx(@Param(value="sqlbk") String sqlbk);
}
