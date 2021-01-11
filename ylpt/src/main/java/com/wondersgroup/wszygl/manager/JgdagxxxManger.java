package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JgdagxxxDao;
import com.wondersgroup.wszygl.model.JgdagxxxModel;

@Component
public class JgdagxxxManger extends BaseMybatisManager<JgdagxxxModel,String>{
	@Autowired
	private JgdagxxxDao jgdagxxxDao;
	@Override
	public BaseMybatisDao<JgdagxxxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jgdagxxxDao;
	}

}
