package com.wondersgroup.ggwsgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.ggwsgl.model.FyfmxxModel;

@Mapper
@Component
public interface FyfmxxDao extends BaseMybatisDao<FyfmxxModel, String>{
	List<FyfmxxModel> getFmxx(String sfzh);
}
