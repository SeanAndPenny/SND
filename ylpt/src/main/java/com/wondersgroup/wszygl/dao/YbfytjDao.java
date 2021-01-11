package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YbFytjModel;

@Mapper
@Component
public interface YbfytjDao extends  BaseMybatisDao<YbFytjModel,String>{
	List<YbFytjModel> getybfytj(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm,
            @Param(value="sjlx")  String sjlx
			);
 
		List<YbFytjModel> getechars02(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm,
	            @Param(value="sjlx")  String sjlx,
	            @Param(value="qylx")  String qylx
				);
		List<YbFytjModel> getechars03(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm,
	            @Param(value="sjlx")  String sjlx,
	            @Param(value="qylx")  String qylx,
	            @Param(value="jglx")  String jglx,
	            @Param(value="jgjb")  String jgjb
	            
				);
		List<YbFytjModel> getecharsjb(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm,
	            @Param(value="sjlx")  String sjlx,
	            @Param(value="qylx")  String qylx,
	            @Param(value="jglx")  String jglx
	           
				);
		
		List<YbFytjModel> getecharsList(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm,
	            @Param(value="sjlx")  String sjlx,
	            @Param(value="qylx")  String qylx,
	            @Param(value="jglx")  String jglx,
	            @Param(value="jgjb")  String jgjb
				);
	String getMinSwsj();
	String getMaxSwsj();
		
}
