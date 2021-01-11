package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.RyzxtModel;

@Mapper
@Component
public interface RyxzDao  extends BaseMybatisDao<RyzxtModel,String>{
	List<RyzxtModel>getRyjg(@Param(value="jb")String jb,@Param(value="zc")String zc);
}
