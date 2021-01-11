package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.Ybtable2Dao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Component
public class Ybtable2Manager extends BaseMybatisManager<YbFytjModel, String>{
	@Autowired
	private Ybtable2Dao ybtable2Dao;
	@Override
	public BaseMybatisDao<YbFytjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ybtable2Dao;
	}

}
