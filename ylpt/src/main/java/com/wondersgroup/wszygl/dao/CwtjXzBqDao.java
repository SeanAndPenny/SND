package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.CwtjModel;
@Mapper
@Component
public interface CwtjXzBqDao extends BaseMybatisDao<CwtjModel,String>{
	List<CwtjModel>	getCwHdtjXzBqList (
			 @Param(value="yljgdm") String yljgdm,@Param(value="ids") String ids
			);
	List<CwtjModel>	getCwKftjXzBqList (
			 @Param(value="yljgdm") String yljgdm,@Param(value="ids") String ids
			);
	List<CwtjModel>	getCwDqtjXzBqList(
			 @Param(value="yljgdm") String yljgdm,@Param(value="ids") String ids
			);
	List<CwtjModel>getCwSytjXzBqList( @Param(value="yljgdm") String yljgdm,@Param(value="ids") String ids
			);
}
