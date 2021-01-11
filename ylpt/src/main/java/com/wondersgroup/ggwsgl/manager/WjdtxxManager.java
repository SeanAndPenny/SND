package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.WjdtxxDao;
import com.wondersgroup.ggwsgl.model.CkztModel;
import com.wondersgroup.ggwsgl.model.WJDTX;
import com.wondersgroup.ggwsgl.model.WjdtxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
@Component
public class WjdtxxManager extends BaseMybatisManager<WjdtxxModel,String>{
	
	@Autowired
	private WjdtxxDao wjdtxxDao;
	
	@Override
	public BaseMybatisDao<WjdtxxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return wjdtxxDao;
	}
	public List<YljgModel> getAllYljg(){
		return wjdtxxDao.getAllYljg();
	}
	public List<CkztModel> getAllCkzt(){
		return wjdtxxDao.getAllCkzt();
	}
	public WjdtxxModel getWjktx(String yljgdm,String zjhm,String xm){
		return wjdtxxDao.getWjktx(yljgdm,zjhm,xm);
	}
	
	public void updatetxzt(String zjhm){
		wjdtxxDao.updatetxzt(zjhm);
	}
	public void updaLnrGwTx(String zjhm) {
		wjdtxxDao.updaLnrGwTx(zjhm);
	}
	public WjdtxxModel getLnrGwTx(String yljgdm,String zjhm,String xm){
		return wjdtxxDao.getLnrGwTx(yljgdm,zjhm,xm);
	}
}
