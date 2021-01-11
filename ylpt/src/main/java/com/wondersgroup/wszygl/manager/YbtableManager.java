package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YbtableDao;
import com.wondersgroup.wszygl.model.YbFytjModel;
@Component
public class YbtableManager extends BaseMybatisManager<YbFytjModel, String>{
	@Autowired
	private YbtableDao ybtableDao;
	@Override
	public BaseMybatisDao<YbFytjModel, String> getBaseDao() {
		return ybtableDao;
	}

}
