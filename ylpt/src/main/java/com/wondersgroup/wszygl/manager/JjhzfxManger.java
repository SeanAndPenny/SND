package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JjhzfxDao;
import com.wondersgroup.wszygl.model.JjsjFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
@Component
public class JjhzfxManger extends BaseMybatisManager<JjsjFxModel,String>{
	@Autowired
	private JjhzfxDao jjhzfxdao;
	
	public List<JjsjFxModel>getchart01List(String kssj,String jssj,String jgdm ) {
		return jjhzfxdao.getchart01List(kssj,jssj,jgdm);
	}
	public List<JjsjFxModel>getchart02List(String kssj,String jssj,String jgdm  ) {
		return jjhzfxdao.getchart02List(kssj,jssj,jgdm);
	}
	public List<JjsjFxModel>getchart03List(String kssj,String jssj,String jgdm  ) {
		return jjhzfxdao.getchart03List(kssj,jssj,jgdm);
	}
	public List<JjsjFxModel>getchart04List(String kssj,String jssj,String jgdm  ) {
		return jjhzfxdao.getchart04List(kssj, jssj,jgdm);
	}
	public List<JjsjFxModel>getchart05List(String kssj,String jssj ,String jgdm ) {
		return jjhzfxdao.getchart05List(kssj,jssj,jgdm);
	}
	public List<SwxxJgdmModel>getbajgList(String jgdm ) {
		return jjhzfxdao.getbajgList(jgdm);
	}
	@Override
	public BaseMybatisDao<JjsjFxModel, String> getBaseDao() {
		return jjhzfxdao;
	}

}
