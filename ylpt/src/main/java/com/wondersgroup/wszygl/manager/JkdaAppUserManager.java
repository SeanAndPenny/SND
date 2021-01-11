package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JkdaAppUserDao;
import com.wondersgroup.wszygl.model.JkdaAppUserModel;


@Component
public class JkdaAppUserManager extends BaseMybatisManager<JkdaAppUserModel, String>{

	@Autowired
	private JkdaAppUserDao jkdaAppuserDao;
	@Override
	public BaseMybatisDao<JkdaAppUserModel, String> getBaseDao() {
		return jkdaAppuserDao;
	}
}
