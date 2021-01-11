package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.JcModel;;

@Mapper
@Component
public interface JcXzJgDao extends BaseMybatisDao<JcModel,String>{
	 List<JcModel>  getJcXzJg(@Param(value="sfws") String sfws);

}
