package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.BassModel;
@Mapper
@Component
public interface BassDao extends  BaseMybatisDao<BassModel,String>{
	  List<BassModel> getBajgFx(
			@Param(value="kssj")  String kssj,
            @Param(value="jssj")  String jssj,
            @Param(value="jgdm")  String jgdm
			);
	  List<BassModel>getechars02(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm
				);
	  List<BassModel>getechrs03List(
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj,
	            @Param(value="jgdm")  String jgdm
				);
	  List<BassModel>getbassKsxz(
			  @Param(value="jgdm")  String jgdm,
				@Param(value="kssj")  String kssj,
	            @Param(value="jssj")  String jssj
	            
				);
	String getMinSwsj();
	String getMaxSwsj();
}
