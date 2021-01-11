package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.Ypcrk4Dao;
import com.wondersgroup.wszygl.model.YpcrkModel;
@Component
public class Ypcrk4Manger extends BaseMybatisManager<YpcrkModel,String>{
	@Autowired
	private Ypcrk4Dao ypcrk4dao;

	@Override
	public BaseMybatisDao<YpcrkModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ypcrk4dao;
	}
}
