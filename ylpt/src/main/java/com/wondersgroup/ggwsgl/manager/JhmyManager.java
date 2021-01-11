package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.JhmyDao;
import com.wondersgroup.ggwsgl.model.JhmyModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;


@Component
public class JhmyManager extends BaseMybatisManager<JhmyModel, String> {
	@Autowired
	private JhmyDao jhmyDao;

	@Override
	public BaseMybatisDao<JhmyModel, String> getBaseDao() {
		return jhmyDao;
	}
	public List<YljgModel> getAllYljg(){
		return jhmyDao.getAllYljg();
	}
	public List<TbModel> getAllTb(String yljgdm,String startdate,String enddate,String mid){
		return jhmyDao.getAllTb(yljgdm, startdate, enddate,mid);
	}
}
