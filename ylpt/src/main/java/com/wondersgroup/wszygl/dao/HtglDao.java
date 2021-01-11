package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.model.TbDxRshtx;

@Mapper
@Component
public interface HtglDao  extends BaseMybatisDao<TbDxRshtx, String>{
	List<YljgModel> getAllYljg();
	int getScht(@Param(value="zjhm")String zjhm,@Param(value="dqrq")String  dqrq);
	void insertExcel(TbDxRshtx daoruexcel);
}
