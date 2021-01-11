package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YwbpzDao;
import com.wondersgroup.wszygl.model.YwbpzModel;
@Component
public class YwbpzManager extends BaseMybatisManager<YwbpzModel, String>{
	@Autowired
	private YwbpzDao ywbpzDao;
	
	@Override
	public BaseMybatisDao<YwbpzModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ywbpzDao;
	}
	 
	 

}
