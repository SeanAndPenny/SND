package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.YjclModel;
@Mapper
@Component
public interface YjclDao extends  BaseMybatisDao<YjclModel,String>{
	YjclModel getYjclList();
	List<YjclModel> getYjcl();
}
