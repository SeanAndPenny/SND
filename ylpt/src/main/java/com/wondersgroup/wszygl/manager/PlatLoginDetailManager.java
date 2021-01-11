package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.PlatLoginDetailDao;
import com.wondersgroup.wszygl.model.PlatLoginDetailModel;

@Component
public class PlatLoginDetailManager extends BaseMybatisManager<PlatLoginDetailModel, String>{
	@Autowired
	private PlatLoginDetailDao platLoginDetailDao;
	
	public void deletePlatLogin(String tabid){
		platLoginDetailDao.updatePlatLogin(tabid);
	}
	
	@Override
	public BaseMybatisDao<PlatLoginDetailModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return platLoginDetailDao;
	}

}
