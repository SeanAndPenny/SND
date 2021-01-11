package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JcXzJgDao;
import com.wondersgroup.wszygl.model.JcModel;
@Controller
public class JcXzJgManger extends BaseMybatisManager<JcModel,String>{
	@Autowired
	private JcXzJgDao jcXzJgDao;
	
	public List<JcModel> getJcXzJg(String sfws){
		return jcXzJgDao.getJcXzJg(sfws);
	}
	@Override
	public BaseMybatisDao<JcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jcXzJgDao;
	}

}
