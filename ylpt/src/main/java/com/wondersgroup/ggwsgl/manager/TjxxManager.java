package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.TjxxDao;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.TjxxDetailModel;
import com.wondersgroup.ggwsgl.model.TjxxModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Component
public class TjxxManager extends BaseMybatisManager<TjxxModel,String>{
	
	@Autowired
	private TjxxDao tjxxDao;
	
	@Override
	public BaseMybatisDao<TjxxModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return tjxxDao;
	}
	public List<YljgModel> getAllYljg(){
		return tjxxDao.getAllYljg();
	}
	public List<TbModel> getAllTb(String yljgdm,String startdate,String enddate){
		return tjxxDao.getAllTb(yljgdm, startdate, enddate);
	}
	public List<TjxxDetailModel>getTjxxDetail(String tjbh,String yljgdm){
		return tjxxDao.getTjxxDetail(tjbh, yljgdm);
	}
}
