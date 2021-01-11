package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.BasycxModel;
@Mapper
@Component
public interface BasscxDao extends BaseMybatisDao<BasycxModel,String>{
	public List<BasycxModel>getBassechats(@Param(value="basskssj") String basskssj,
			@Param(value="bassjssj") String bassjssj, 
			@Param(value="bassjgdm") String bassjgdm);
	
	
	public List<BasycxModel>getBassxz(
			@Param(value="kssj") String kssj,
			@Param(value="jssj") String jssj, 
			@Param(value="jgdm") String jgdm,
			@Param(value="ssbm") String ssbm);
}
