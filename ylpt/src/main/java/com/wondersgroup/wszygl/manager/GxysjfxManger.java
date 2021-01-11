package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxysjfxDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;


@Controller
public class GxysjfxManger  extends BaseMybatisManager<GxysjfxModel,String>{
	@Autowired
	private GxysjfxDao gxysjfxDao;
	
	public List<GxysjfxModel> getGxysjLyfx(String startdate,String enddate,String yljgdm){
		return gxysjfxDao.getGxysjLyfx(startdate,enddate,yljgdm);
	}
	public List<GxysjfxModel> getGxyXyfxList(String startdate,String enddate,String yljgdm){
		return gxysjfxDao.getGxyXyfxList(startdate,enddate,yljgdm);
	}
	public List<GxysjfxModel>getGxyWxFcList(String startdate,String enddate,String yljgdm){
		return gxysjfxDao.getGxyWxFcList(startdate,enddate,yljgdm);
	}
	public List<GxysjfxModel>getGxyNlFx(String startdate,String enddate,String yljgdm){
		return gxysjfxDao.getGxyNlFx(startdate,enddate,yljgdm);
	}
	@Override
	public BaseMybatisDao<GxysjfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxysjfxDao;
	}

}
