package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GwtnbglbbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Mapper
@Component
public interface GwtnbglbbDao extends BaseMybatisDao<GwtnbglbbModel,String>{
	List<YljgModel> getAllYljg(@Param(value="yljgdm")String yljgdm);
	List<TbjdpzModel>getAllJd();
	List<GwtnbglbbModel> findAll(@Param(value="enddate2") String enddate2,
			   @Param(value="yljgdm") String yljgdm);
	

	int getCkrksl(@Param(value="yljgdm")String yljgdm,
			@Param(value="enddate")String enddate);

	void  updateRksl(@Param(value="yljgdm")String yljgdm,
			@Param(value="rksl")String rksl,
			@Param(value="enddate")String enddate);
	
	void  saveHt(@Param(value="yljgdm")String yljgdm,
			@Param(value="rksl")String rksl,
			@Param(value="enddate")String enddate);
	

}
