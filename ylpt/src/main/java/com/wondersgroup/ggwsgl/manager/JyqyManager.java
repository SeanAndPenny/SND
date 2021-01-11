package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.JyqyDao;
import com.wondersgroup.ggwsgl.model.JyqyModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Component
public class JyqyManager extends BaseMybatisManager<JyqyModel,String>{
	
	@Autowired
	private JyqyDao jyqyDao;
	@Override
	public BaseMybatisDao<JyqyModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jyqyDao;
	}
	public List<YljgModel> getAllYljg(){
		return jyqyDao.getAllYljg();
	}
	public List<TbModel> getAllTb(String yljgdm,String startdate,String enddate){
		return jyqyDao.getAllTb(yljgdm, startdate, enddate);
	}

}
