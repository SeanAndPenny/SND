package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsJgxzKSDao;
import com.wondersgroup.wszygl.model.SslistModel;
@Component
public class SsJgxzKSManger extends BaseMybatisManager<SslistModel, String>{
	@Autowired 
	public SsJgxzKSDao ssJgxzKSDao;
	
	public List<SslistModel> getssJbxzKs(String yljgdm ){
		return ssJgxzKSDao.getssJbxzKs(yljgdm);
	}
	
	
	
	@Override
	public BaseMybatisDao<SslistModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssJgxzKSDao;
	}

}
