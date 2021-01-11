package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.BasycxDao;
import com.wondersgroup.wszygl.model.BasycxModel;
import com.wondersgroup.wszygl.model.YljgMcModel;
@Component
public class BasycxManger extends BaseMybatisManager<BasycxModel,String>{
	@Autowired
	private BasycxDao basycxDao;
	public List<BasycxModel>getBasycxechats(String kssj,String  jssj,String bajgdm){
		return basycxDao.getBasycxechats(kssj,jssj,bajgdm);
	};
	public List<YljgMcModel> getAllYljg(){
		return basycxDao.getAllYljg();
	}
	public List<BasycxModel> getBasyxz(String kssj,String jssj,String jbdm,String bajgdm){
		return basycxDao.getBasyxz(kssj,jssj,jbdm,bajgdm);
	}
	@Override
	public BaseMybatisDao<BasycxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return basycxDao;
	}
}
