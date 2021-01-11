package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SsywjcMzrsXzDao;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Component
public class SsywjcMzrsXzManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcMzrsXzDao ssywjcMzrsXzDao;
	
	 public List<SsywjcModel> getJgtj(String rq) {
            return ssywjcMzrsXzDao.getJgtj(rq);
		  }
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ssywjcMzrsXzDao;
	}

}
