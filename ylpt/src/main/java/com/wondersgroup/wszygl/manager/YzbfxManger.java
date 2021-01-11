package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.YzbfxDao;
import com.wondersgroup.wszygl.model.YzbfxModel;
@Component
public class YzbfxManger extends BaseMybatisManager<YzbfxModel,String>{
	@Autowired
	private YzbfxDao yzbfxdao;
	
	public List<YzbfxModel> getyzbtj(String kssj,String jssj,String jgdm,String sjlx) {
		return yzbfxdao.getyzbtj(kssj,jssj,jgdm,sjlx);
	}
	public List<YzbfxModel> getzyyzbtj(String kssj,String jssj,String jgdm,String sjlx) {
		return yzbfxdao.getzyyzbtj(kssj,jssj,jgdm,sjlx);
	}
	public List<YzbfxModel> getyzbJgfx(String kssj,String jssj,String jgdm,String sjlx) {
		return yzbfxdao.getyzbJgfx(kssj,jssj,jgdm,sjlx);
	}
	public List<YzbfxModel> getyzbJcfx(String kssj,String jssj,String jgdm,String sjlx) {
		return yzbfxdao.getyzbJcfx(kssj,jssj,jgdm,sjlx);
	}
	
	public List<YzbfxModel>getechar05(String kssj,String jssj,String jgdm,String sjlx) {
		return yzbfxdao.getechar05(kssj,jssj,jgdm,sjlx);
	}
	public  String getMinSwsj() {
		return yzbfxdao.getMinSwsj();
	}
	public  String getMaxSwsj() {
		return yzbfxdao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<YzbfxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return yzbfxdao;
	}
}
