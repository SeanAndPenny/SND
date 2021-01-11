package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.SwxxFxDao;
import com.wondersgroup.wszygl.model.SwxxFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;

@Component
public class SwxxFxManger extends BaseMybatisManager<SwxxFxModel,String>{
	@Autowired
	private SwxxFxDao swxxfxDao;
	
	public List<SwxxFxModel> getswxxfx(String ksnf,String jsnf,String jgdm) {
		return swxxfxDao.getswxxfx(ksnf,jsnf,jgdm);
	}
	public List<SwxxFxModel> getswxxnldfx(String ksnf,String jsnf,String jgdm) {
		return swxxfxDao.getswxxnldfx(ksnf,jsnf,jgdm);
	}
	public List<SwxxFxModel> getSyfxnlList(String ksnf,String jsnf,String jgdm,String sjlx) {
		return swxxfxDao.getSyfxnlList(ksnf,jsnf,jgdm,sjlx);
	}
	public List<SwxxFxModel> getsyflfxList(String ksnf,String jsnf,String jgdm,String sjlx) {
		return swxxfxDao.getsyflfxList(ksnf,jsnf,jgdm,sjlx);
	}
	public List<SwxxFxModel> getSwechats(String nf,String jgdm){
		return swxxfxDao.getSwechats(nf,jgdm);
	}
	public List<SwxxFxModel> getechars06(String ksnf,String jsnf,String jgdm,String nldbm1,String nldbm2,String sjlx){
		return swxxfxDao.getechars06(ksnf,jsnf,jgdm,nldbm1,nldbm2,sjlx);
	}
	public List<SwxxFxModel> getechars09(String ksnf,String jsnf,String jgdm,String jbbm,String sjlx){
		return swxxfxDao.getechars09(ksnf,jsnf,jgdm,jbbm,sjlx);
	}
	public List<SwxxFxModel> getechars07(String ksnf,String jsnf,String jgdm,String nldbm1,String nldbm2,String sjlx){
		return swxxfxDao.getechars07(ksnf,jsnf,jgdm,nldbm1,nldbm2,sjlx);
	}
	public  List<SwxxJgdmModel> getswjdList(String jgdm){
		return swxxfxDao.getswjdList(jgdm);
	}
	public String getMinSwsj() {
		return swxxfxDao.getMinSwsj();
	}
	public String getMaxSwsj() {
		return swxxfxDao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<SwxxFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return swxxfxDao;
	}

}
