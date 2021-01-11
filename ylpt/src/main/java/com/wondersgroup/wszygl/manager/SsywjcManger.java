package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.wszygl.dao.SsywjcDao;
import com.wondersgroup.wszygl.model.RylbModel;
import com.wondersgroup.wszygl.model.SsywjcModel;
@Component
public class SsywjcManger extends BaseMybatisManager<SsywjcModel,String>{
	@Autowired
	private SsywjcDao ssywjcDao;
	@Override
	public BaseMybatisDao<SsywjcModel, String> getBaseDao() {
		 
		return ssywjcDao;
	}
	public List<RylbModel> getRylb(){
		return ssywjcDao.getRylb();
	}
	public List<RylbModel> getSslbcx(){
		return ssywjcDao.getSslbcx();
	}
	public List<SsywjcModel>getSsywzs(String ywkssj,String ywjssj,String bz){
		return ssywjcDao.getSsywzs(ywkssj,ywjssj,bz);
	}
	public List<SsywjcModel> getSsywjcechats(String ywkssj,String ywjssj){
		 return ssywjcDao.getSsywjcechats(ywkssj,ywjssj);
	}
  public List<SsywjcModel> getSsywjcjg(String rq) {
	  return ssywjcDao.getSsywjcjg(rq);
	  
  }
}
