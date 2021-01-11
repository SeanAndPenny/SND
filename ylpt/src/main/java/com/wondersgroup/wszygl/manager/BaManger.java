package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.BaDao;
import com.wondersgroup.wszygl.model.BaModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
@Component
public class BaManger extends BaseMybatisManager<BaModel,String>{
	@Autowired
	private BaDao badao;
	
	public List<BaModel> getbazh(String kssj,String jssj,String jgdm) {
		return badao.getbazh(kssj,jssj,jgdm);
	}
	public List<BaModel> getbajc(String kssj,String jssj,String jgdm) {
		return badao.getbajc(kssj,jssj,jgdm);
	}
	public List<BaModel>getbaJbdl(String kssj,String jssj,String jgdm) {
		return badao.getbaJbdl(kssj,jssj,jgdm);
	}
	public List<BaModel>getechars04(String jbflbm,String jgdm,String kssj,String jssj) {
		return badao.getechars04(jbflbm,jgdm,kssj,jssj);
	}
	public List<BaModel>getbafxKsxz(String jgdm,String kssj,String jssj) {
		return badao.getbafxKsxz(jgdm,kssj,jssj);
	}
	
	public List<SwxxJgdmModel>getbajgList(String jgdm){
		return badao.getbajgList(jgdm);
	}
	public  String getMinSwsj() {
		return badao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return badao.getMaxSwsj();
	}

	@Override
	public BaseMybatisDao<BaModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return badao;
	}
}
