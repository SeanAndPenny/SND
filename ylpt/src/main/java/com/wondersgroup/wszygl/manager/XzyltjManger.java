package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.XzyltjDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.XzyltjModel;
@Component
public class XzyltjManger extends BaseMybatisManager<XzyltjModel,String>{
	@Autowired
	private XzyltjDao xzyltjDao;
	
	public List<XzyltjModel> getXzyltj(String kssj,String jssj,String xzdm){
		return xzyltjDao.getXzyltj(kssj,jssj,xzdm);
	}
	public List<XzyltjModel> getchartList(String kssj,String jssj,String xzdm,String lx){
		return xzyltjDao.getchartList(kssj,jssj,xzdm,lx);
	}
	
	public List<SwxxJgdmModel> getxzjgList(){
		return xzyltjDao.getxzjgList();
	}
	public String getMinsj() {
		return xzyltjDao.getMinsj();
	}
	public String getMaxsj() {
		return xzyltjDao.getMaxsj();
	}
	@Override
	public BaseMybatisDao<XzyltjModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return xzyltjDao;
	}

}
