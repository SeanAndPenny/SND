package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.BasscxDao;
import com.wondersgroup.wszygl.model.BasycxModel;

@Component
public class BasscxManger extends BaseMybatisManager<BasycxModel,String>{
	@Autowired
	private BasscxDao basscxDao;
	public List<BasycxModel>getBassechats(String basskssj,String  bassjssj,String bassjgdm){
		return basscxDao.getBassechats(basskssj,bassjssj,bassjgdm);
	};
	public List<BasycxModel> getBassxz(String kssj,String jssj,String jgdm,String ssbm){
		return basscxDao.getBassxz(kssj,jssj,jgdm,ssbm);
	}
	
	@Override
	public BaseMybatisDao<BasycxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return basscxDao;
	}

}
