package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.GwsjtbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;
@Mapper
@Component
public interface GwsjtbDao  extends BaseMybatisDao<GwsjtbModel,String>{
	List<YljgModel> getAllYljg(@Param(value="yljgdm") String yljgdm);
	TbjdpzModel gePz(@Param(value="pz") String pz);
	int getCkrksl(@Param(value="yljgdm") String yljgdm,
			      @Param(value="enddate")String enddate,
			      @Param(value="pz") String pz);
	void updateRksl(@Param(value="yljgdm")String yljgdm,
			        @Param(value="rksl")String rksl,
			        @Param(value="enddate")String enddate,
			        @Param(value="pz")String pz,
			        @Param(value="xm") String xm);
	void saveHt(@Param(value="yljgdm")String yljgdm,
	        @Param(value="rksl")String rksl,
	        @Param(value="enddate")String enddate,
	        @Param(value="pz")String pz,
	        @Param(value="xm") String xm);
	List<TbjdpzModel> getAllpz();
}
