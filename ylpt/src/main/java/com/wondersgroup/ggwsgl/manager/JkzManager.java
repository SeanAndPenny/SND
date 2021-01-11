package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.JkzDao;
import com.wondersgroup.ggwsgl.model.JkzModel;
import com.wondersgroup.ggwsgl.model.TbModel;
import com.wondersgroup.ggwsgl.model.YljgModel;

@Component
public class JkzManager extends BaseMybatisManager<JkzModel,String>{
	
	@Autowired
	private JkzDao jkzDao;
	@Override
	public BaseMybatisDao<JkzModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jkzDao;
	}
	public List<YljgModel>getAllYljg(){
		return jkzDao.getAllYljg();
	}
	public List<TbModel> getAllTb(String yljgdm,String startdate,String enddate){
		return jkzDao.getAllTb(yljgdm, startdate, enddate);
	}

}
