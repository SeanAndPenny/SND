package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.AreaSqjlModel;

@Mapper
@Component
public interface AreaSqjlDao extends BaseMybatisDao<AreaSqjlModel, String> {
	public  AreaSqjlModel getById(@Param(value="id")String id);
	public int update(AreaSqjlModel areaSqjlModel);
	public int delete(AreaSqjlModel areaSqjlModel);
	public void exculeSql(@Param(value="updateSql")String updateSql);
}