package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YzbfxModel;
@Mapper
@Component
public interface YzbfxDao  extends  BaseMybatisDao<YzbfxModel,String>{
	List<YzbfxModel> getyzbtj(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
            
			);
	List<YzbfxModel> getzyyzbtj(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
            
			);
	List<YzbfxModel> getyzbJgfx(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
            
			);
	List<YzbfxModel>getyzbJcfx(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	List<YzbfxModel>getechar05(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj, 
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	String getMinSwsj();
	String getMaxSwsj();
}
