package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JyXzKsDao;
import com.wondersgroup.wszygl.model.JyModel;
@Controller
public class JyXzKsManger extends BaseMybatisManager<JyModel,String>{
	@Autowired
	private JyXzKsDao jyXzKsDao;
	@Override
	public BaseMybatisDao<JyModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jyXzKsDao;
	}
	public List<JyModel> getJyXzKs(String sfws,String yljgdm){
		return jyXzKsDao.getJyXzKs(sfws,yljgdm);
	}
}
