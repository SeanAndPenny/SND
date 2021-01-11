
package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YljgMcModel;
import com.wondersgroup.wszygl.model.xxxblModel;

public interface xxxblDao extends BaseMybatisDao<xxxblModel,String>{
	List <xxxblModel>  getxxxBllist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List <xxxblModel>  getrkbllist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List <xxxblModel>  getnlbllist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            ); 
	List <xxxblModel>  getnllist(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            ); 
	List <YljgMcModel>  getJdlist( 
		 
            @Param(value="jgdm")  String jgdm
            
            );
	 
	String hjrkzsl(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm);
	String getldzsl(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm);
	
	
	
	List <xxxblModel>  getHjechats(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="nldbm1")  String nldbm1,
            @Param(value="nldbm2")  String nldbm2
            );
	List <xxxblModel>  getLdechats(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="nldbm1")  String nldbm1,
            @Param(value="nldbm2")  String nldbm2
            );
	List <xxxblModel>  getZrkechats(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="nldbm1")  String nldbm1,
            @Param(value="nldbm2")  String nldbm2
            );
	
}
