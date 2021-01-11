package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SslistModel;

@Mapper
@Component
public interface SsJbxzKsDao extends BaseMybatisDao<SslistModel,String>{
	List<SslistModel>	getssJbxzKs (@Param(value="ssjb") String ssjb,@Param(value="yljgdm") String yljgdm);
}
