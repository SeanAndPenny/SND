package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcMzKsDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Component
public class SsywjcMzKsManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcMzKsDao ssywjcMzKsDao;
	
	public List<SsywjcModel> getSywjcMzKs(String yljgdm,String rq){
		return ssywjcMzKsDao.getSywjcMzKs(yljgdm,rq);
	}
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssywjcMzKsDao;
	}
}
