package com.wondersgroup.ggwsgl.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.LnrGwTxDao;
import com.wondersgroup.ggwsgl.model.LnrGwTxModel;

@Component
public class LnrGwTxManager  extends BaseMybatisManager<LnrGwTxModel,String>{
	@Autowired
	private LnrGwTxDao lnrGwTxDao;
	@Override
	public BaseMybatisDao<LnrGwTxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return lnrGwTxDao;
	}

}
