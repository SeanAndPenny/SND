package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxyWxfcXzDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Controller
public class GxyWxfcXzManger extends BaseMybatisManager<GxysjfxModel,String>{
	@Autowired
	private GxyWxfcXzDao gxyWxfcXzDao;
	
	public List<GxysjfxModel> getGxyWxfcXz(String startdate,String enddate,String wxfc,String yljgdm){
		return gxyWxfcXzDao.getGxyWxfcXz(startdate,enddate,wxfc,yljgdm);
	}
	
	
	@Override
	public BaseMybatisDao<GxysjfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxyWxfcXzDao;
	}

}
