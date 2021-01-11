package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcCyKsDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Controller
public class SsywjcCyKsManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcCyKsDao ssywjcCyKsDao;
	
	public List<SsywjcModel> getSywjcCyKs(String yljgdm,String rq){
		return ssywjcCyKsDao.getSywjcCyKs(yljgdm,rq);
	}
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssywjcCyKsDao;
	}
}
