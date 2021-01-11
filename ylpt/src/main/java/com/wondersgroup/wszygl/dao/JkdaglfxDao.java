package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.jkdaglfxModel;

@Mapper
@Component
public interface JkdaglfxDao extends BaseMybatisDao<jkdaglfxModel,String>{
	List<jkdaglfxModel>  getyjdfx(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm, 
            @Param(value="sjlx") String sjlx
            );
	List<jkdaglfxModel>  getjdqsfx(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm, 
            @Param(value="sjlx") String sjlx,
            @Param(value="jdrqgs") String jdrqgs
            );
	List<SwxxJgdmModel>getjdjgList ( @Param(value="jgdm")  String jgdm );
	List<jkdaglfxModel>getdjdfx ( @Param(value="jgdm")  String jgdm );
	String getMinJdsj();
	String getMaxJdsj();
	String getMaxJdsjs();
	String getczrkzs( 
            @Param(value="jgdm")  String jgdm 
            );
	

	
	String getldrkzs( 
            @Param(value="jgdm")  String jgdm
            
            );
}
