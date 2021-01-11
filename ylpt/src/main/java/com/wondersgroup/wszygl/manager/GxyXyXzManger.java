package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxyXyXzDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Controller
public class GxyXyXzManger  extends BaseMybatisManager<GxysjfxModel,String>{
	@Autowired
	private GxyXyXzDao gxyXyXzDao;
	
	public List<GxysjfxModel> getGxyXyXzList(String startdate,String enddate,String sfxy,String yljgdm){
		return gxyXyXzDao.getGxyXyXzList(startdate,enddate,sfxy,yljgdm);
	}
	
	@Override
	public BaseMybatisDao<GxysjfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxyXyXzDao;
	}

}
