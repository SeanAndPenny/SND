package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.FyjkDao;
import com.wondersgroup.ggwsgl.model.FyjkModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;


@Component
public class FyjkManager extends BaseMybatisManager<FyjkModel, String> {
	@Autowired
	private FyjkDao fyjkDao;

	@Override
	public BaseMybatisDao<FyjkModel, String> getBaseDao() {
		return fyjkDao;
	}
	public List<YljgModel> getAllYljg(){
		return fyjkDao.getAllYljg();
	}
	public List<TbModel>getAllTb(String yljgdm,String startdate,String enddate,String sfzh){
		return fyjkDao.getAllTb(yljgdm, startdate, enddate,sfzh);
	}

}
