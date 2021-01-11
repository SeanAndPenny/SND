package com.wondersgroup.ggwsgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.PACSModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Mapper
@Component
public interface PACSDao extends BaseMybatisDao<PACSModel,String>{
	
	List<YljgModel> getAllYljg();
}
