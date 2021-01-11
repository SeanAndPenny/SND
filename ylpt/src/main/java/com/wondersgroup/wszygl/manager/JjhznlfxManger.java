package com.wondersgroup.wszygl.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JjhznlfxDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;

@Controller
public class JjhznlfxManger extends BaseMybatisManager<JjsjFxModel,String>{
	@Autowired
	private JjhznlfxDao jjhznlfxDao;
	
	public List<JjsjFxModel> getJjhznlfxList(String startdate,String enddate){
		return jjhznlfxDao.getJjhznlfxList(startdate,enddate);
	}
	@Override
	public BaseMybatisDao<JjsjFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jjhznlfxDao;
	}
}
