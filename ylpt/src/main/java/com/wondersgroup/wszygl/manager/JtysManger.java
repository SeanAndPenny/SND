package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JtysDao;
import com.wondersgroup.wszygl.model.CsrsModel;
import com.wondersgroup.wszygl.model.JtysModel;
import com.wondersgroup.wszygl.model.RylbModel;

@Component
public class JtysManger extends BaseMybatisManager<JtysModel, String>{
	@Autowired
	private   JtysDao jtysDao;
	public JtysModel getJtys() {
		return jtysDao.getJtys();
	}
	public CsrsModel getCstj(){
		return jtysDao.getCstj();
	}
	public List<JtysModel> getJtywFwb(){
		return jtysDao.getJtywFwb();
	}
	public List<JtysModel> getJtywJg(){
		return jtysDao.getJtywJg();
	} 
	public List<JtysModel> getJtywTd(){
		return jtysDao.getJtywTd();
	}
	public List<JtysModel>  getJtyslb(){
		return jtysDao.getJtyslb();
	}
	public BaseMybatisDao<JtysModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jtysDao;
	}

}
