package com.wondersgroup.commons.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.commons.dao.TbAuthUserDao;
import com.wondersgroup.commons.model.LogsModel;
import com.wondersgroup.commons.model.TbAuthUser;

@Component
public class LogsManager extends BaseMybatisManager<LogsModel, String> {

	@Autowired
	private com.wondersgroup.commons.dao.LogsModelDao LogsModelDao;

	@Override
	public BaseMybatisDao<LogsModel, String> getBaseDao() {
		return LogsModelDao;
	}
	
}