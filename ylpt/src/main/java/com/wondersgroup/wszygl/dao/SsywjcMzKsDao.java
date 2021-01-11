package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Mapper
@Component
public interface SsywjcMzKsDao extends BaseMybatisDao<SsywjcModel,String>{
	List<SsywjcModel>getSywjcMzKs (@Param(value="yljgdm") String yljgdm,@Param(value="rq") String rq);
}
