package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.LnrGxyTnbXzDao;
import com.wondersgroup.wszygl.model.LnrModel;
@Controller
public class LnrGxyTnbXzManger extends BaseMybatisManager<LnrModel,String>{
	@Autowired
	private LnrGxyTnbXzDao lnrGxyTnbXzDao;
	
	public List<LnrModel> getLnrGxyTnbXz(String startdate,String enddate,String yljgdm){
		return lnrGxyTnbXzDao.getLnrGxyTnbXz(startdate,enddate,yljgdm);
	}
	@Override
	public BaseMybatisDao<LnrModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return lnrGxyTnbXzDao;
	}

}
