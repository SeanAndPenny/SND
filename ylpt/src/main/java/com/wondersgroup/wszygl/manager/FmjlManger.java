package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.FmjlDao;
import com.wondersgroup.wszygl.model.CsrsModel;
 


@Controller
public class FmjlManger extends BaseMybatisManager<CsrsModel,String>{
	@Autowired
	private FmjlDao fmjlDao;
	
	public List<CsrsModel> getFmcxList(String yljgdm,String hjbz2 ){
		return fmjlDao.getFmcxList(yljgdm,hjbz2 );
	}
	public CsrsModel getFmtj(){
		return fmjlDao.getFmtj();
	}
	public List<CsrsModel> getFmxzJgList(String hjbz){
		return fmjlDao.getFmxzJgList(hjbz );
	}
	@Override
	public BaseMybatisDao<CsrsModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return fmjlDao;
	}

}
