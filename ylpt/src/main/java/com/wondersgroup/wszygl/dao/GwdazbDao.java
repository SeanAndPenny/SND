package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
 
import com.wondersgroup.wszygl.model.YljgModel;
import com.wondersgroup.wszygl.model.jmjkdagltjbbModel;

@Mapper
@Component
public interface GwdazbDao extends BaseMybatisDao<jmjkdagltjbbModel,String>{
	List<YljgModel> getAllYljg(@Param(value="yljgdm")String yljgdm);
	List<jmjkdagltjbbModel> findAll(@Param(value="enddate") String enddate,
			   @Param(value="yljgdm") String yljgdm);
	void saveHt(@Param(value="yljgdm") String yljgdm,
			   @Param(value="rksl") String rksl,
			   @Param(value="enddate") String enddate);
	int getCkrksl( @Param(value="yljgdm") String yljgdm,
			@Param(value="enddate") String enddate);
	
	void updateRksl(@Param(value="yljgdm") String yljgdm,
			   @Param(value="rksl") String rksl,
			   @Param(value="enddate") String enddate);
}
