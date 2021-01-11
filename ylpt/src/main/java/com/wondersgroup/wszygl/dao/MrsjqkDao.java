package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.BmModel;
import com.wondersgroup.wszygl.model.MrsjqkModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
@Mapper
@Component

public interface MrsjqkDao extends BaseMybatisDao<MrsjqkModel,String>{
	List<YljgMcModel> getAllYljg();
	List<BmModel> getAllBm();
}
