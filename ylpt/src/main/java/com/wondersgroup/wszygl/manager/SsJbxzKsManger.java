package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsJbxzKsDao;
import com.wondersgroup.wszygl.model.SslistModel;
@Controller
public class SsJbxzKsManger extends BaseMybatisManager<SslistModel,String>{
	@Autowired
	private SsJbxzKsDao ssJbxzKsDao;
	
	public List<SslistModel> getssJbxzKs(String ssjb,String yljgdm ){
		return ssJbxzKsDao.getssJbxzKs(ssjb,yljgdm);
	}
	
	@Override
	public BaseMybatisDao<SslistModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssJbxzKsDao;
	}

}
