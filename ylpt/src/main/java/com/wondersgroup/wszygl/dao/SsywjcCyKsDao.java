package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Mapper
@Component
public interface SsywjcCyKsDao extends BaseMybatisDao<SsywjcModel,String>{
	List<SsywjcModel>	getSywjcCyKs (@Param(value="rq") String rq,@Param(value="yljgdm") String yljgdm);
}
