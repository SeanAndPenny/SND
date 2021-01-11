package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.BaModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;


@Mapper
@Component
public interface BaDao  extends  BaseMybatisDao<BaModel,String>{
	List<BaModel> getbazh(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm 
			);
	List<BaModel> getbajc(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm 
			);
	List<BaModel> getbaJbdl(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm 
			);
	List<BaModel> getechars04(
			@Param(value="jbflbm")  String jbflbm,
            @Param(value="jgdm")  String jgdm,
            @Param(value="kssj")  String kssj, 
            @Param(value="jssj")  String jssj
			);
	List<BaModel> getbafxKsxz( 
            @Param(value="jgdm")  String jgdm,
            @Param(value="kssj")  String kssj, 
            @Param(value="jssj")  String jssj
			);
	
	List<SwxxJgdmModel> getbajgList( 
            @Param(value="jgdm")  String jgdm 
			);
	String getMinSwsj();
	String getMaxSwsj();
}
