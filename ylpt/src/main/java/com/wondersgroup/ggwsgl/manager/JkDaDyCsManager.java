package com.wondersgroup.ggwsgl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wondersgroup.api.mybatis.dao.BaseMybatisDao;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.ggwsgl.dao.JkDaDyCsDao;
import com.wondersgroup.ggwsgl.model.JkDaDyCsModel;
import com.wondersgroup.ggwsgl.model.YljgModel;
 
@Component
public class JkDaDyCsManager  extends BaseMybatisManager<JkDaDyCsModel,String>{
	@Autowired
	private JkDaDyCsDao jkdadyCsDao;
	@Override
	public BaseMybatisDao<JkDaDyCsModel, String> getBaseDao() {
		// TODO Auto-generated method stub
		return jkdadyCsDao;
	}
	
	public List<YljgModel>getAllYljg(){
		return jkdadyCsDao.getAllYljg();
	}
	
	

}
