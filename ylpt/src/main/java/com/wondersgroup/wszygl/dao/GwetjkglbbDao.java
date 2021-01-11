package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GwetjkglbbModel;
 
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Mapper
@Component
public interface GwetjkglbbDao extends BaseMybatisDao<GwetjkglbbModel,String>{
	List<YljgModel> getAllYljg(@Param(value="yljgdm")String yljgdm);
	List<TbjdpzModel>getAllJd();
	List<GwetjkglbbModel> findAll(@Param(value="enddate") String enddate,
			   @Param(value="yljgdm") String yljgdm);
}
