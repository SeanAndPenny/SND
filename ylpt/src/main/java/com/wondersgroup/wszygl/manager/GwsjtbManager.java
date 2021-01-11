package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GwsjtbDao;
import com.wondersgroup.wszygl.model.GwsjtbModel;
import com.wondersgroup.wszygl.model.TbjdpzModel;
import com.wondersgroup.wszygl.model.YljgModel;

@Component
public class GwsjtbManager extends BaseMybatisManager<GwsjtbModel,String>{
	@Autowired
	private  GwsjtbDao gwsjtbDao;
	
	public List<YljgModel> getAllYljg(String yljgdm) {
		return gwsjtbDao.getAllYljg(yljgdm);
	}
	public List<TbjdpzModel> getAllpz() {
		return gwsjtbDao.getAllpz();
	}
	public TbjdpzModel gePz(String pz) {
		return gwsjtbDao.gePz(pz);
	}
	public int getCkrksl(String yljgdm,String enddate,String pz) {
		return gwsjtbDao.getCkrksl(yljgdm,enddate,pz);
	}
	public void updateRksl(String yljgdm,String rksl,String enddate,String pz,String xm) {
		gwsjtbDao.updateRksl(yljgdm,rksl,enddate,pz,xm);
	}
	public void saveHt(String yljgdm,String rksl,String enddate,String pz,String xm) {
		gwsjtbDao.saveHt(yljgdm,rksl,enddate,pz,xm);
	}
	@Override
	public BaseMybatisDao<GwsjtbModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gwsjtbDao;
	}

}
