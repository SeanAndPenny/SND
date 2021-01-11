package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.ZybassDao;
import com.wondersgroup.wszygl.model.BasycxModel;
@Component
public class ZybassManger extends BaseMybatisManager<BasycxModel,String>{
	@Autowired
	private ZybassDao  zybassDao;
	@Override
	public BaseMybatisDao<BasycxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return zybassDao;
	}

}
