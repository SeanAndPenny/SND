package com.wondersgroup.wszygl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Mapper
@Component
public interface SsywYylxDao extends BaseMybatisDao<SsywjcModel,String>{
	List<SsywjcModel>	getYylx (@Param(value="ids") String ids,
			@Param(value="ywsj") String ywsj);

}
