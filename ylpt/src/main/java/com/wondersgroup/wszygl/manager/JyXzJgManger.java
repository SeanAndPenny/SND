package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JyXzJgDao;
import com.wondersgroup.wszygl.model.JyModel; 
@Controller
public class JyXzJgManger extends BaseMybatisManager<JyModel,String>{
	@Autowired
	private JyXzJgDao jyXzJgDao;
	@Override
	public BaseMybatisDao<JyModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jyXzJgDao;
	}
	public List<JyModel> getJyXzJg(String sfws){
		return jyXzJgDao.getJyXzJg(sfws);
	}

}
