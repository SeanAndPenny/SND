package com.wondersgroup.wszygl.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.PlatLoginDao;
import com.wondersgroup.wszygl.model.PlatLoginModel;

@Component
public class PlatLoginManager extends BaseMybatisManager<PlatLoginModel, String> {

	@Autowired
	private PlatLoginDao platLoginDao;


	@Override
	public BaseMybatisDao<PlatLoginModel, String> getBaseDao() {
		return platLoginDao;
	}
	
	public List<Map<String, Object>> getXtList() {
		return platLoginDao.getXtList();
	}

}