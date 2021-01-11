package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YyjsDao;
import com.wondersgroup.wszygl.dao.YyssbmDao;
import com.wondersgroup.wszygl.model.SsbmyljgModel;
import com.wondersgroup.wszygl.model.YyjsModel;


@Component
public class YyjsManager extends BaseMybatisManager<YyjsModel, String>{

	@Autowired
	private YyjsDao yyjsDao;
	@Override
	public BaseMybatisDao<YyjsModel, String> getBaseDao() {
		return yyjsDao;
	}
}
