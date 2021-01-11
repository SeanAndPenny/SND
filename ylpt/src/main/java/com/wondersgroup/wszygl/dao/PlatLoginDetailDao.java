package com.wondersgroup.wszygl.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.wszygl.model.PlatLoginDetailModel;

@Mapper
@Component
public interface PlatLoginDetailDao extends BaseMybatisDao<PlatLoginDetailModel, String> {

	public void updatePlatLogin(String tabid);
}
