package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YpcrkModel;
@Mapper
@Component
public interface YpcrkDao extends  BaseMybatisDao<YpcrkModel,String>{
	List<YpcrkModel> getypzh(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm 
			);
	List<YpcrkModel> getypjc(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm 
			);
	List<YpcrkModel> getechars03List(
	@Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj,
    @Param(value="jgdm")  String jgdm 
	);
	List<YpcrkModel> getechars04List(
			@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm 
			);
	List<YpcrkModel> getechars05List(
			@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm 
			);
	
	 
	String getypcrjglxk( 
			 @Param(value="jgdm")  String jgdm 
			);
}
