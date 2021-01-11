package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.BassDao;
import com.wondersgroup.wszygl.model.BassModel;
@Component
public class BassManger extends BaseMybatisManager<BassModel,String>{
	@Autowired
	private BassDao bassdao;
	
	
	
	public List<BassModel> getBajgFx(String kssj,String jssj,String jgdm) {
		return bassdao.getBajgFx(kssj,jssj,jgdm);
	}
	public List<BassModel> getechrs03List(String kssj,String jssj,String jgdm) {
		return bassdao.getechrs03List(kssj,jssj,jgdm);
	}
	public List<BassModel> getbassKsxz(String jgdm,String kssj,String jssj) {
		return bassdao.getbassKsxz(jgdm,kssj,jssj);
	}
	
	public List<BassModel> getechars02(String kssj,String jssj,String jgdm) {
		return bassdao.getechars02(kssj,jssj,jgdm);
	}
	public  String getMinSwsj() {
		return bassdao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return bassdao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<BassModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return bassdao;
	}

}
