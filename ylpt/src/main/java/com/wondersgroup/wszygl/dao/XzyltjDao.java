package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.XzyltjModel;

@Mapper
@Component
public interface XzyltjDao extends BaseMybatisDao<XzyltjModel,String>{
	List<XzyltjModel>  getXzyltj 
	(@Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj,
    @Param(value="xzdm")  String xzdm
    );
	List<XzyltjModel>  getchartList 
	(@Param(value="kssj")  String kssj,
    @Param(value="jssj")  String jssj,
    @Param(value="xzdm")  String xzdm,
    @Param(value="lx")  String lx
    );
	
	List<SwxxJgdmModel>  getxzjgList();
	String getMinsj();
	String getMaxsj();
}
