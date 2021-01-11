package com.wondersgroup.wszygl.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JcModel;
@Mapper
@Component
public interface JcXzYsDao extends BaseMybatisDao<JcModel,String>{
	 List<JcModel>  getJcXzYs(@Param(value="sfws") String sfws,
			 @Param(value="yljgdm") String yljgdm,
			 @Param(value="sqks") String sqks);
}
