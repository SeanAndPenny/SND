package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcCyrsXzDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Component
public class SsywjcCyrsXzManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcCyrsXzDao ssywjcCyrsXzDao;
	

	 public List<SsywjcModel> getjg(String rq) {

		return ssywjcCyrsXzDao.getjg(rq);
		  
	  }
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssywjcCyrsXzDao;
	}
}
