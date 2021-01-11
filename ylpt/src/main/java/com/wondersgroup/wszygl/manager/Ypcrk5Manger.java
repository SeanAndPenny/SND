package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.Ypcrk5Dao;
import com.wondersgroup.wszygl.model.YpcrkModel;
@Component
public class Ypcrk5Manger  extends BaseMybatisManager<YpcrkModel,String>{
	@Autowired
	private Ypcrk5Dao ypcrk5dao;

	@Override
	public BaseMybatisDao<YpcrkModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ypcrk5dao;
	}
}
