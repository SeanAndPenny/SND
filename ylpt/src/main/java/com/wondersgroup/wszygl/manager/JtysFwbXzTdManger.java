package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysFwbXzTdDao;
import com.wondersgroup.wszygl.model.JtysModel;
@Controller
public class JtysFwbXzTdManger extends BaseMybatisManager<JtysModel,String>{
	@Autowired
	private JtysFwbXzTdDao jtysFwbXzTdDao;
	
	public List<JtysModel> getJtysFwbXzTd(String qyjgid,String fwbid){
		return jtysFwbXzTdDao.getJtysFwbXzTd(qyjgid,fwbid);
	}
	@Override
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysFwbXzTdDao;
	}
}
