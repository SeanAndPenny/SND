package com.wondersgroup.wszygl.manager;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.RyxzDao;
import com.wondersgroup.wszygl.model.RyzxtModel;

@Component
public class RyxzManger extends BaseMybatisManager<RyzxtModel,String>{
	@Autowired
	private  RyxzDao ryxzDao;
	@Override
	public BaseMybatisDao<RyzxtModel, String> getBaseDao() {
		
		return ryxzDao;
	}
 public List<RyzxtModel> getRyjg(String jb ,String zc) {
	 return ryxzDao.getRyjg(jb,zc);
 }
}
