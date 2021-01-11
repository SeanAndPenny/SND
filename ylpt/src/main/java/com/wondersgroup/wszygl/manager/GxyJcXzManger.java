package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxyJcXzDao;
import com.wondersgroup.wszygl.model.GxysjfxModel;


@Controller
public class GxyJcXzManger extends BaseMybatisManager<GxysjfxModel,String>{
	@Autowired
	private GxyJcXzDao gxyJcXzDao;
	
	public List<GxysjfxModel> getGxyJcXzList(String startdate,String enddate,String xxlybm,String yljgdm){
		return gxyJcXzDao.getGxyJcXzList(startdate,enddate,xxlybm,yljgdm);
	}
	
	@Override
	public BaseMybatisDao<GxysjfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxyJcXzDao;
	}

}
