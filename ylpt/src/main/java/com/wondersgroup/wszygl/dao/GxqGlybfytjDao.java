package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Mapper
@Component
public interface GxqGlybfytjDao extends  BaseMybatisDao<YbFytjModel,String>{
	List<YbFytjModel> getechar01(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchartCf01(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchart02(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> chartCf02(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchart03(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel>getchartCf03(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchart04(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel>getchartCf04(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchart05(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel>getchartCf05(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel> getchart06(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	List<YbFytjModel>getchartCf06(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj ,
            @Param(value="sjlx")  String sjlx,
            @Param(value="jgdm")  String jgdm
			);
	String getMinSwsj();
	String getMaxSwsj();
}
