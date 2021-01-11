package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.ShujuScQkModel;

@Component
@Mapper
public interface ShujuScQkDao extends BaseMybatisDao<ShujuScQkModel,String>{
	 public List<ShujuScQkModel> getywlist();
	 public int getZsl(@Param(value="bm") String bm,
			 @Param(value="ywlx") String ywlx);
	 public List<ShujuScQkModel> getShujuScQklist( @Param(value="ccc") int  ccc,
			 @Param(value="bm") String bm,
			 @Param(value="ywlx") String ywlx);
	 
	 List<ShujuScQkModel>  getList(@Param(value="ywm") String ywm,
			 @Param(value="zwm") String zwm,
			 @Param(value="ywlx") String ywlx,
			 @Param(value="sjc") String sjc,
			 @Param(value="jgfl") String jgfl,
			 @Param(value="ywsj") String ywsj
			
			);
}
