package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.TjfxDao;
import com.wondersgroup.wszygl.model.TjModel;
import com.wondersgroup.wszygl.model.TjxxModel;

@Component
public class Tjfxmanger extends BaseMybatisManager<TjxxModel,String>{
	@Autowired
	private  TjfxDao tjfxdao;
	public  TjModel  getTjbgdbh(String yljgdm,String tjbh){
		return tjfxdao.getTjbgdbh(yljgdm,tjbh);
	}
	public List<TjModel> getTjbgdbhList(String yljgdm,String tjbh){
		return tjfxdao.getTjbgdbhList(yljgdm,tjbh);
	}
	
	@Override
	public BaseMybatisDao<TjxxModel, String> getBaseDao() {
		 
		return tjfxdao;
	}

}
