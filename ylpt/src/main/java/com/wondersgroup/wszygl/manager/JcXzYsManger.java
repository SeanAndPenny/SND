package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JcXzYsDao;
import com.wondersgroup.wszygl.model.JcModel;

@Controller
public class JcXzYsManger extends BaseMybatisManager<JcModel,String>{
	@Autowired
	private JcXzYsDao jcXzYsDao;
	
	public List<JcModel> getJcXzYs(String sfws,String yljgdm,String sqks){
		return jcXzYsDao.getJcXzYs(sfws,yljgdm,sqks);
	}
	
	@Override
	public BaseMybatisDao<JcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jcXzYsDao;
	}

}
