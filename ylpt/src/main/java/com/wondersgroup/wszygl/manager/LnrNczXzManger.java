package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.LnrNczXzDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Controller
public class LnrNczXzManger extends BaseMybatisManager<LnrModel,String>{
	@Autowired
	private LnrNczXzDao lnrNczXzDao;
	
	public List<LnrModel> getLnrNczXz(String startdate,String enddate,String yljgdm){
		return lnrNczXzDao.getLnrNczXz(startdate,enddate,yljgdm);
	}
	
	
	@Override
	public BaseMybatisDao<LnrModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return lnrNczXzDao;
	}

}
