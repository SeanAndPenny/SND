package com.wondersgroup.wszygl.dao;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.IAEDModel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
/*资金接口层*/
@Mapper
@Component
public interface IAEDDao extends  BaseMybatisDao<IAEDModel,String>{
	  List<IAEDModel> getChart01(
              @Param(value = "kssj") String kssj,
              @Param(value = "jssj") String jssj,
              @Param(value = "jgdm") String jgdm,
			  @Param(value = "objectCode") String objectCode
      );
	  List<IAEDModel>getCicleChart01(
              @Param(value = "kssj") String kssj,
              @Param(value = "jssj") String jssj,
              @Param(value = "jgdm") String jgdm,
              @Param(value = "objectLen") String objectLen,
              @Param(value = "objectCode") String objectCode
      );
	  List<IAEDModel>getAreaChart01(
              @Param(value = "kssj") String kssj,
              @Param(value = "jssj") String jssj,
              @Param(value = "jgdm") String jgdm,
              @Param(value = "objectCode") String objectCode,
              @Param(value = "objectLen") String objectLen
      );
	String getMinSwsj();
	String getMaxSwsj();
}
