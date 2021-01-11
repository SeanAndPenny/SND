package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JcFxDao;
import com.wondersgroup.wszygl.model.JcFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;


@Component
public class JcFxManger extends BaseMybatisManager<JcFxModel,String>{
	@Autowired
	private  JcFxDao jcFxdao;
	
	public List<SwxxJgdmModel> getjcjgList(String jgdm){
		return jcFxdao.getjcjgList(jgdm);
	}
	
	public List<JcFxModel> getjcfxList(String kssj,String jssj,String jgdm){
		return jcFxdao.getjcfxList(kssj,jssj,jgdm);
	}
	public List<JcFxModel> getjcjcfxList(String kssj,String jssj,String jgdm){
		return jcFxdao.getjcjcfxList(kssj,jssj,jgdm);
	}
	public List<JcFxModel> getechars(String kssj,String jssj,String jgdm,String yylb){
		return jcFxdao.getechars(kssj,jssj,jgdm,yylb);
	}
	public String getMinSwsj() {
		return jcFxdao.getMinSwsj();
	}
	public String getMaxSwsj() {
		return jcFxdao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<JcFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jcFxdao;
	}

}
