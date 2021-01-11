package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.JkdaglfxDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.jkdaglfxModel;

@Component
public class JkdaglfxManger extends BaseMybatisManager<jkdaglfxModel,String>{
	
	@Autowired
	private  JkdaglfxDao jkdaglfxDao;
	
	public List<jkdaglfxModel> getyjdfx(String kssj,String jssj,String jgdm,String sjlx){
		return jkdaglfxDao.getyjdfx(kssj,jssj,jgdm,sjlx);
	}
	public List<jkdaglfxModel> getjdqsfx(String kssj,String jssj,String jgdm,String sjlx,String jdrqgs){
		return jkdaglfxDao.getjdqsfx(kssj,jssj,jgdm,sjlx,jdrqgs);
	}
	public String getczrkzs(String jgdm) {
		return jkdaglfxDao.getczrkzs(jgdm);
	}
	public String getldrkzs(String jgdm) {
		return jkdaglfxDao.getldrkzs(jgdm);
	}
	public List<SwxxJgdmModel> getjdjgList(String jgdm) {
		return jkdaglfxDao.getjdjgList(jgdm);
	}
	public List<jkdaglfxModel> getdjdfx(String jgdm) {
		return jkdaglfxDao.getdjdfx(jgdm);
	}
	public String getMinJdsj() {
		return jkdaglfxDao.getMinJdsj();
	}
	public String getMaxJdsj() {
		return jkdaglfxDao.getMaxJdsj();
	}
	public String getMaxJdsjs() {
		return jkdaglfxDao.getMaxJdsjs();
	}
	@Override
	public BaseMybatisDao<jkdaglfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jkdaglfxDao;
	}
}
