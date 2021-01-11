package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.dao.JkdagxDao;
import com.wondersgroup.wszygl.model.JkdagxModel;

@Component
public class JkdagxManager  extends BaseMybatisManager<JkdagxModel,String>{
	@Autowired
	private JkdagxDao jkdagxDao;
	
	public List<YljgModel>getAllYljg(String yljgdm){
		return jkdagxDao.getAllYljg(yljgdm);
	}
	public List<JkdagxModel> getJkdagxxx(String yljgdm,String startdate,String enddate) {

		return jkdagxDao.getJkdagxxx(yljgdm,startdate,enddate);
	}
	
	@Override
	public BaseMybatisDao<JkdagxModel, String> getBaseDao() { 
		return jkdagxDao;
	}

}
