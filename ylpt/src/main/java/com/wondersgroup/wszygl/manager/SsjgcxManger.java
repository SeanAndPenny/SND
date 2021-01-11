package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsjgcxDao;
import com.wondersgroup.wszygl.model.SslistModel;

@Component
public class SsjgcxManger extends BaseMybatisManager<SslistModel, String>{
    @Autowired
    public SsjgcxDao ssjgcxDao;
    
    public List<SslistModel> getSsjg(){
		return ssjgcxDao.getSsjg();
	}
	@Override
	public BaseMybatisDao<SslistModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssjgcxDao;
	}

}
