package com.wondersgroup.ylfwgl.manager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ylfwgl.dao.JbxxDao;
import com.wondersgroup.ylfwgl.model.JbxxModel;


@Component
public class JbxxManager extends BaseMybatisManager<JbxxModel, String> {

	@Autowired
	private JbxxDao jbxxDao;

	@Override
	public BaseMybatisDao<JbxxModel, String> getBaseDao() {
		return jbxxDao;
	}

	

}