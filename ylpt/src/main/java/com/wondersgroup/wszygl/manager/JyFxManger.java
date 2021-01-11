package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JyFxDao;
import com.wondersgroup.wszygl.model.JyFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Component
public class JyFxManger extends BaseMybatisManager<JyFxModel,String>{
	@Autowired
	private  JyFxDao jcyFxdao;
	
	
	public List<SwxxJgdmModel> getjyjgList(String jgdm){
		return jcyFxdao.getjyjgList(jgdm);
	}
	
	public List<JyFxModel> getjyfxList(String kssj,String jssj,String jgdm){
		return jcyFxdao.getjyfxList(kssj,jssj,jgdm);
	}
	public List<JyFxModel> getjyjcfxList(String kssj,String jssj,String jgdm){
		return jcyFxdao.getjyjcfxList(kssj,jssj,jgdm);
	}
	public List<JyFxModel> getechars(String kssj,String jssj,String jgdm,String yylb){
		return jcyFxdao.getechars(kssj,jssj,jgdm,yylb);
	}
	public String getMinSwsj() {
		return jcyFxdao.getMinSwsj();
	}
	public String getMaxSwsj() {
		return jcyFxdao.getMaxSwsj();
	}
	
	
	
	@Override
	public BaseMybatisDao<JyFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jcyFxdao;
	}

}
