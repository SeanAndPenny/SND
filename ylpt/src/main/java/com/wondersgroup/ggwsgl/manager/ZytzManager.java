package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.ZytzDao;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
import com.wondersgroup.ggwsgl.model.ZytzModel;
@Component
public class ZytzManager extends BaseMybatisManager<ZytzModel,String>{
	
	@Autowired
	private ZytzDao zytzDao;
	
	@Override
	public BaseMybatisDao<ZytzModel, String> getBaseDao() {
		
		return zytzDao;
	}
	public List<YljgModel>getAllYljg(){
		return zytzDao.getAllYljg();
	}
	public List<TbModel>getAllTb(String yljgdm,String startdate,String enddate){
		return zytzDao.getAllTb(yljgdm, startdate, enddate);
	}

}
