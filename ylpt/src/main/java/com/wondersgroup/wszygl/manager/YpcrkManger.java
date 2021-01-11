package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YpcrkDao;
import com.wondersgroup.wszygl.model.YpcrkModel;
@Component
public class YpcrkManger extends BaseMybatisManager<YpcrkModel,String>{
	@Autowired
	private YpcrkDao ypcrkdao;
	public List<YpcrkModel> getypzh(String kssj,String jssj,String jgdm) {
		return ypcrkdao.getypzh(kssj,jssj,jgdm);
	}
	public String getypcrjglxk(String jgdm) {
		return ypcrkdao.getypcrjglxk(jgdm);
	}
	public List<YpcrkModel> getypjc(String kssj,String jssj,String jgdm) {
		return ypcrkdao.getypjc(kssj,jssj,jgdm);
	}
	public List<YpcrkModel> getechars03List(String kssj,String jssj,String jgdm) {
		return ypcrkdao.getechars03List(kssj,jssj,jgdm);
	}
	
	public List<YpcrkModel> getechars04List(String kssj,String jssj,String jgdm) {
		return ypcrkdao.getechars04List(kssj,jssj,jgdm);
	}
	public List<YpcrkModel> getechars05List(String kssj,String jssj,String jgdm) {
		return ypcrkdao.getechars05List(kssj,jssj,jgdm);
	}
	
	 

	@Override
	public BaseMybatisDao<YpcrkModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return ypcrkdao;
	}

}
