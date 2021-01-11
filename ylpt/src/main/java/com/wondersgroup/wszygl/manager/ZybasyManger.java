package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.ZybasyDao;
import com.wondersgroup.wszygl.model.BasycxModel;
@Component
public class ZybasyManger extends BaseMybatisManager<BasycxModel,String>{
	@Autowired
	private  ZybasyDao zybasyDao;
	@Override
	public BaseMybatisDao<BasycxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return zybasyDao;
	}

}
