package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JjhzjbfxDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;
@Controller
public class JjhzjbfxManger extends BaseMybatisManager<JjsjFxModel,String>{
	@Autowired
	private  JjhzjbfxDao jjhzjbfxDao;
	
	public List<JjsjFxModel> getJjhzjbfxListList(String startdate,String enddate){
		return jjhzjbfxDao.getJjhzjbfxListList(startdate,enddate);
	}
	@Override
	public BaseMybatisDao<JjsjFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jjhzjbfxDao;
	}

}
