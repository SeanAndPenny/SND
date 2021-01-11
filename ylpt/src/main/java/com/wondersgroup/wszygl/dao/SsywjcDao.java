package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.model.RylbModel;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Mapper
@Component
public interface SsywjcDao extends BaseMybatisDao<SsywjcModel,String>{
	List<RylbModel> getRylb();
	List<RylbModel>getSslbcx();
    List<SsywjcModel> getSsywjcechats(@Param(value="ywkssj") String ywkssj,
    		@Param(value="ywjssj") String ywjssj
    		);
    List<SsywjcModel>  getSsywjcjg(@Param(value="rq") String rq);
    List<SsywjcModel>getSsywzs(@Param(value="ywkssj") String ywkssj,
    		@Param(value="ywjssj") String ywjssj,@Param(value="bz") String bz);
}
