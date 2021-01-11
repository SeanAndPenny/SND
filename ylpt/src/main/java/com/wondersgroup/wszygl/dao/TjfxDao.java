package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.TjModel;
import com.wondersgroup.wszygl.model.TjxxModel;

@Mapper
@Component
public interface TjfxDao extends BaseMybatisDao<TjxxModel,String>{
	TjModel    getTjbgdbh( 
			 @Param(value="yljgdm") String yljgdm,
			 @Param(value="tjbh") String tjbh);
	  
	 List <TjModel>   getTjbgdbhList( 
				 @Param(value="yljgdm") String yljgdm,
				 @Param(value="tjbh") String tjbh);
}
