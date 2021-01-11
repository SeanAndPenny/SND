package com.wondersgroup.wszygl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.MzjfxDao;
import com.wondersgroup.wszygl.model.MjzywFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
@Component
public class MzjfxManger extends BaseMybatisManager<MjzywFxModel,String>{
	@Autowired
	private  MzjfxDao mzjfxdao;
	public List<MjzywFxModel> getMzjfx(String kssj,String jssj,String jgdm){
		return mzjfxdao.getMzjfx(kssj,jssj,jgdm);
	}
	public List<MjzywFxModel>getMzjjcfx(String kssj,String jssj,String jgdm){
		return mzjfxdao.getMzjjcfx(kssj,jssj,jgdm);
	}
	public List<MjzywFxModel>getMzJbfl(String kssj,String jssj,String jgdm){
		return mzjfxdao.getMzJbfl(kssj,jssj,jgdm);
	}
	public List<MjzywFxModel>getMjzywecharts(String jgdm,String kssj,String jssj){
		return mzjfxdao.getMjzywecharts(jgdm,kssj,jssj);
	}
	public List<SwxxJgdmModel>getmjzjgList(String jgdm){
		return mzjfxdao.getmjzjgList(jgdm);
	}
	public List<MjzywFxModel>getechars03( String jgdm,String kssj,String jssj ){
		return mzjfxdao.getechars03(jgdm,kssj,jssj);
	}
	public List<MjzywFxModel>getechars04(String jbflbm,String jgdm,String kssj,String jssj ){
		return mzjfxdao.getechars04(jbflbm,jgdm,kssj,jssj);
	}
	public String getMinSwsj() {
		return mzjfxdao.getMinSwsj();
	}
	public String getMaxSwsj() {
		return mzjfxdao.getMaxSwsj();
	}
	@Override
	public BaseMybatisDao<MjzywFxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return mzjfxdao;
	}
}
