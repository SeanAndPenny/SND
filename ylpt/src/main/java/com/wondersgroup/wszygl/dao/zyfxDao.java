package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.zyfxModel;
@Mapper
@Component
public interface zyfxDao extends BaseMybatisDao<zyfxModel,String>{
	List<zyfxModel>  getzyfx(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List<zyfxModel>getechars02(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List<zyfxModel>getechars03(@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
            );
	List<SwxxJgdmModel>  getzyjgList( 
            @Param(value="jgdm")  String jgdm
            );
	String getMinJdsj();
	String getMaxJdsj();
}
