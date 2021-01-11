package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.RyzxtModel;

public interface RyxzksDao extends BaseMybatisDao<RyzxtModel,String>{
	List<RyzxtModel>getRyjg(@Param(value="jb")String jb,@Param(value="zc")String zc,
			@Param(value="jgdm")String jgdm);
   
}
