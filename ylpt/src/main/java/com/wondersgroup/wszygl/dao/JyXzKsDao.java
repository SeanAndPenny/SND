package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JyModel;

@Mapper
@Component
public interface JyXzKsDao extends BaseMybatisDao<JyModel,String>{
	 List<JyModel>  getJyXzKs(@Param(value="sfws") String sfws,
			 @Param(value="yljgdm") String yljgdm);
}
