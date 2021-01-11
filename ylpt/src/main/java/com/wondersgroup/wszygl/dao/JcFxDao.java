package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JcFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Mapper
@Component
public interface JcFxDao extends BaseMybatisDao<JcFxModel,String>{
	List<SwxxJgdmModel>  getjcjgList( 
            @Param(value="jgdm")  String jgdm
            );
	List<JcFxModel>  getjcfxList
    (@Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj,
    @Param(value="jgdm")  String jgdm
    );
	List<JcFxModel> getjcjcfxList (@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm
		    );
	List<JcFxModel> getechars(@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm,
		    @Param(value="yylb")  String yylb
		    );
	String getMinSwsj();
	String getMaxSwsj();
}
