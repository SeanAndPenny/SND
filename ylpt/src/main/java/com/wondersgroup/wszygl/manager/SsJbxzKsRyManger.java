package com.wondersgroup.wszygl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsJbxzKsRyDao;
import com.wondersgroup.wszygl.model.SslistModel;

@Controller
public class SsJbxzKsRyManger extends BaseMybatisManager<SslistModel, String>{
@Autowired
public SsJbxzKsRyDao  ssJbxzKsRyDao;

@Override
public BaseMybatisDao<SslistModel, String> getBaseDao() {
	// TODO Auto-generated method stub
	return ssJbxzKsRyDao;
}
}
