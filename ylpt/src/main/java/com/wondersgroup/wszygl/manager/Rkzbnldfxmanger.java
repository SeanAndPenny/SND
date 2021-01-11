package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.RkzbnldfxDao;
import com.wondersgroup.wszygl.model.xxxblModel;
@Component
public class Rkzbnldfxmanger  extends BaseMybatisManager<xxxblModel,String>{
	@Autowired
	  private RkzbnldfxDao  rkzbnldfxDao;
	 
	 public  List <xxxblModel>   getnlbllist(String kssj,String jssj,String jgdm){
			return rkzbnldfxDao.getnlbllist(kssj,jssj,jgdm);
		}
	@Override
	public BaseMybatisDao<xxxblModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return rkzbnldfxDao;
	}
}
