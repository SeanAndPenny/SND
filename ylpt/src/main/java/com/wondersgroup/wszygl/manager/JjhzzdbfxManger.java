package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JjhzzdbfxDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;
@Controller
public class JjhzzdbfxManger extends BaseMybatisManager<JjsjFxModel,String>{
	@Autowired
	private  JjhzzdbfxDao jjhzzdbfxDao;
	
	public List<JjsjFxModel> getJjhzzdbfxList(String startdate,String enddate){
		return jjhzzdbfxDao.getJjhzzdbfxList(startdate,enddate);
	}
	@Override
	public BaseMybatisDao<JjsjFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jjhzzdbfxDao;
	}

}
