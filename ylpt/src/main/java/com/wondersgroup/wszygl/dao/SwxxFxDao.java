package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SwxxFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Mapper
@Component
public interface SwxxFxDao extends  BaseMybatisDao<SwxxFxModel,String>{
	List<SwxxFxModel> getswxxfx(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm
			);
	List<SwxxFxModel> getswxxnldfx(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm
			);
	List<SwxxFxModel> getSyfxnlList(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	List<SwxxFxModel> getsyflfxList(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
	List <SwxxFxModel> getSwechats(
			@Param(value="nf")  String nf, 
            @Param(value="jgdm")  String jgdm);
	
	List <SwxxFxModel> getechars06(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm,
            @Param(value="nldbm1")  String nldbm1,
            @Param(value="nldbm2")  String nldbm2,
            @Param(value="sjlx")  String sjlx
            );
	
	List <SwxxFxModel> getechars09(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm,
            @Param(value="jbbm")  String jbbm, 
            @Param(value="sjlx")  String sjlx
            );
	
	List <SwxxFxModel> getechars07(
			@Param(value="ksnf")  String ksnf,
            @Param(value="jsnf")  String jsnf,
            @Param(value="jgdm")  String jgdm,
            @Param(value="nldbm1")  String nldbm1,
            @Param(value="nldbm2")  String nldbm2,
            @Param(value="sjlx")  String sjlx
            );
	List <SwxxJgdmModel> getswjdList( 
            @Param(value="jgdm")  String jgdm);
	
	String getMinSwsj();
	String getMaxSwsj();
}
