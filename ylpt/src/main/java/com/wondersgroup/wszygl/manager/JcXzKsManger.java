package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JcXzKsDao;
import com.wondersgroup.wszygl.model.JcModel;


@Controller
public class JcXzKsManger extends BaseMybatisManager<JcModel,String>{
	@Autowired
	private JcXzKsDao jcXzKsDao;
	public List<JcModel> getJcXzKs(String sfws,String yljgdm){
		return jcXzKsDao.getJcXzKs(sfws,yljgdm);
	}
	@Override
	public BaseMybatisDao<JcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jcXzKsDao;
	}
	

}
