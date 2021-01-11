package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.BasycxModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
@Mapper
@Component
public interface BasycxDao extends BaseMybatisDao<BasycxModel,String>{
	public List<BasycxModel>getBasycxechats(@Param(value="kssj") String kssj,
			@Param(value="jssj") String jssj, 
			@Param(value="bajgdm") String bajgdm);
	public List<YljgMcModel> getAllYljg();
	
	public List<BasycxModel>getBasyxz(
			@Param(value="kssj") String kssj,
			@Param(value="jssj") String jssj, 
			@Param(value="jbdm") String jbdm,
			@Param(value="bajgdm") String bajgdm);
}
