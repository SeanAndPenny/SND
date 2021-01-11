package com.wondersgroup.frame.spr_mybt_mvc.demo.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.demo.dao.DemoDao;
import com.wondersgroup.frame.spr_mybt_mvc.demo.model.DemoEntity;

@Component
public class DemoManager extends BaseMybatisManager<DemoEntity, String> {

	@Autowired
	private DemoDao demoDao;

	@Override
	public BaseMybatisDao<DemoEntity, String> getBaseDao() {
		return demoDao;
	}
}