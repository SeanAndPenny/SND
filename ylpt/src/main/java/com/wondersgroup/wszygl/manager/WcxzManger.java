package com.wondersgroup.wszygl.manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.WcxzDao;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;

@Component
public class WcxzManger extends BaseMybatisManager<YqjgzsDaoModel, String> {
	@Autowired
	private WcxzDao wcxzDao;

	@Override
	public BaseMybatisDao<YqjgzsDaoModel, String> getBaseDao() {
		
		return wcxzDao;
	}
}
