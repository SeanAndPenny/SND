package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JyModel;
@Mapper
@Component
public interface JyXzYsDao extends BaseMybatisDao<JyModel,String>{
	 List<JyModel>  getJyXzYs(@Param(value="sfws") String sfws,
			 @Param(value="yljgdm") String yljgdm,
			 @Param(value="sqks") String sqks);
	 
	  JyModel    getJybgdbh(@Param(value="bgdh") String bgdh,
			 @Param(value="yljgdm") String yljgdm,
			 @Param(value="bgrq") String bgrq);
	  
	 List <JyModel>   getJybgdbhList(@Param(value="bgdh") String bgdh,
				 @Param(value="yljgdm") String yljgdm,
				 @Param(value="bgrq") String bgrq);
}
