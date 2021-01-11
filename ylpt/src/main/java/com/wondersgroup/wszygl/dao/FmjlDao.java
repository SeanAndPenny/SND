package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CsrsModel;
 
 
@Mapper
@Component
public interface FmjlDao extends BaseMybatisDao<CsrsModel,String>{
	List<CsrsModel>	getFmcxList (@Param(value="yljgdm") String yljgdm,
			@Param(value="hjbz2")	String hjbz2);
	List<CsrsModel>	getFmxzJgList(@Param(value="hjbz") String hjbz );
	CsrsModel getFmtj();
}
