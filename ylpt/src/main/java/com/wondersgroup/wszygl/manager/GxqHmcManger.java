package com.wondersgroup.wszygl.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.wszygl.dao.GxqHmcDao;
import com.wondersgroup.wszygl.model.GxqHmcModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
@Component
public class GxqHmcManger extends BaseMybatisManager<GxqHmcModel,String>{
	@Autowired
	private GxqHmcDao gxqHmcDao;
	
	public List<GxqHmcModel> getgGxqhmcList(String yljgdm,String tbrq){
		return gxqHmcDao.getgGxqhmcList(yljgdm,tbrq );
	}
	public List<GxqHmcModel> getZsGxqhmcList(String yljgdm,String tbrq){
		return gxqHmcDao.getZsGxqhmcList(yljgdm,tbrq );
	}
	public List<SwxxJgdmModel>  getjgList(){
		return gxqHmcDao.getjgList();
	}
	@Override
	public BaseMybatisDao<GxqHmcModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return gxqHmcDao;
	}

}
