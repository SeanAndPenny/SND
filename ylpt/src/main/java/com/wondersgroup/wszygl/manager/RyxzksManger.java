package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.RyxzksDao;
import com.wondersgroup.wszygl.model.RyzxtModel;

@Component
public class RyxzksManger extends BaseMybatisManager<RyzxtModel,String>{
	@Autowired
	private RyxzksDao ryxzksDao;
	@Override
	public BaseMybatisDao<RyzxtModel, String> getBaseDao() {
		
		return ryxzksDao;
	}
	public List<RyzxtModel>  getRyjg(String jb,String zc,String jgdm){
		return ryxzksDao.getRyjg(jb,zc,jgdm);
	}
}
