package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JyFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Mapper
@Component
public interface JyFxDao extends BaseMybatisDao<JyFxModel,String>{
	List<SwxxJgdmModel>  getjyjgList( 
            @Param(value="jgdm")  String jgdm
            );
	List<JyFxModel>  getjyfxList
    (@Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj,
    @Param(value="jgdm")  String jgdm
    );
	List<JyFxModel> getjyjcfxList (@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm
		    );
	List<JyFxModel> getechars(@Param(value="kssj")  String kssj,
		    @Param(value="jssj")  String jssj,
		    @Param(value="jgdm")  String jgdm,
		    @Param(value="yylb")  String yylb
		    );
	String getMinSwsj();
	String getMaxSwsj();
}
