package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.LnrXnXzDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Controller
public class LnrXnXzManger extends BaseMybatisManager<LnrModel,String>{
	@Autowired
	private LnrXnXzDao lnrXnXzDao;
	
	public List<LnrModel> getLnrXnXz(String startdate,String enddate,String yljgdm){
		return lnrXnXzDao.getLnrXnXz(startdate,enddate,yljgdm);
	}

	@Override
	public BaseMybatisDao<LnrModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return lnrXnXzDao;
	}
}
