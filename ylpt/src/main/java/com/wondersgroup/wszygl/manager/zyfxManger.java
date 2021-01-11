package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.zyfxDao;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.zyfxModel;

@Component
public class zyfxManger extends BaseMybatisManager<zyfxModel, String> {
	@Autowired
	private zyfxDao zyfxdao;

	public List<zyfxModel> getzyfx(String kssj, String jssj, String jgdm) {
		return zyfxdao.getzyfx(kssj, jssj, jgdm);
	}
 public List<SwxxJgdmModel>getzyjgList(String jgdm){
	 return zyfxdao.getzyjgList(jgdm);
 }
 public List<zyfxModel>getechars02(String kssj, String jssj,String jgdm){
	 return zyfxdao.getechars02(kssj, jssj,jgdm);
 }
 public List<zyfxModel>getechars03(String kssj, String jssj,String jgdm){
	 return zyfxdao.getechars03(kssj, jssj,jgdm);
 }
	@Override
	public BaseMybatisDao<zyfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return zyfxdao;
	}

	public String getMinJdsj() {
		return zyfxdao.getMinJdsj();
	}

	public String getMaxJdsj() {
		return zyfxdao.getMaxJdsj();
	}
}
