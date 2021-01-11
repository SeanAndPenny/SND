package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysTdXzYsDao;
import com.wondersgroup.wszygl.model.JtysModel;
import com.wondersgroup.wszygl.model.SslistModel;
@Controller
public class JtysTdXzYsManger extends BaseMybatisManager<JtysModel,String>{
	@Autowired
	private JtysTdXzYsDao jtysTdXzYsDao;
	
	public List<JtysModel> getJtysTdXzYs(String tdbh){
		return jtysTdXzYsDao.getJtysTdXzYs(tdbh);
	}
	@Override
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysTdXzYsDao;
	}
}
