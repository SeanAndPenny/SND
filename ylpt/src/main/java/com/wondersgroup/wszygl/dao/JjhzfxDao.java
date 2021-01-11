package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Mapper
@Component
public interface JjhzfxDao extends  BaseMybatisDao<JjsjFxModel,String>{
	List<JjsjFxModel> getchart01List(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj
            ,@Param(value="jgdm")  String jgdm
			);
	List<JjsjFxModel> getchart02List(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj
            ,@Param(value="jgdm")  String jgdm
			);
	List<JjsjFxModel> getchart03List(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj
            ,@Param(value="jgdm")  String jgdm
			);
	List<JjsjFxModel> getchart04List(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj
            ,@Param(value="jgdm")  String jgdm
			);
	List<JjsjFxModel> getchart05List(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj
            ,@Param(value="jgdm")  String jgdm
			);
	List<SwxxJgdmModel>getbajgList(
			@Param(value="jgdm")  String jgdm 
			);
}
