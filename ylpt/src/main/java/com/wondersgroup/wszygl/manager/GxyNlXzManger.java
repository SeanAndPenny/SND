package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxyNlXzDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Controller
public class GxyNlXzManger  extends BaseMybatisManager<GxysjfxModel,String>{
	@Autowired
	private GxyNlXzDao gxyNlXzDao;

	public List<GxysjfxModel> getGxyNlXz(String startdate,String enddate,String nllx,String yljgdm){
		return gxyNlXzDao.getGxyNlXz(startdate,enddate,nllx,yljgdm);
	}
	
	
	@Override
	public BaseMybatisDao<GxysjfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxyNlXzDao;
	}

}
