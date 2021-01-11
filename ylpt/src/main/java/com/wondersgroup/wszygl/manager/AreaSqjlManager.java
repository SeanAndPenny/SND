package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.AreaSqjlDao;
import com.wondersgroup.wszygl.model.AreaSqjlModel;

@Component
public class AreaSqjlManager extends BaseMybatisManager<AreaSqjlModel, String> {

	@Autowired
	private AreaSqjlDao areaSqjlDao;

	@Override
	public BaseMybatisDao<AreaSqjlModel, String> getBaseDao() {
		return areaSqjlDao;
	}

	public void exculeSql(String updateSql) {
		areaSqjlDao.exculeSql(updateSql);
		
	}

}