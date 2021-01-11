package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.CszmDao;
import com.wondersgroup.wszygl.model.CszmModel;
 
@Controller
public class CszmManger extends BaseMybatisManager<CszmModel,String>{
	@Autowired
	private CszmDao cszmDao;
	
	public CszmModel getCszm(String cszm ){
		return cszmDao.getCszm(cszm);
	}
	@Override
	public BaseMybatisDao<CszmModel, String> getBaseDao() {
	
		return cszmDao;
	}

}
